module Payments
  module Client
    class ChangeOrderExtraData < Operation
      include PostOperation

      def path
        "/orders/change_order_extra_data"
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
