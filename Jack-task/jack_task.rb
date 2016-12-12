# class for finding beauty of string
class StringBeauty
  def beauty_of_string(string = 'ABbCcc')
    arr = (10...36).map { |i| i.to_s 36 }
    #puts string.gsub(/[^A-Z]/,'').chars.to_a.uniq.size.to_i
    #puts string
    puts arr[0]
    arr.rotate!(1)
    res = 0
    s = string.downcase
    s.each_char { |c| res += arr.index(c) + 1 }
    res
  end
end


