# frozen_string_literal: true

require "tag_tango/core/initializable"

RSpec.describe TagTango::Core::Initializable, :aggregate_failures do
  describe ".param" do
    subject(:instance) { klass.new("value") }

    let(:klass) do
      Class.new do
        include TagTango::Core::Initializable

        param :value, :to_sym.to_proc
        param :maybe, default: -> { 1 }
        param :optional, optional: true, reader: :public

        def list_ivars
          instance_variables.to_h { [_1, instance_variable_get(_1)] }
        end
      end
    end

    it "is private" do
      expect(klass).not_to respond_to(:param)
    end

    it "defines positional arguments for #initialize" do
      expect { klass.new }.to raise_error ArgumentError
      expect { instance }.not_to raise_error

      expect(instance.list_ivars).to eq(
        :@value => :value, :@maybe => 1, :@optional => Dry::Initializer::UNDEFINED
      )
    end

    it "defines private readers by default but allows changing that" do
      expect(instance).not_to respond_to(:value, :maybe)
      expect(instance).to respond_to(:optional)
      expect(instance.private_methods).to include :value, :maybe
      expect(instance.public_methods).to include :optional
    end
  end

  describe ".option" do
    subject(:instance) { klass.new(value: 1, optional: 8) }

    let(:klass) do
      Class.new do
        include TagTango::Core::Initializable

        option :value, ->(v) { !v }
        option :maybe, default: -> { "maybe" }, reader: false
        option :optional, optional: true

        def list_ivars
          instance_variables.to_h { [_1, instance_variable_get(_1)] }
        end
      end
    end

    it "is private" do
      expect(klass).not_to respond_to(:option)
    end

    it "defines keyword arguments for #initialize" do
      expect { klass.new }.to raise_error KeyError
      expect { instance }.not_to raise_error

      expect(instance.list_ivars).to eq(
        :@value => false, :@maybe => "maybe", :@optional => 8
      )
    end

    it "defines private readers by default but allows changing that" do
      expect(instance).not_to respond_to(:value, :maybe, :optional)
      expect(instance.private_methods).to include :value, :optional
      expect { instance.send(:maybe) }.to raise_error NoMethodError
    end
  end
end
