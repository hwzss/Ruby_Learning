
class PodUpdaterFile
	attr_accessor :paths

	def initialize(path)
		_path = File.expand_path(path)
		return nil unless File.exist?(_path)

		pod_updater_path = PodUpdaterFile.find_podupdater_file_path(_path)
		if pod_updater_path
			self.paths = PodUpdaterFile.parser_podupdater_file(pod_updater_path)
		end
	end

	def self.find_podupdater_file_path(path)
		_path = File.expand_path(path)
		return nil unless File.exist?(_path)

		pod_updater_path = _path
		unless _path =~ /\/podUpdater$/
			if File.directory?(_path)
				pod_updater_paths = Dir.glob("#{_path}/podUpdater")
				if pod_updater_paths.length == 0
					puts "无法找到podUpdater文件"
					pod_updater_path = nil
				elsif pod_updater_paths.length == 1
					pod_updater_path = pod_updater_paths.first
				else
					puts "目录下找到多个podUpdater文件！"
					pod_updater_paths.each_with_index do |elem, index|
						basename = File.basename(elem)
						puts %(#{index}.#{basename} )
					end
					puts "请指定您当前需要的操作的文件,输入它的序号:"
					i = gets.to_i
					case i
						when 0 .. (podfiles.length-1)
							pod_updater_path = podfiles[i.to_i]
						else
							puts "输入错误❌"
							pod_updater_path = nil
					end
				end
			end
		end

		pod_updater_path
	end

	def self.parser_podupdater_file(filePath)
		if !filePath || !(filePath =~ /\/podUpdater$/)
			return nil
		end

		paths = []
		File.open(filePath, "r") do |f|
			f.each_line do |line|
				if line.to_s =~ /["']path["']\s*,\s*["'](.*)["']/
					paths << $1.to_s
				end
			end
		end

		paths
	end

end

podupdater = PodUpdaterFile.new("/Users/qwkj/Desktop/myGems/podUpdater")

if podupdater.paths
	if podupdater.paths.length > 0
		puts "#{podupdater.paths}"
  else
    puts '0长度'
  end
else
  puts '空'
end
