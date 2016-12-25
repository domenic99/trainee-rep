# Class for string beauty calculation
class String
  def beauty
    freq = Hash.new(0)
    reverse.downcase.each_char { |s| freq[s] += 1 }
    a = 26
    result = 0
    freq.each do |_key, value|
      result += value * a
      a -= 1
    end
    result
  end
end
