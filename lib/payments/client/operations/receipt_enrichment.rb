module Payments
  module Client
    class GetReceiptEnrichment < Operation
      include GetOperation

      def path
        "/receipt-enrichment/{receipt_number}"
      end
    end
  end
end
