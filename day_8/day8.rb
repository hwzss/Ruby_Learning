
currentDir = File.dirname(__FILE__)
day6FilePath = "#{File.dirname(currentDir)}/day_6/day6.rb"
day7FilePath = "#{File.dirname(currentDir)}/day_7/day7.rb"

require "#{day6FilePath}"
require "#{day7FilePath}"

# 给定pod库项目的路径，以及新版pod库的版本，将自己的pod提交到git,然后打上tag，再push trunk到pod服务器去
def pushPodToSevice(path,version)
	# FOR_DEBUG:
	# path = "/Users/qwkj/Documents/WZ_GitHub/WZ_Framework"
	# END

	podFilePath = pathWithPodspecSuffix(path)

	unless podFilePath 
		puts "未找到相应的podspec文件"
		return
	end

	msg = "for pod version:#{version}"

	modifyPodspec(path:podFilePath,version:version)

	git_tag_flow(path,msg,version)

	cmd = []
	cmd << %(pod trunk push #{podFilePath} --allow-warnings)

	IO.popen(cmd.join('')) do |io|
		io.each do |line|
			puts line
		end
	end
	
end

# 提供路径，然后将项目打包上git,标记tag
def git_tag_flow(path,msg,tag_version)
	
	# DEBUG: 调试用参
	# path = "/Users/qwkj/Documents/WZ_GitHub/WZ_HelloKit"
	# msg = "test for ruby code"

	cmd = []

	cmd << %(cd #{path})
	cmd << 'git add .'
	cmd << %(git commit -m  "#{msg}")
	cmd << 'git push'
	cmd << %(git tag -a #{tag_version} -m "#{msg}")
	cmd << 'git push --tags'

	# TODO: 尝试在每次即将执行该命令时，打印出这次的命令
	IO.popen(cmd.join(" && ")) do |io|
		io.each do |line|
			puts line
		end
		io.close
	end

end