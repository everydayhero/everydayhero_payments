require "active_support/notifications"
require "excon"
require "faraday"
require "faraday_middleware"

module Payments
  module Client
    class Gateway
      def initialize(adapter, config, *adapter_options)
        @config = config
        @adapter = adapter
        @adapter_options = adapter_options
      end

      %i(get post put).each do |verb|
        define_method(verb) do |path, params = nil|
          begin
            connection.public_send(verb, prefix(path), params) do |request|
              request.headers["X-Request-Id"] = Payments::Client.request_id
            end
          rescue Faraday::Error
            raise Payments::Client::Error
          end
        end
      end

      private

      def prefix(path)
        @config.path_prefix + path
      end

      def connection
        @connection ||= Faraday.new(url: @config.host) do |connection|
          connection.request :json
          connection.response :mashify
          connection.response :dates
          connection.response :json
          connection.use :instrumentation, name: "client.payments"
          connection.adapter @adapter, *@adapter_options
        end
      end
    end
  end
end
