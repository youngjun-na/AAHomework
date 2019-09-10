class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new()}
    place_stones
  end

  def place_stones
    @cups.each_with_index {|cup, i| 4.times {cups[i] << :stone} unless i == 6 || i == 13}
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6 
        @cups[cup_idx] << stones.shift if current_player_name == @name1
      elsif cup_idx == 13 
        @cups[cup_idx] << stones.shift if current_player_name == @name2
      else  
        @cups[cup_idx] << stones.shift
      end
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].size == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
    return false
  end

  def winner
    if @cups[6].size == @cups[13].size
      :draw
    elsif @cups[6].size > @cups[13].size
      return @name1
    else
      return @name2
    end
  end
end
