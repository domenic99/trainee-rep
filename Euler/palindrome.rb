# Class for finding largest palindrome
class LargestPalindrome
  def palindrome
    check = ''
    999.downto(100) do |i|
      999.downto(100) do |j|
        tmp = (i * j).to_s
        if tmp == tmp.reverse && check.empty?
          check = tmp
          break
        end
      end
    end
    check.to_i
  end
end
