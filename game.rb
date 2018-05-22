require './player.rb'
require './turn_manager.rb'
require './question.rb'

class Game
  def initialize
    player1 = Player.new('Player 1')
    player2 = Player.new('Player 2')

    @players = [player1, player2]
    @turn = TurnManager.new(@players)
  end

  def summary
    summary = @players.map { |p| p.summary }.join(" vs ")
    summary
  end

  def game_over?
    @players.first.dead? || @players.last.dead?
  end

  def players
    @players.select { |p| !p.dead? }
  end

  def find_winner
    players.first
  end

  def run
    while !game_over?
      current_player = @turn.current_player

      question = Question.new

      puts "-------- NEW TURN --------"
      puts "#{current_player.name}: #{question.create_question}"

      input = gets.chomp.to_i

      if question.right_answer?(input)
        puts "Yas!"
      else
        puts "Uh, no."
        current_player.wrong_answer
      end

      puts summary
      @turn.next_turn
    end

    winner = find_winner
    puts " -------- GAME OVER -------- "
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
  end
end