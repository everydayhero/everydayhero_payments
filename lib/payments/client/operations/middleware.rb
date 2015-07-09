module Payments
  module Client
    module DefaultMiddleware
      def call(*args)
        with_default_middleware { super }
      end

      private def with_default_middleware
        with_middleware(response: %i(mashify dates json)) do
          yield
        end
      end
    end

    module WithoutDefaultMiddleware
      private def with_default_middleware
        yield
      end
    end
  end
end
