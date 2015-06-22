module Payments
  module Client
    class GetDonationTransactionDetailReport < Operation
      include GetOperation

      def path
        "/settlements/{settlement_id}/donation-transaction-detail-report"
      end
    end

    class GetAccountDonationTransactionDetailReport < Operation
      include GetOperation

      def path
        "/settlements/{settlement_id}/donation-transaction-detail-report/{account_id}"
      end
    end
  end
end
