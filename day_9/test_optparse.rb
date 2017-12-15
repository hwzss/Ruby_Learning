require 'optparse'


options = {}
option_parser = OptionParser.new do |opts|

  opts.banner = 'here is help messages of the command line tool'

  options[:version] = nil
  opts.on('-v', '--version [version]', String, 'the podspec\'s version') do |version|
    options[:version] = version
  end

  options[:log] = false
  opts.on('-log','should log the messages when script run') do |value|
    options[:log] = value
  end


end.parse!

puts options.inspect

if options[:log]
  puts "现在打印的是:脚本的log信息...."
end

unless options[:version]
  puts "version值不能为空"
end
