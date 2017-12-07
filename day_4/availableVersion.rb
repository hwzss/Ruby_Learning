
def availableVersion(version_number)

 	unless version_number =~ /^\d{1,}.\d.\d$/
 		puts "version_number格式不对，正确格式应该为 A.B.C "
 		return false
 	end
	# version_arrs = version_number.split(".").map{&:to_i}	
	true	
end

# 满足／^\d{1,}*／的值格式成 A.B.C的形式
def fixVersionNumber(version_number)

	version_arrs = version_number.split('.')
	
	version_arrs << "0" if version_arrs.count == 1
	version_arrs << "0" if version_arrs.count == 2

	temp_version_number = version_arrs[0..2].join('.')


end

# 将满足正则/^\d{1,}.\d.\d$/ 的值进行自增1
def addVersionNumber(version_number)

	version_arrs = version_number.split('.').map(&:to_i)

	if version_number =~ /^\d{1,}.[0-8].9$/
		 # puts "1"
		 version_arrs[1] = version_arrs[1] + 1
		 version_arrs[2] = 0
	
	elsif version_number =~ /^\d{1,}.9.9$/
		 # puts "2"
		 version_arrs[0] = version_arrs[0] + 1
		 version_arrs[1] = 0
		 version_arrs[2] = 0
	else
		 # puts "3"
         version_arrs[2] = version_arrs[2] + 1
	end

	#上面的if语句是下面注释代码的改写版
	# if version_arrs[2]>8
	# 	if version_arrs[1]>8
	# 		version_arrs[0] +=1
	# 		version_arrs[1] = 0
	# 		version_arrs[2] = 0
	# 	else
	# 		version_arrs[2] = 0
	# 		version_arrs[1] +=1
	# 	end
	# else
	# 	version_arrs[2] +=1
	# end

	version_arrs[0..2].join('.')

end

def  testBool

	puts "0代表真" if 0
	puts "0代表假" unless 0
	puts "nil 代表真" if nil
	puts "nil 代表假" unless nil

	puts "true 代表假" unless true
	puts "true 代表真" if false
end