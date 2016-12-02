# class for finding beauty of string
class StringBeauty
  def beauty_of_string(string = 'ABbCcc')
    arr = (10...36).map { |i| i.to_s 36 }
    arr.rotate!(3)
    res = 0
    s = string.downcase
    s.each_char { |c| res += arr.index(c) + 1 }
    res
  end
end
