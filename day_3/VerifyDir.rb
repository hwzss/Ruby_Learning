
require "fileutils"	

def dirInfo
	
	puts "file.dirname:#{File.dirname(__FILE__)}"  #当前文件所在的路径
	puts "dir.pwd:#{Dir.pwd}" #当前上下文环境所处的路径，可以用Dir,chdir来改变
	puts "./:#{(File.expand_path('./'))}" 

	cd = "cd /Users/qwkj/Desktop/xiaohu"
	IO.popen(cd) do |io|  #命令是在子shell中执行的，所以改动不了当前环境的路径，所以pwd的值不会改变
		io.each do |line|
			puts line
		end
	end

	puts "after cd;file.dirname:#{File.dirname(__FILE__)}"  #当前文件所在的路径
	puts "after cd;dir.pwd:#{Dir.pwd}" #当前上下文环境所处的路径，可以用Dir,chdir来改变
	puts "./:#{(File.expand_path('./'))}" 
end

def verifyDir(path)
	 
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


end

def createDirIfNotExist(path)

	#存在直接返回true

	#不存在，则开始创建该路径目录

		#创建目录成功返回true，失败返回false
end


dirInfo