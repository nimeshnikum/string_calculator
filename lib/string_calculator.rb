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

  def extract_delimiters(numbers) # rubocop:disable Metrics/MethodLength
    if numbers.start_with?("//")
      delimiter_section, numbers = numbers.split("\n", 2)
      delimiters = if delimiter_section.match(/\[(.*?)\]/)
                     Regexp.union(delimiter_section.scan(/\[(.*?)\]/).flatten)
                   else
                     delimiter_section[2..]
                   end

      [delimiters, numbers]
    else
      [/[,\n]/, numbers]
    end
  end
end
