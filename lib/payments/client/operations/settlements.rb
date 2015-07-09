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

    class GetAccountStatement < Operation
      include GetOperation
      include WithoutDefaultMiddleware

      def path
        "/settlements/{settlement_id}/account-statement/{account_id}"
      end
    end
  end
end
