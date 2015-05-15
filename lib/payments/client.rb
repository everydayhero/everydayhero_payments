require "securerandom"
require "uri_config"

require "payments/client/version"
require "payments/client/config"
require "payments/client/facade"
require "payments/client/gateway"
require "payments/client/operations"

require "payments/client/railtie" if defined?(Rails)

module Payments
  module Client
    ENDPOINT = ENV.fetch("PAYMENTS_API_URL") do
      "https://payments.everydayhero.io/api"
    end
    GATEWAY_ALIASES = {
      http: :excon,
    }
    Error = Class.new(StandardError)

    def self.request_id=(value)
      @request_id = value
    end

    def self.request_id
      @request_id ||= SecureRandom.uuid
    end

    # @example
    #     client = Payments::Client.v1
    #     client = Payments::Client.v1(:rack, Payments::Application)
    #
    #     client.get_merchant(merchant_id)
    def self.v1(name = :http, *gateway_options)
      name = GATEWAY_ALIASES[name] || name
      gateway = Gateway.new(name, Config.new(ENDPOINT), *gateway_options)

      Facade.new(gateway)
    end
  end
end
