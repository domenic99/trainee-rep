# Class for finding largest palindrome
class LargestPalindrome
  def palindrome
    999.downto(100) do |i|
      100.upto(999) do |j|
        tmp = (i * j).to_s
        if tmp == tmp.reverse && tmp.to_i > @check.to_i
          @check = tmp
          break
        end
      end
    end
    @check
  end
end
