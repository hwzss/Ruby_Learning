

puts "请输入需要新建的文件名=:"

# file_name = gets
# dir_name = "rubyyy_repo"

# cmd = []
# cmd << "open ~/Desktop"
# cmd << "cd ~/Desktop"
# cmd << "mkdir #{dir_name}"
# cmd << "cd ./#{dir_name}"
# cmd << "touch #{file_name}"
# cmd << "open ~/Desktop/#{dir_name}"

# IO.popen(cmd.join(""))

# exit_status = nil
# IO.popen(cmd, err: [:child, :out]) do |io|
#   io.sync = true
#   io.each do |line|
#     puts "#{line}"
#     # result << line
#   end
#   io.close
#   exit_status = $?.exitstatus
# end

cmd = []

cmd << "cd /Users/qwkj/Desktop/测试工厂/fastlane测试/SafeShield"
cmd << "pod install"
cmd << "puts \"哈哈哈哈\""
# cmd.each{|obj|
# 	puts "#{obj}"
# 	a = IO.popen(obj)
# 	a.sync = true
# 	puts "#{a}"
# }

 IO.popen(cmd, err: [:child, :out]) do |io|
          io.sync = true
          io.each do |line|
            # UI.command_output(line.strip) if print_command_output
            # result << line
            	puts "#{line}"
          end
          io.close
          # exit_status = $?.exitstatus
        end
# cmd = cmd.join('')
# puts "#{cmd}"

# IO.popen("open ~/Desktop")