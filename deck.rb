class Deck

  attr_reader :deck

  def initialize
    @deck = ((1..52).to_a + ["A", "B"])
    @deck.shuffle!
    @letter_array = [*'A'..'Z']
  end

  def index_of_joker_a
    @deck.index("A")
  end

  def index_of_joker_b
    @deck.index("B")
  end

  def index_of_card_below_joker_a
    if index_of_joker_a == 53
      return 0
    end
    index_of_joker_a + 1
  end

  def swap_joker_a_down_one
    @deck[index_of_card_below_joker_a], @deck[index_of_joker_a] = @deck[index_of_joker_a], @deck[index_of_card_below_joker_a]
  end

  def index_of_2_cards_below_joker_b
    if index_of_joker_b == 53
      1
    elsif index_of_joker_b == 52
      0
    else
      index_of_joker_b + 2
    end
  end

  def swap_joker_b_down_2
    @deck[index_of_2_cards_below_joker_b], @deck[index_of_joker_b] = @deck[index_of_joker_b], @deck[index_of_2_cards_below_joker_b]
  end

  def index_of_a_is_before_b
    index_of_joker_a < index_of_joker_b
  end

  def triple_cut_deck
    if index_of_a_is_before_b
      group_a = @deck[0...index_of_joker_a]
      group_b = @deck[(index_of_joker_b + 1)..-1]
      @deck = @deck[index_of_joker_a..index_of_joker_b]
      @deck.unshift(group_b)
      @deck.push(group_a)
      @deck.flatten!
    else
      group_a = @deck[0...index_of_joker_b]
      group_b = @deck[(index_of_joker_a + 1)..-1]
      @deck = @deck[index_of_joker_b..index_of_joker_a]
      @deck.unshift(group_b)
      @deck.push(group_a)
      @deck.flatten!
    end
  end

  def count_cut_deck
    value = @deck.pop
    if value == "A" || value == "B"
      puts "IN HERE A"
      value = 53
    end
    group_a = @deck.shift(value)
    if @deck.include?("A") && value == 53 || group_a.include?("A") && value == 53
      value = "B"
    elsif @deck.include?("B") && value == 53 || group_a.include?("B") && value == 53
      value = "A"
    end
    @deck.push(group_a).flatten!.push(value)
  end

  def alphabetize_number(number)
    if number == "A" || number == "B"
      return 1
    end
    if number > 26
      return (number - 26)
    end
    number
  end

  def output_letter
    value = @deck[0]
    if value == "A" || value == "B"
      puts "IN HERE B"
      value = 53
    end
    number = alphabetize_number(@deck[value])
    @letter_array[number - 1]
  end

  def encrypt_with_deck
    swap_joker_a_down_one
    swap_joker_b_down_2
    triple_cut_deck
    count_cut_deck
    p @deck
    output_letter
  end

end

d = Deck.new
1000.times do
  d.encrypt_with_deck
end
