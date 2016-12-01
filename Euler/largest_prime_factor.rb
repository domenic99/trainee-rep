require 'prime'

#Class for finding smallest multiple
class SmallestMultiple
  def prime(count = 20)
    res = 1
    Prime.each(count) do |prime|
      res *= finder(prime, count) if prime < count
    end
    res
  end

  def finder(number, count)
    i = 1
    loop do
      break if number**i >= count
      i += 1
    end
    number**(i - 1)
  end
end
