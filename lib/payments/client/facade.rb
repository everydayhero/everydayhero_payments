module Payments
  module Client
    class Facade
      def initialize(gateway)
        @gateway = gateway
      end

      def create_merchant(params)
        perform(CreateMerchant, params)
      end

      def update_merchant(params)
        perform(UpdateMerchant, params)
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
        perform(UpdateMerchantsInFinancialContext, params)
      end

      def change_financial_context_contract(params)
        perform(ChangeFinancialContextContract, params)
      end

      def request_receipt_number(region_code, order_id)
        perform(
          RequestReceiptNumber,
          region_code: region_code,
          order_id: order_id,
        )
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

      def get_donation_transaction_detail_report(settlement_id)
        perform(
          GetDonationTransactionDetailReport,
          settlement_id: settlement_id,
        )
      end

      def get_account_donation_transaction_detail_report(settlement_id, account_id)
        perform(
          GetAccountDonationTransactionDetailReport,
          settlement_id: settlement_id,
          account_id: account_id,
        )
      end

      def get_account_statement(settlement_id, account_id)
        perform(
          GetAccountStatement,
          settlement_id: settlement_id,
          account_id: account_id,
        )
      end

      def change_order_extra_data(params)
        perform(ChangeOrderExtraData, params)
      end

      def place_order(params)
        perform(PlaceOrder, params)
      end

      def fund_order_via_tns_with_fees(params)
        perform(FundOrderViaTNSWithFees, params)
      end

      def fund_order_via_tns_without_fees(params)
        perform(FundOrderViaTNSWithoutFees, params)
      end

      def request_order_void(params)
        perform(RequestOrderVoid, params)
      end

      def get_fees(manifest)
        perform(GetFees, manifest: manifest)
      end

      private

      def perform(operation, options = {})
        operation.new(@gateway).call(options)
      end
    end
  end
end
