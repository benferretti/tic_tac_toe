class Board
	attr_accessor :cases, :victory
	@@positions = ["a1","a2","a3","b1","b2","b3","c1","c2","c3"]

	def initialize
		@victory = false
		@round = 0
		@A1 = BoardCase.new("a1", " ")
		@A2 = BoardCase.new("a2", " ")
		@A3 = BoardCase.new("a3", " ")
		@B1 = BoardCase.new("b1", " ")
		@B2 = BoardCase.new("b2", " ")
		@B3 = BoardCase.new("b3", " ")
		@C1 = BoardCase.new("c1", " ")
		@C2 = BoardCase.new("c2", " ")
		@C3 = BoardCase.new("c3", " ")
		@cases =[@A1,@A2,@A3,@B1,@B2,@B3,@C1,@C2,@C3]
	end

	def show
		puts""
		puts "Voici le tableau" 
		puts "   1   2  3"
	    puts " a #{@A1.content} | #{@A2.content} | #{@A3.content}"
	    puts "   ---------"
	    puts " b #{@B1.content} | #{@B2.content} | #{@B3.content}"
	    puts "   ---------"
	    puts " c #{@C1.content} | #{@C2.content} | #{@C3.content}"
		puts""
		puts""
	end

	def play_turn (player)
		
		puts "A toi de jouer #{player.name}. Fait un choix : "
		@symbol = player.symbol
		position = gets.chomp.to_s

		while @@positions.include?(position) == false
			puts "Choisis une position valable et disponible :"
			position = gets.chomp.to_s
		end
		@@positions.delete(position)
		@round += 1
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

	def victory?
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
