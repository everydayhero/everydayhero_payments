module Payments
  module Client
    class GetFinancialContext < Operation
      include GetOperation

      def path
        "/financial-contexts/{financial_context_id}"
      end
    end

    class CreateFinancialContext < Operation
      include PostOperation

      def path
        "/financial-contexts"
      end
    end

    class UpdateMerchantsInFinancialContext < Operation
      include PutOperation

      def path
        "/financial-contexts/{financial_context_id}/merchants"
      end
    end
  end
end
