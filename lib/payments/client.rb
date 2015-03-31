require "excon"
require "hashie"
require "json"
require "securerandom"
require "uri_config"

require "payments/client/version"
require "payments/client/config"
require "payments/client/facade"
require "payments/client/http"
require "payments/client/operations"

require "payments/client/railtie" if defined?(Rails)

module Payments
  module Client
    def self.request_id=(value)
      @request_id = value
    end

    def self.request_id
      @request_id ||= SecureRandom.uuid
    end

    def self.v1
      V1.new
    end

    class V1
      ENDPOINT = ENV.fetch("PAYMENTS_API_URL") do
        "https://payments.everydayhero.io/api"
      end

      # Returns a thin wrapper around the Payments HTTP API.
      #
      # @param url [String] location of Payments API
      # @return [Payments::Client::HTTP]
      # @example
      #     http = Payments::Client.v1.http
      #     puts http.get("/merchants/{id}")
      def http(url = ENDPOINT)
        HTTP.new(Config.new(url).config)
      end

      # Returns a high level wrapper around the Payments HTTP API.
      #
      # @param url [String] location of Payments API
      # @return [Payments::Client::Facade]
      # @example
      #     client = Payments::Client.v1.facade
      #     puts client.get_merchant(id)
      def facade(*args)
        Facade.new(http(*args))
      end
    end
  end
end
