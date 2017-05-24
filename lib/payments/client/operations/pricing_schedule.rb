module Payments
  module Client
    class GetPricingSchedule < Operation
      include GetOperation

      def path
        "/financial-contexts/{financial_context_id}/{merchant_id}/pricing-schedule"
      end
    end

    class GetPricing < Operation
      include GetOperation

      def path
        "/salamander/pricing"
      end
    end
  end
end
