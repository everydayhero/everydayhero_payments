module Payments
  module Client
    class GetReceiptNumber < Operation
      include GetOperation

      def path
        "/receipt-numbers/{order_id}"
      end
    end

    class RequestReceiptNumber < Operation
      include PutOperation

      def path
        "/receipt-numbers/{order_id}"
      end
    end
  end
end
