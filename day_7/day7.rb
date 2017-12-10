
# TODO: 修改podspec文件中s.version的值，
def modifyPodspec(path:path,version:version_number)

	# FIXME: 使用version_number值时会报错

	version = "12.0.5"
	# FIXME: version_number的值校验，不能为空，且格式需A.B.C
	path = "/Users/qwkj/Documents/WZ_GitHub/Ruby_Learning/day_7/QW_Http.podspec"
	unless File.exist?path
		puts "路径不存在"
		return
	end

	File.open(path, "r+") do |f|
		s = ""
		f.each_line do |line|
			# puts "#{line}"
			if line.to_s =~ /s\.version\s*=\s*"(\d{1,}.\d.\d|\d{1,}.\d|\d{1,})"/
				# puts "匹配到了"
				temp = $1.to_s
				line = line.sub(/\d{1,}.\d.\d|\d{1,}.\d|\d{1,}/) do |match| 
					version.to_s
				end
			end
			s += line
		end
		puts "#{s}"
		File.open(path, "w+") do |f| f.write(s) end
	end	
	
end

# 测试从podspec文件中获取version的值
def testFetchVersionNumberInPodSpec
		path = "/Users/qwkj/Documents/WZ_GitHub/Ruby_Learning/day_7/QW_Http.podspec"
	unless File.exist?path
		puts "路径不存在"
		return
	end

	File.open(path) do |f|
		f.each_line do |line|
			if line.to_s =~ /s\.version\s*=\s*"(\d{1,}.\d.\d|\d{1,}.\d|\d{1,})"/  # FIXME: 这里的正则需要修正，目前只能匹配单一格式
				puts "**#{line}**"
				puts "~~#{$1}~~"
			end
			
		end
	end
end

def testOutputFile(path)
	
	path = "/Users/qwkj/Documents/WZ_GitHub/Ruby_Learning/day_7/QW_Http.podspec"

	unless File.exist?path
		puts "路径不存在"
		return
	end

	File.open(path) do |f|
		f.each_line do |line|
			puts "**#{line}"
		end
	end
end

def testInputFile(path, str)

	path = "/Users/qwkj/Documents/WZ_GitHub/Ruby_Learning/day_7/testInputFile"

	unless File.exist?path
		puts "路径不存在"
		return
	end

	File.open(path, 'w+') do |f|
		f.write(str)
	end
	
end
