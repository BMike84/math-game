require './player'
require './question'

class Game

  def initialize()
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    # @players = [@player1, @player2]
    @current_player = @player1
    puts "Welcome to the Math Game #{@player1.name} and #{@player2.name}!"
  end

  def play 
    while (@player1.lives > 0 && @player2.lives > 0) do
      @question = Question.new
      puts "----- NEW TURN -----"
      if @current_player == @player1
        puts "#{@player1.name}: #{@question.question}"
        player1_answer = gets.chomp.to_i
        if player1_answer == @question.answer
          puts "#{@player1.name}: Yes! You are correct"
          puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        else
          @player1.lives -= 1
          puts "#{@player1.name}: Seriously? No!"
          puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        end
      end
      if @current_player == @player2
        puts "#{@player2.name}: #{@question.question}"
        player2_answer = gets.chomp.to_i
        if player2_answer == @question.answer
          puts "#{@player1.name}: Yes! You are correct"
          puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        else
          @player2.lives -= 1
          puts "#{@player1.name}: Seriously? No!"
          puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        end
      end

      if @current_player == @player1
        @current_player = @player2
      else
        @current_player = @player1
      end
    end

    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3!"
      puts "----- GAME OVER -----"
    else @player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3!"
      puts "----- GAME OVER -----"
    end
  end

end
