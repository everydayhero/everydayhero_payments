module Payments
  module Client
    class RequestOrderVoid < Operation
      include PostOperation

      def path
        "/orders/request_order_void"
      end
    end

    class ChangeOrderExtraData < Operation
      include PostOperation

      def path
        "/orders/change_order_extra_data"
      end
    end

    class FundOrder < Operation
      include PostOperation

      def path
        "/orders/fund_order"
      end
    end

    class FundOrderViaTNSWithFees < Operation
      include PostOperation

      def path
        "/orders/fund_order_via_tns_with_applied_fees"
      end
    end

    class FundOrderViaTNSWithoutFees < Operation
      include PostOperation

      def path
        "/orders/fund_order_via_tns_without_applied_fees"
      end
    end

    class PlaceOrder < Operation
      include PostOperation

      def path
        "/salamander/orders"
      end
    end
  end
end
