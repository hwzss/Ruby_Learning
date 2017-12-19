require_relative 'my_path'
require_relative 'cache_dir'

module My_Cd

  def self.my_cd(path_alias)
    path = self.fetch_path(path_alias)
    unless path
      puts "未找到路径"
      return
    end

    cmd =[]
    cmd = %(cd #{path})

    IO.popen(cmd.join(' ')) do |io|
      io.each do |line|
        puts line
      end
    end


  end

  # 将路径已别名方式缓存
  def self.cache_path(path_alias,cd_path)
    unless path_alias
      puts "别名不能为空"
      return
    end

    unless cd_path
      puts "路径不能为空"
      return
    end

    MyPath.new(path_alias,cd_path).cache

  end

  def self.fetch_path(path_alias)
    path = MyPath.fetch_path_with_alias(path_alias).first
    if path

      return path.cd_path
    end
  end


end

My_Cd.cache_path("哈哈路径名",'哈哈哈路径')
