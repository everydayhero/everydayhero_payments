module Payments
  module Client
    class GetPricingSchedule < Operation
      include GetOperation

      def path
        "/financial-contexts/{financial_context_id}/{merchant_id}/pricing-schedule"
      end
    end
  end
end
