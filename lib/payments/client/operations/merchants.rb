module Payments
  module Client
    class CreateMerchant < Operation
      include PostOperation

      def path
        "/merchants"
      end
    end

    class GetMerchant < Operation
      include GetOperation

      def path
        "/merchants/{merchant_id}"
      end
    end
  end
end
