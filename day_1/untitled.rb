module Xh
	class book 

		def self.price
			puts "100块"
		end

	end
end

module Xh
	class SS

		def self.say_book_price
			book.price
		end
	end
end

SS.say_book_price