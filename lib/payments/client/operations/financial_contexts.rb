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
  end
end
