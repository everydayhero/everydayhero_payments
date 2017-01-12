module Payments
  module Client
    class GetFees < Operation
      include PostOperation

      def path
        "/fees"
      end
    end
  end
end
