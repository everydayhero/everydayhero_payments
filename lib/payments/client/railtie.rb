require "payments/client/request_id"

module Payments
  module Client
    class Railtie < ::Rails::Railtie
      initializer "payments-client.request_id" do |app|
        app.middleware.insert_after ActionDispatch::RequestId, RequestId
      end
    end
  end
end
