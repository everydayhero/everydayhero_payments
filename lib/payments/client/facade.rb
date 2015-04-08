module Payments
  module Client
    class Facade
      def initialize(http)
        @http = http
      end

      def create_merchant(options)
        perform(CreateMerchant, options)
      end

      def get_merchant(merchant_id)
        perform(GetMerchant, merchant_id: merchant_id)
      end

      def get_financial_context(financial_context_id)
        perform(GetFinancialContext, financial_context_id: financial_context_id)
      end

      def create_financial_context(params)
        perform(CreateFinancialContext, params)
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
        result(operation.new(@http).call(options))
      end

      def result(response)
        Hashie::Mash.new(response)
      end
    end
  end
end
