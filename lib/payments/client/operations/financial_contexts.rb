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
        "/financial-contexts/notice_financial_context"
      end
    end

    class UpdateMerchantsInFinancialContext < Operation
      include PostOperation

      def path
        "/financial-contexts/change_merchants_in_financial_context"
      end
    end

    class ChangeFinancialContextContract < Operation
      include PostOperation

      def path
        "/financial-contexts/change_financial_context_contract"
      end
    end
  end
end
