# frozen_string_literal: true
#
require "string_calculator"

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(string_calculator.add("")).to eq(0)
    end

    it "returns the same number if only one input is given" do
      expect(string_calculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers separated by comma" do
      expect(string_calculator.add("1,5")).to eq(6)
    end
  end
end
