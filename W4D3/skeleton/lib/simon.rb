class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    if game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    puts @seq
  end

  def require_sequence
    puts "Input the color in sequence: "
    guess = gets.chomp 
    game_over = true if guess == seq.shift
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Congratulations you got it right!"
  end

  def game_over_message
    puts "You win!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
