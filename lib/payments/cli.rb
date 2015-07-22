require "thor"
require "payments/client"
require 'pp'

module Payments
  class CLI < Thor
    CLIENT = Client.v1

    desc "get_merchant MERCHANT_ID", "get a merchant by MERCHANT_ID"
    def get_merchant(merchant_id)
      response = CLIENT.get_merchant(merchant_id)
      response = response.body

      table = []
      table << ["ID", response.merchant_id]
      table << ["Name", response.name]
      table << ["Region Code", response.region_code]
      table << ["Financial Contexts", response.financial_context_ids.join(", ")]

      print_table table
    end

    desc "get_donation_transaction_detail_report SETTLEMENT_ID", "nope"
    def get_donation_transaction_detail_report(settlement_id)
      response = CLIENT.get_donation_transaction_detail_report(settlement_id)

      pp response.body.map(&:to_hash)
    end

    desc "get_account_donation_transaction_detail_report SETTLEMENT_ID", "nope"
    def get_account_donation_transaction_detail_report(settlement_id, account_id)
      response = CLIENT.get_account_donation_transaction_detail_report(settlement_id, account_id)

      pp response.body.map(&:to_hash)
    end

    desc "get_receipt_number ORDER_ID", "get a receipt number by ORDER_ID"
    def get_receipt_number(order_id)
      response = CLIENT.get_receipt_number(order_id)

      table = []
      table << ["Region Code", response.region_code]
      table << ["Receipt Number", response.receipt_number]
      table << ["Order ID", response.order_id]

      print_table table
    end

    desc "get_pricing_schedule FINANCIAL_CONTEXT_ID MERCHANT_ID", "get the pricing schedule for a merchant in a financial context"
    def get_pricing_schedule(financial_context_id, merchant_id)
      response = CLIENT.get_pricing_schedule(financial_context_id, merchant_id)

      table = []
      table << ["Financial Context", financial_context_id]
      table << ["Merchant", merchant_id]

      print_table table
    end
  end
end
