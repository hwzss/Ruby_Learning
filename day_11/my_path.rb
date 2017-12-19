require_relative 'cache_dir'

module My_Cd

  class MyPath
    attr_accessor :path_alias, :cd_path;

    def initialize(path_alias,cd_path)
      @path_alias = path_alias
      @cd_path = cd_path
    end

    # 通过别名从缓存中获取路径,返回myPath实例对象数组
    def self.fetch_path_with_alias(path_alias)

      File.open(CacheDir.cd_cache_path, 'r') do |f|
        paths = []
        f.each_line do |line|
          line.scan(%r|alias:'#{path_alias}', path:'(.*?)'|) do |matched|
            path = MyPath.new(path_alias,matched.first)
            paths << path
          end
        end

        return paths unless paths.empty?
      end

    end

    # 将自己存入文件
    def cache
      cache_path = CacheDir.cd_cache_path

      tem_paths = self.class.fetch_path_with_alias(self.path_alias)
      if tem_paths
        tem_paths.each do |path|
          puts %(已存在别名为:"#{self.path_alias}"的路径\n#{path.alias_msg})
        end
        return
      end

      File.open(cache_path, 'a+') do |f| f.puts(self.alias_msg) end
    end

    # 按照统一格式，生成需要写入文件的信息
    def alias_msg
      self.class.alias_path_msg(self.path_alias,self.cd_path)
    end
    def self.alias_path_msg(path_alias,cd_path)
      %(alias:'#{path_alias}', path:'#{cd_path}')
    end

    # 通过文件中读取到的一行信息，来过滤生成自己的实例
    def self.create_with_alias_msg(alias_msg)
      if alias_msg =~ /^alias:'(.*?)', path:'(.*?)'$/
        return self.new($1,$2)
      end

    end
  end
end

# include My_Cd
# ob = MyPath.new("haha","adfds")
# puts ob.path_alias
# puts ob.cd_path
#
# puts ob.alias_msg
#
# ob.cache
#
#
#
# ob2 = MyPath.create_with_alias_msg(%(alias:'哈哈大', path:'我是path'))
#
# puts ob2.path_alias
# puts ob2.cd_path
#
# puts ob2.alias_msg
# ob2.cache
