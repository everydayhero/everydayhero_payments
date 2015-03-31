module Payments
  module Client
    class GetFinancialContext < Operation
      include GetOperation

      def path
        "/financial-contexts/{financial_context_id}"
      end
    end
  end
end
