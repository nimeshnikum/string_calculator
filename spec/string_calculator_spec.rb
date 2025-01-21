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

    it "returns the sum of multiple numbers" do
      expect(string_calculator.add("1,2,3,4,5")).to eq(15)
    end

    it "handles new line as delimiter" do
      expect(string_calculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters" do
      expect(string_calculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an exception for negative numbers" do
      expect { string_calculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed: -2, -4")
    end
  end
end
