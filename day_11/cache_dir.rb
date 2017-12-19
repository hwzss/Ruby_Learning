
require 'fileutils'

module My_Cd

  class CacheDir

    # CACHE_PATH = '~/Desktop'
    CACHE_PATH = "#{File.dirname(__FILE__)}"
    DIR = 'my_cd_cache'
    PATH = 'my_cd_cache'

    def self.cd_cache_path

      full_path = File.expand_path(CACHE_PATH)
      if File.exist?(full_path)
        
        dir_path = File.join(full_path,DIR)
        unless File.exist?(dir_path)&&File.directory?(dir_path)
          FileUtils.mkdir_p(dir_path)

          path = File.join(dir_path,PATH)
          f = File.new(path, 'a+')
          return path if f
        end

        path = File.join(dir_path,PATH)
        unless File.exist?(path)||(!File.directory?(path))

          f = File.new(path, 'a+')
          return path if f
        end
        return path
      end
    end
  end
end







