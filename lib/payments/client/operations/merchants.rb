module Payments
  module Client
    class CreateMerchant < Operation
      include PostOperation

      def path
        "/merchants/onboard_merchant"
      end
    end

    class UpdateMerchant < Operation
      include PostOperation

      def path
        "/merchants/update_merchant_attributes"
      end
    end

    class GetMerchant < Operation
      include GetOperation

      def path
        "/merchants/{merchant_id}"
      end
    end

    class GetMerchantFinancialReports < Operation
      include GetOperation

      def path
        "/financial-reports"
      end
    end
  end
end
