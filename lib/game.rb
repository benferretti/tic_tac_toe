class Game

  attr_accessor :players, :board , :player

  def initialize
    @players = Array.new
    @board = Board.new
  end

  def ask_name #méthode pour demander les noms et créer les 2 players avec les symboles O et X imposés
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
				play_again
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
  end

  def play_again
    if @board.victory == true 
      puts "Appuie sur la touche o pour relancer une partie ou sur une autre touche pour quitter le jeu : "
      response = gets.chomp.to_s
      if response == "o" || response == "O"
        Game.new.perform
      else
        exit
      end
    end
  end
end