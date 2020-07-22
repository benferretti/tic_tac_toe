class Player

	attr_accessor :name, :symbol


	def initialize(name, symbol)
		
		@name = name.to_s
		@symbol = symbol.to_s
		puts "#{@name} a le symbole #{@symbol}"
	end

end