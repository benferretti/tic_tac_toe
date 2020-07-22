class Application
	def statut
		puts ""
		puts "On lance une partie ? Y/N"
		response = gets.chomp.to_s
		if response == "Y" || response == "y"
			puts ""
			return true
		else
			false
		end
	end
end