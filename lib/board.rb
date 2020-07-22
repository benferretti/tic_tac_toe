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
		puts "    1   2  3".blue
	    puts " a  ".blue + "#{@A1.content} | #{@A2.content} | #{@A3.content}"
	    puts "   +--+---+--+"
	    puts " b  ".blue + "#{@B1.content} | #{@B2.content} | #{@B3.content}"
	    puts "   +--+---+--+"
	    puts " c  ".blue + "#{@C1.content} | #{@C2.content} | #{@C3.content}"
		puts""
		puts""
	end

	def play_turn (player) #chaque tour on effectue cette méthode sur un player différent
		if player.symbol == "O"
			player.name = player.name.green
			@symbolcolor = player.symbol.green
		else
			player.name = player.name.red
			@symbolcolor = player.symbol.red
		end
		@symbol = player.symbol
		puts "A toi de jouer " + "#{player.name}" + ". Fait un choix : "
		position = gets.chomp.to_s

		while @positions.include?(position) == false #la position rentrée fait-elle partie de l'array @@positions ?
			puts "Choisis une position valable et disponible :"
			position = gets.chomp.to_s #si ce n'est pas le cas on redemande une position à l'user
		end
		@positions.delete(position) #on supprime la position rentrée de l'array pour ne plus pouvoir la jouer 
		
		@cases.map do |i|
			if i.position == position
				i.content = @symbolcolor
			end
		end
		show
		victory?
		if @victory == true
			puts "Bravo #{player.name}, tu as gagné."
		elsif @positions.length == 0
			puts "Match nul !".yellow
			@victory = true
		end

	end

	def victory? #on liste tous les scénarios possibles pour une victoire
		if @A1.content == "O".green && @A2.content == "O".green && @A3.content == "O".green 
			@victory = true
		elsif @A1.content == "X".red && @A2.content == "X".red && @A3.content == "X".red
			@victory = true
		elsif @B1.content == "O".green && @B2.content == "O".green && @B3.content == "O".green
			@victory = true
		elsif @B1.content == "X".red && @B2.content == "X".red && @B3.content == "X".red
			@victory = true	
		elsif @C1.content == "O".green && @C2.content == "O".green && @C3.content == "O".green
			@victory = true
		elsif @C1.content == "X".red && @C2.content == "X".red && @C3.content == "X".red
			@victory = true
		elsif @A1.content == "O".green && @B1.content == "O".green && @C1.content == "O".green 
			@victory = true
		elsif @A1.content == "X".red && @B1.content == "X".red && @C1.content == "X".red
			@victory = true
		elsif @A2.content == "O".green && @B2.content == "O".green && @C2.content == "O".green
			@victory = true
		elsif @A2.content == "X".red && @B2.content == "X".red && @C2.content == "X".red
			@victory = true	
		elsif @A3.content == "O".green && @B3.content == "O".green && @C3.content == "O".green
			@victory = true
		elsif @A3.content == "X".red && @B3.content == "X".red && @C3.content == "X".red
			@victory = true		
		elsif @A1.content == "O".green && @B2.content == "O".green && @C3.content == "O".green 
			@victory = true
		elsif @A1.content == "X".red && @B2.content == "X".red && @C3.content == "X".red
			@victory = true
		elsif @A3.content == "O".green && @B2.content == "O".green && @C1.content == "O".green
			@victory = true
		elsif @A3.content == "X".red && @B2.content == "X".red && @C1.content == "X".red
			@victory = true		
		end
	end 

end
