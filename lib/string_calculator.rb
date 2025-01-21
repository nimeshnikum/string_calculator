# frozen_string_literal: true
#
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiters, numbers = numbers.split("\n", 2)
      delimiters = delimiters[2..]
    else
      delimiters = /[,\n]/
    end

    numbers.split(delimiters).map(&:to_i).sum
  end
end
