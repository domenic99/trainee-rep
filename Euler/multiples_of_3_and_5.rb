# Calls for finding the sum of all the multiples of 3 or 5 below 1000.
class Multiplie
  def sum
    res = (1..999).select { |num| (num % 5).zero? || (num % 3).zero? }
                  .reduce(:+)
    res
  end
end
