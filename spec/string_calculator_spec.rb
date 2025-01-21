# frozen_string_literal: true
#
require "string_calculator"

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(string_calculator.add("")).to eq(0)
    end
  end
end
