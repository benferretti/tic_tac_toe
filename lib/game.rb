class Game

  attr_accessor :players, :board , :player

  def initialize
    @players = Array.new
    @board = Board.new
  end

  def ask_name
    puts "Nom du player 1 ?"
    print "> "
    @players << Player.new(gets.chomp.to_s, "O")

    puts "Nom du player 2 ?"
    print "> "
    @players << Player.new(gets.chomp.to_s, "X")
  end

  def select_player
    while @board.victory == false
    	@players.each do |i| 
    		if @board.victory == true
				nil
			else
      			@board.play_turn(i)
    		end
 		end
 	end
  end

 def perform
    ask_name
    puts "Le nom du joueur 1 est #{@players[0].name} et son symbole est #{@players[0].symbol}"
    puts "Le nom du joueur 2 est #{@players[1].name} et son symbole est #{@players[1].symbol}"
    @board.show
    select_player
    #ask_new_game
  end
end