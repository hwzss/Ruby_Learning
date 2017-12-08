
 # include Traverse
 # traverse('/User/qwkj/Desktop/xiaohu')

 module Traverse
    def traverse(path)
      if File.directory?(path)  # 如果是目录
        dir = Dir.open(path)
        while name = dir.read
          next if name == "."   # ※
          next if name == ".."  # ※
          traverse(path + "/" + name)
        end
        dir.close
      else
        puts path
      end
    end

 end