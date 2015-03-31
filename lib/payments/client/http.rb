module Payments
  module Client
    class HTTP
      def initialize(host:)
        @host = host
      end

      def post(path, body = {})
        Excon.post(
          @host + path,
          headers: {
            "Content-Type" => "application/json",
            "Accept" => "application/json",
            "X-Request-Id" => Payments::Client.request_id,
          },
          body: body.to_json,
        )
      end

      def get(path, query = {})
        Excon.get(
          @host + path,
          headers: {
            "Content-Type" => "application/json",
            "Accept" => "application/json",
            "X-Request-Id" => Payments::Client.request_id,
          },
        )
      end
    end
  end
end
