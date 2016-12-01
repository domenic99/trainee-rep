class LetterCounter
  def count_letters string
    out = {}
    res =  string.gsub(/[a-zA-Z]/)
    res.each do |item|
      if out.key?(item)
        out[item] = out[item] + 1
      else
        out[item] = 1
      end
    end
    out
  end
end
