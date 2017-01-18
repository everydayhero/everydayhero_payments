require "active_support/notifications"
require "excon"
require "faraday"
require "faraday_middleware"

module Payments
  module Client
    class Gateway
      def initialize(adapter, config, *adapter_options, connection: nil)
        @config = config
        @adapter = adapter
        @adapter_options = adapter_options
        @connection = connection
      end

      %i(get post put).each do |verb|
        define_method(verb) do |path, params = nil|
          begin
            connection.public_send(verb, prefix(path), params) do |request|
              request.headers["X-Request-Id"] = Payments::Client.request_id
            end
          rescue Faraday::Error => e
            raise Payments::Client::Error.new(e.message)
          end
        end
      end

      def with_middleware(keep: true, response: nil)
        new_connection = connection.dup
        new_connection.build(keep: keep) do |builder|
          Array(response).each do |middleware|
            builder.response middleware
          end
        end

        self.class.new(
          @adapter,
          @config,
          *@adapter_options,
          connection: new_connection,
        )
      end

      private

      def prefix(path)
        @config.path_prefix + path
      end

      def connection
        @connection ||= Faraday.new(url: @config.host) do |connection|
          connection.request :json
          connection.basic_auth @config.username, @config.password
          connection.use :instrumentation, name: "client.payments"
          connection.adapter @adapter, *@adapter_options
        end
      end
    end
  end
end
