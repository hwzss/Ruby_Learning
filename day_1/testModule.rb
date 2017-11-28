module Xh
	class Book 

		def self.price
			puts "100块"
		end

	end
end

module Xh
	class SS

		def self.say_book_price
			Book.price
		end
	end
end

# include Xh
# SS.say_book_price