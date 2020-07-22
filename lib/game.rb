class Game
	attr_accessor :symbol
	def initialize
		#création des 2 joueurs
		puts "Quel est ton nom player 1?"
		@name = gets.chomp
		player1 = Player.new(@name, "X")
		puts "Quel est ton nom player 2?"
		@name = gets.chomp
		player2 = Player.new(@name, "O")
		@players = [player1, player2]
		#boardcase = BoardCase.new
		@board = Board.new
		@board.show

		while @board.victory == false 
			@players.each do |i|
				if @board.victory == true
					puts "Désolé #{i.name}, tu as perdu."
				else
					@board.play_turn(i)
				end
			end
		end
	end
end