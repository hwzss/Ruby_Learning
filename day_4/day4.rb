

#传入一个路径，获取该路径的最小有效路径，
def availablePath(path)
	# puts "开始调用"
	unless path
		puts "path 为空"
		return nil
	end

	if File.exist?(path)

		return path
	else
		availablePath(File.dirname(path))
	end

end

=begin 

例子：
irb(main):006:0> availablePath "/User/qwkj/Desktop/xiaohus/xixi"
开始调用
开始调用
开始调用
开始调用
开始调用
开始调用
=> "/"
irb(main):007:0> availablePath "/Users/qwkj/Desktop/xiaohus/xixi"
开始调用
开始调用
开始调用
=> "/Users/qwkj/Desktop"
irb(main):008:0> availablePath "/Users/qwkj/Desktops/xiaohus/xixi"
开始调用
开始调用
开始调用
开始调用
=> "/Users/qwkj"
irb(main):009:0> availablePath "/Users/qwkjs/Desktops/xiaohus/xixi"
开始调用
开始调用
开始调用
开始调用
开始调用
=> "/Users"

=end