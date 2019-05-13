module Payments
  module Client
    class GetReceiptEnrichment < Operation
      include GetOperation

      def path
        "/receipt-enrichment/{order_id}"
      end
    end
  end
end
