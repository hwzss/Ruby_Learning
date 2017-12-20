
# 我希望我的 module fuction 既可以被其他类 include 和 extend 自己也可以通过 ModuleName.funcName 调用
# 你可以这么做:
module D

  module_function	
  # extend self  #两种方式都一样

  say_hello_of_d

  def say_hello_of_d
    puts "#{self.class} say hello"
  end

end

class C
  include D
  extend D
end

D.say_hello_of_d 
C.say_hello_of_d 
C.new.say_hello_of_d 

