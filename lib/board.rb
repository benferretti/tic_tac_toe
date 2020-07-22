class Board
	attr_accessor :cases, :victory

	def initialize #lorsqu'on crée une game, on initialise toutes nos instances cases à 0 
		@victory = false
		@round = 0
		@A1 = BoardCase.new("a1", " ") #@A1 est de classe BoardCase avec comme position a1 et contenu nul
		@A2 = BoardCase.new("a2", " ")
		@A3 = BoardCase.new("a3", " ")
		@B1 = BoardCase.new("b1", " ")
		@B2 = BoardCase.new("b2", " ")
		@B3 = BoardCase.new("b3", " ")
		@C1 = BoardCase.new("c1", " ")
		@C2 = BoardCase.new("c2", " ")
		@C3 = BoardCase.new("c3", " ")
		@cases =[@A1,@A2,@A3,@B1,@B2,@B3,@C1,@C2,@C3]
		@positions = ["a1","a2","a3","b1","b2","b3","c1","c2","c3"] #on liste toutes les positions possibles pour les enlever de l'array lorsqu'elles ont déjà été joué

	end

	def show #méthode qui affiche le board actualisé
		puts""
		puts "Voici le tableau :" 
		puts""
		puts "   1   2  3"
	    puts " a #{@A1.content} | #{@A2.content} | #{@A3.content}"
	    puts "   ---------"
	    puts " b #{@B1.content} | #{@B2.content} | #{@B3.content}"
	    puts "   ---------"
	    puts " c #{@C1.content} | #{@C2.content} | #{@C3.content}"
		puts""
		puts""
	end

	def play_turn (player) #chaque tour on effectue cette méthode sur un player différent
		
		puts "A toi de jouer #{player.name}. Fait un choix : "
		@symbol = player.symbol
		position = gets.chomp.to_s

		while @positions.include?(position) == false #la position rentrée fait-elle partie de l'array @@positions ?
			puts "Choisis une position valable et disponible :"
			position = gets.chomp.to_s #si ce n'est pas le cas on redemande une position à l'user
		end
		@positions.delete(position) #on supprime la position rentrée de l'array pour ne plus pouvoir la jouer 
		@round += 1 #on compte le nombre de tour pour stopper la partie à 9 et affiche match nul
		@cases.map do |i|
			if i.position == position
				i.content = @symbol
			end
		end
		show
		victory?
		if victory == true && @round != 9
			puts "Bravo #{player.name}, tu as gagné."
		elsif victory == true && @round == 9
			puts "Match nul !"
		end
	end

	def victory? #on liste tous les scénarios possibles pour une victoire
		if @A1.content == "O" && @A2.content == "O" && @A3.content == "O" 
			@victory = true
		elsif @A1.content == "X" && @A2.content == "X" && @A3.content == "X"
			@victory = true
		elsif @B1.content == "O" && @B2.content == "O" && @B3.content == "O"
			@victory = true
		elsif @B1.content == "X" && @B2.content == "X" && @B3.content == "X"
			@victory = true	
		elsif @C1.content == "O" && @C2.content == "O" && @C3.content == "O"
			@victory = true
		elsif @C1.content == "X" && @C2.content == "X" && @C3.content == "X"
			@victory = true
		elsif @A1.content == "O" && @B1.content == "O" && @C1.content == "O" 
			@victory = true
		elsif @A1.content == "X" && @B1.content == "X" && @C1.content == "X"
			@victory = true
		elsif @A2.content == "O" && @B2.content == "O" && @C2.content == "O"
			@victory = true
		elsif @A2.content == "X" && @B2.content == "X" && @C2.content == "X"
			@victory = true	
		elsif @A3.content == "O" && @B3.content == "O" && @C3.content == "O"
			@victory = true
		elsif @A3.content == "X" && @B3.content == "X" && @C3.content == "X"
			@victory = true		
		elsif @A1.content == "O" && @B2.content == "O" && @C3.content == "O" 
			@victory = true
		elsif @A1.content == "X" && @B2.content == "X" && @C3.content == "X"
			@victory = true
		elsif @A3.content == "O" && @B2.content == "O" && @C1.content == "O"
			@victory = true
		elsif @A3.content == "X" && @B2.content == "X" && @C1.content == "X"
			@victory = true	
		elsif @round == 9
			@victory = true		
		end
	end 

end
