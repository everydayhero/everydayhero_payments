module Payments
  module Client
    class Facade
      def initialize(gateway)
        @gateway = gateway
      end

      def create_merchant(params)
        perform(CreateMerchant, params)
      end

      def get_merchant(merchant_id)
        perform(GetMerchant, merchant_id: merchant_id)
      end

      def get_merchant_financial_reports(merchant_id)
        perform(GetMerchantFinancialReports, merchant_id: merchant_id)
      end

      def get_financial_context(financial_context_id)
        perform(GetFinancialContext, financial_context_id: financial_context_id)
      end

      def create_financial_context(params)
        perform(CreateFinancialContext, params)
      end

      def update_merchants_in_financial_context(params)
        perform(
          UpdateMerchantsInFinancialContext,
          params.merge(financial_context_id: params["financial_context_id"]),
        )
      end

      def request_receipt_number(order_id)
        perform(RequestReceiptNumber, order_id: order_id)
      end

      def get_receipt_number(order_id)
        perform(GetReceiptNumber, order_id: order_id)
      end

      def get_pricing_schedule(financial_context_id, merchant_id)
        perform(
          GetPricingSchedule,
          financial_context_id: financial_context_id,
          merchant_id: merchant_id,
        )
      end

      private

      def perform(operation, options = {})
        operation.new(@gateway).call(options)
      end
    end
  end
end
