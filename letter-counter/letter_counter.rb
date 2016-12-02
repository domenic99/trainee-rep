# Class for counting all same letters in word.
class LetterCounter
  def count_letters(string)
    out = Hash.new(0)
    string.gsub!(/\p{L}/).each { |item| out[item] += 1 }
    out
  end
end
