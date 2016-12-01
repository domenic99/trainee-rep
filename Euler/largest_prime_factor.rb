require 'prime'

# Class for frinfing largest prime factor
class LargestPrimeFactor
  def result
    v = prime_numbers.reverse!.each do |item|
      return item if (600_851_475_143 % item).zero?
    end
    v
  end

  def prime_numbers
    arr = []
    Prime.each(100) { |prime| arr << prime }
    arr
  end
end
