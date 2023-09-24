# frozen_string_literal: true

require "dry-monads"

module TagTango
  module Core
    # Mix-in module defining main interface of callable classes.
    #
    # Callable classes must implement {#call} which must return
    # an instance of +Dry::Monads::Result+.
    module Callable
      include Dry::Monads::Result::Mixin

      # Class methods mix-in for {Callable}.
      module ClassMethods
        private

        # @visibility public
        # @overload do_for(name, name2, ...)
        #   Include +Dry::Monads::Do+ for specified methods.
        #
        #   @param name [Symbol]
        def do_for(...)
          include Dry::Monads::Do.for(...)
        end
      end

      class << self
        private

        def included(klass)
          klass.extend(ClassMethods)
        end
      end

      # A single empty Success instance to not waste memory.
      SUCCESS = Dry::Monads::Result.pure.freeze

      # @return [Success]
      # @return [Failure(Symbol)]
      def call(*)
        raise NotImplementedError
      end

      private

      # @!method Success(value)
      #   @return [Dry::Monads::Result::Success<Object>]
      # @!method Failure(value)
      #   @return [Dry::Monads::Result::Failure<Object>]
      private :Success, :Failure

      # Return empty Success singleton.
      #
      # @return [Dry::Monads::Result::Success]
      def success
        self.class::SUCCESS
      end
    end
  end
end
