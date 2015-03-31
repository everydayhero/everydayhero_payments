$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "payments/client"

def request_id
  "a-request-id"
end

def client
  Payments::Client.request_id = request_id
  Payments::Client.v1.facade
end
