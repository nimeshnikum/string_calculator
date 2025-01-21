# frozen_string_literal: true
#
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter_regex, numbers = extract_delimiters(numbers)

    numbers = numbers.split(delimiter_regex).map(&:to_i)
    negatives = numbers.select(&:negative?)

    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers.reject { |n| n > 1000 }.sum
  end

  private

  def extract_delimiters(numbers)
    delimiters = [",", "\n"]

    if numbers.start_with?("//")
      delimiter_section, numbers = numbers.split("\n", 2)

      if delimiter_section.include?("[") # Multiple or long delimiters
        delimiters += delimiter_section.scan(/\[([^\]]+)\]/).flatten
      else
        delimiters << delimiter_section[2]
      end
    end

    [Regexp.union(delimiters), numbers]
  end
end
