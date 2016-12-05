require 'benchmark'
require './deck'

class Poker
  attr_reader :your_cards, :flop_cards, :all_cards, :result, :position

  @@combinations_list = {
    0 => 'high card',
    1 => 'one pair',
    2 => 'two pair',
    3 => 'three of a kind',
    4 => 'straight',
    5 => 'flush',
    6 => 'full house',
    7 => 'four of a kind',
    8 => 'straight flush',
    9 => 'royal flush'
  }

  def play
    puts start
  end

  def start
    deck = Deck.new
    @position = -1
    @result = 0
    @your_cards = deck.deal
    @flop_cards = deck.flop
    @all_cards = @your_cards + @flop_cards
    check_for_royal
  end

  def finder(pos)
    tmp = @@combinations_list.key(pos.downcase)
    raise 'Wrong combination' if tmp.nil?
    @iteration = 0
    @position = -1
    t = Benchmark.measure { iterator(tmp) }
    puts "Iteration count: #{@iteration} \nTime: " + t.real.to_s
  end

  def iterator(tmp)
    until @position == tmp
      @iteration += 1
      start
    end
  end

  def check_for_royal
    straight = check_for_straight
    flush = check_for_flush(straight) if straight
    if straight && flush && straight.last.rank.to_i == 14
      winner(9, straight)
    elsif straight && flush
      winner(8, straight)
    else
      check_for_flush
      check_for_pairs
    end
    "Your winning combination is #{@@combinations_list[@position]} with Cards:\n" +
      ((@result.class == Card) ? @result.to_s : @result.each { |i| i.to_s }.join("\n"))
  end

  def check_for_flush(array_of_cards = @all_cards)
    out = Hash.new(0)
    array_of_cards.each { |item| out[item.suit] += 1 }
    tmp ||= out.find { |k, v| v >= 5 }
    winner(5, array_of_cards.select { |i| i.suit == tmp[0] }) if tmp
  end

  def check_for_straight
    arr = []
    @all_cards.each { |item| arr << item.rank.to_i }
    arr = arr.uniq.sort.reverse
    return nil if arr.size < 4
    res = []
    for i in 0..(arr.size - 5)
      straight = true
      for j in 1..4
        if arr[i] - arr[j + i] != j
          straight = false
        end
      end
      res += arr[i..(i + 4)] if straight
    end
    res.sort!
    winner(4, @all_cards.select { |i| (res.first..res.last).to_a.include?(i.rank.to_i) }) unless res.empty?
  end

  def check_for_pairs
    arr = @all_cards.map { |card| card.rank.to_i }
    if arr.uniq.size == 7
      high_card
    else
      out = Hash.new(0)
      arr.each { |item| out[item] += 1 }
      pair = which_pair(out)
    end
  end

  def high_card
    winner(0, @all_cards.sort_by { |i| i.rank.to_i }.last)
  end

  def which_pair(h)
    tmp = h.select { |k, v| v >= 2 }
           .sort_by { |k, v| [v, k] }.reverse.to_h
    if tmp.value?(4)
      winner(7, @all_cards.select { |i| i.rank.to_i == tmp.keys[0] })
    elsif tmp.value?(3) && tmp.size >= 2
      winner(6, @all_cards.select { |i| i.rank.to_i == tmp.keys[0] || i.rank.to_i == tmp.keys[1] })
    elsif tmp.value?(3)
      winner(3, @all_cards.select { |i| i.rank.to_i == tmp.keys[0] })
    elsif tmp.value?(2) && tmp.size >= 2
      winner(2, @all_cards.select { |i| i.rank.to_i == tmp.keys[0] || i.rank.to_i == tmp.keys[1] })
    else
      winner(1, @all_cards.select { |i| i.rank.to_i == tmp.keys[0] })
    end
  end

  def winner(pos, array_of_cards)
    if @position < pos
      @position = pos
      @result = array_of_cards
    end
  end
end
