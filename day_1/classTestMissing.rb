class TestMissing  
  def method_missing(m, *args, &block)
    puts "方法名：#{m}，参数：#{args}，闭包：#{block}"
  end
end

TestMissing.new.say "Hello", "World" do  
  puts "Hello, world"
end 