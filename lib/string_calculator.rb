# frozen_string_literal: true
#
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters, numbers = extract_delimiters(numbers)

    numbers = numbers.split(/#{delimiters}/).map(&:to_i)
    negatives = numbers.select(&:negative?)

    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers.reject { |n| n > 1000 }.sum
  end

  private

  def extract_delimiters(numbers)
    if numbers.start_with?("//")
      delimiters, numbers = numbers.split("\n", 2)
      [delimiters[2..], numbers]
    else
      [/[,\n]/, numbers]
    end
  end
end
