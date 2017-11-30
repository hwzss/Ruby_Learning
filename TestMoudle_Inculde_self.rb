require './testModule'

module Xh

	# include Xh  //不可以这样include
	Book.price  #这里可以直接调用，同一个module里的代码处于一个环境里
end