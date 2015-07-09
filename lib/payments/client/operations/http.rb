module Payments
  module Client
    class Operation
      def initialize(gateway)
        @gateway = gateway
      end

      def call(other_options = {})
        my_options = options.merge(other_options)
        @gateway.public_send(
          method,
          actual_path(my_options),
          my_options,
        )
      end

      protected

      def with_middleware(*args)
        previous_gateway = @gateway
        @gateway = @gateway.with_middleware(*args)
        yield
      ensure
        @gateway = previous_gateway
      end

      private

      def options
        {}
      end

      def actual_path(options)
        path.gsub(/{([^}]+)}/) do |_key|
          value = options.fetch($1.to_sym)
          options.delete($1.to_sym)
          value
        end
      end
    end

    module GetOperation
      include DefaultMiddleware

      def method
        :get
      end
    end

    module PostOperation
      include DefaultMiddleware

      def method
        :post
      end
    end

    module PutOperation
      include DefaultMiddleware

      def method
        :put
      end
    end
  end
end
