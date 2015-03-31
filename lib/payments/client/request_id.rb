module Payments
  module Client
    class RequestId
      def initialize(app)
        @app = app
      end

      def call(env)
        Payments::Client.request_id = env["action_dispatch.request_id"]

        @app.call(env)
      end
    end
  end
end
