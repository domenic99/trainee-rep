# Class for finding sum of the even fibonacci numbers
# which is less than 4_000_000
class EvenFibonacci
  attr_accessor :cache, :summ

  def initialize
    @cache = [1, 2]
    @summ = [0, 0]
  end

  def sum
    while @summ[1] <= 4_000_000
      @summ[0] = @summ[1]
      @summ[1] += fibonacci if fibonacci.even?
    end
    @summ[0]
  end

  def fibonacci
    tmp = @cache[0] + @cache[1]
    @cache[0] = @cache[1]
    @cache[1] = tmp
    tmp
  end
end
