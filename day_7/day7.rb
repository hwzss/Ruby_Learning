
# TODO: 修改podspec文件中s.version的值，
def modifyPodspec

	path  = ""
	unless File.exist?path
		puts "路径不存在"
		return
	end

	# File.open(path) do	

	
end

def testOutputFile(path)
	
	unless File.exist?path
		puts "路径不存在"
		return
	end

	File.open(path) do |f|
		f.each_line do |line|
			puts "#{line}"
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
