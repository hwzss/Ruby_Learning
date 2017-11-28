require 'cocoapods'  #gem 安装的cocoapods包


cmd = []
cmd << 'cd /Users/qwkj/Desktop/测试工厂/fastlane测试/SafeShield'
cmd << ' && '
cmd << 'open /Users/qwkj/Desktop/测试工厂/fastlane测试/SafeShield'  #这一段加着就是看看效果，打开文件说明程序成功执行了
cmd << ' && '
cmd << 'pod install'

# IO.popen(cmd.join(' '))  #当cmd有命令的输出是多行时（比如这里的pod install就会多次打印pod成功的库名，这时），使用这个方法会出现 Broken pipe (Errno::EPIPE)错误，大致我的理解是，IO的输入输出流被其他程序抢走了，程序自己没了输入输出就Over了

#所以基于上面的改进，是加个block ，打印每一行的输出来保持输出流的持有
IO.popen(cmd.join(' '), err: [:child, :out]) do |io|          
          io.each do |line|          
            puts "哈哈哈哈，后面的内容是IO得到的输出流:#{line}"  #打印每一行的输出来保持输出流的持有
          end               
        end