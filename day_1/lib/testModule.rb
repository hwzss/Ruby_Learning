module Xh

	def self.oldoldPrice
		puts "250块"
	end

	def oldPrice
		puts "200块"
	end

	module_function :oldPrice  #这个描述将导致无法在外部使用，类似于self.

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