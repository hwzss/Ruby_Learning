require './lib/testModule'

module Xh

	aPath = File.expand_path('./');puts "当前./对应路径:#{aPath}"
	# include Xh  //不可以这样include
	Book.price  #这里可以直接调用，同一个module里的代码处于一个环境里

	oldPrice

	oldoldPrice
end