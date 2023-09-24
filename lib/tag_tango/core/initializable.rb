# frozen_string_literal: true

require "dry-initializer"

module TagTango
  module Core
    # Mix-in module to make working with Dry::Initializer more streamlined.
    module Initializable
      # Class methods mix-in for {Initializable}.
      module ClassMethods
        private

        # Add or redefine a positional parameter, private by default.
        #
        # @visibility public
        # @param name [Symbol]
        # @param type [#call, nil]
        # @option opts [Proc] :default
        # @option opts [Boolean] :optional
        # @option opts [Symbol] :as
        # @option opts [true, false, :protected, :public, :private] :reader
        # @yield block with nested definition
        # @return [self] itself
        def param(name, type = nil, **opts, &)
          super(name, type, reader: :private, **opts, &)
        end

        # Add or redefine a keyword parameter, private by default.
        #
        # @visibility public
        # @param  (see #param)
        # @option (see #param)
        # @yield  (see #param)
        # @return (see #param)
        def option(name, type = nil, **opts, &)
          super(name, type, reader: :private, **opts, &)
        end
      end

      class << self
        private

        def included(klass)
          super
          klass.extend(::Dry::Initializer) unless klass.singleton_class < ::Dry::Initializer
          klass.extend(ClassMethods) unless klass.singleton_class < ClassMethods
        end
      end
    end
  end
end
