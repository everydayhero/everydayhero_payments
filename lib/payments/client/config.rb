module Payments
  module Client
    class Config < URIConfig::Config
      map :host, from: :base_uri
      map :path_prefix, from: :path
    end
  end
end
