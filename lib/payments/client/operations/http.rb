module Payments
  module Client
    class Operation
      def initialize(gateway)
        @gateway = gateway
      end

      def call(other_options = {})
        my_options = options.merge(other_options)
        response = @gateway.public_send(
          method,
          actual_path(my_options),
          my_options,
        )

        JSON.parse(response.body)
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
      def method
        :get
      end
    end

    module PostOperation
      def method
        :post
      end
    end

    module PutOperation
      def method
        :put
      end
    end
  end
end
