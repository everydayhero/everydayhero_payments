module Payments
  module Client
    class Config < URIConfig::Config
      map :host, from: :base_uri

      config :host
    end
  end
end
