
require "fileutils"	

def verifyDir(path)
	 
	puts "#{Dir.pwd}"
	
	puts "path:#{path}"
	#判断路径是否存在
	if File.exist?(path)
		 
		 if File.directory?(path)
		 	puts "有效目录"
		 else
		 	puts "有效路径，但不是目录"
		 end
	else
		 puts "不是有效路径"
		false	
	end
	#存在直接返回true

	#不存在，则开始创建该路径目录

		#创建目录成功返回true，失败返回false

end