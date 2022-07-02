require './player'
require './question'

class Game

  def initialize()
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    puts "Welcome to the Math Game #{@player1.name} and #{@player2.name}!"
  end

  def play 
    while (@player1.lives > 0 && @player2.lives > 0) do
      @question = Question.new
      puts
      puts "----- NEW TURN -----"
      puts
      current_player = @players.first
      waiting_player = @players.last
      if current_player 
        puts "#{current_player.name}: #{@question.question}"
        current_player_answer = gets.chomp.to_i
        if current_player_answer == @question.answer
          puts "#{current_player.name}: Yes! You are correct"
          puts "#{current_player.name}: #{current_player.lives}/3 vs #{waiting_player.name}: #{waiting_player.lives}/3"
        else
          current_player.lives -= 1
          puts "#{current_player.name}: No! Seriouly"
          puts "#{current_player.name}: #{current_player.lives}/3 vs #{waiting_player.name}: #{waiting_player.lives}/3"
        end
      end
      @players.rotate!
      if current_player.lives == 0
        puts
        puts "----- GAME OVER -----"
        puts "#{waiting_player.name} wins with a score of #{waiting_player.lives}/3!"
      end
    end
    
  end

end