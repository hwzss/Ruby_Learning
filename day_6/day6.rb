

# TODO: 遍历处目录下所有的指定后缀文件的名称
def fileNamesWithSuffix(fileSuffix); end

# 找到指定路径下的podspec文件名
def pathWithPodspecSuffix(path)

	# path = "/Users/qwkj/Desktop/IOS_Pod_Spec_Repo/千网PodRepo/QWCrashReporter/1.0.8/"
	path = File.expand_path(path)
	return nil unless File.exist?(path)

	unless path =~ /.podspec$/

		if File.directory?(path)
			podfiles = Dir.glob("#{path}/*.podspec")
			puts "#{podfiles}"
			if podfiles.length == 0
				puts %('#{dir}'下无法找到'.podspec'文件)
				return nil
			elsif podfiles.length == 1
				path = podfiles.first
			else
				puts "目录下找到多个podspec文件！"
				podfiles.each_with_index do |elem, index|
					basename = File.basename(elem)
					puts %(#{index}.#{basename} )
				end
				puts "请指定您当前需要的操作的文件,输入它的序号:"
				i = gets.to_i

				case i
				when 0 .. (podfiles.length-1)
					path = podfiles[i.to_i]	
				else
					puts "输入错误❌"
					path = nil
				end
				
			end
		end
	end

	path

end


# 给定一个路径，前往校验podspec文件的合法性，给定的额是目录就会从目录下搜索文件，指定的是文件则直接进行验证
def libLintPodspec(path)

	path = "/Users/qwkj/Desktop/IOS_Pod_Spec_Repo/千网PodRepo/QWCrashReporter/1.0.8/"
	
	path = pathWithPodspecSuffix(path)
	
	return unless path

	cmd = []

	cmd << %(pod lib lint #{path})
	cmd << '--allow-warnings'
	cmd << '&&'
	cmd << %(echo "haha") # 测试上面指令失败后是否会继续执行这条指令,结果是不会执行

	IO.popen(cmd.join(' ')) do |io|
		io.each do |line|
			puts "#{line}"
		end
		io.close
	end
end

# 尝试指定一个路径，然后主动前往目录执行 'pod install' 命令
def simplePod(path)

	path = "/Users/qwkj/Desktop/测试工厂/testP/SafeShield"
	# 检查path是否给的是目录，如果是文件路径久转为上级目录
	path = File.expand_path(path)
	return unless File.exist?(path)

	dir = path
	base = ''

	puts "#{dir}"
	unless Dir.exist?(path)
		dir,base = File.split(path)
	end	

	Dir.chdir(dir) 
	# puts "#{Dir.pwd}"

	if base != "Podfile"
		# 查找目录下是否有Podfile文件
		podfiles = Dir.glob("Podfile")
		
		if podfiles.length == 0
			puts %('#{dir}'下无法找到'Podfile'文件)
			return
		end
	end

	# 给定目录下有Podfile文件，条件具备，下面将进行'pod install'命令
	cmd = []
	cmd << "pod install"

	IO.popen(cmd.join(' ')) do |io|          
          io.each do |line|          
            puts "#{line}"  #打印每一行的输出来保持输出流的持有
          end  
          io.close             
        end
	 
end