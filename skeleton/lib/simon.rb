require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @seq = []
    @sequence_length = 1
  end

  def play
    until @game_over == true
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    pc = self.show_sequence
    sleep(1)
    system("clear")
    human = self.require_sequence
    # debugger
    if pc == human
      @sequence_length += 1
      self.round_success_message
    else
      @game_over = true
    end
  end

  def show_sequence
    self.add_random_color
    p @seq
  end

  def require_sequence
    p "Type our the sequence like:color1 color2 color3"
    ans = []
    ans += gets.chomp.split(" ")
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "You got it right!"
  end

  def game_over_message
    p "Try again :("
  end

  def reset_game
    @seq = []
    @game_over = false
    @sequence_length = 1
  end
end

game = Simon.new
game.play
