# frozen_string_literal: true

require "tag_tango/core/callable"

RSpec.describe TagTango::Core::Callable, :aggregate_failures do
  let(:callable) { klass.new }

  describe "#call" do
    let(:klass) do
      Class.new do
        include TagTango::Core::Callable

        def call(param)
          return success if param.nil?

          param ? Success(param) : Failure(param)
        end
      end
    end

    it "is the only public method" do
      expect(callable.public_methods(false)).to eq [:call]
    end

    it "returns Success and Failure monads" do
      expect(callable.call(1)).to eq Dry::Monads::Result::Success.new(1)
      expect(callable.call(false)).to eq Dry::Monads::Result::Failure.new(false)
      expect(callable.call(nil)).to be described_class::SUCCESS
    end
  end

  describe ".do_for" do
    let(:klass) do
      Class.new do
        include TagTango::Core::Callable

        do_for :call, :subcall

        def call(param)
          result = yield subcall(param)
          Success(result)
        end

        private

        def subcall(param)
          result = yield subsubcall(param)
          Success(!result)
        end

        def subsubcall(param)
          param ? Success(param) : Failure(param)
        end
      end
    end

    it "is private" do
      expect(klass.private_methods(false)).to include(:do_for)
    end

    it "allows using Do notation" do
      expect(callable.call(1)).to eq Dry::Monads::Result::Success.new(false)
      expect(callable.call(false)).to eq Dry::Monads::Result::Failure.new(false)
    end
  end
end
