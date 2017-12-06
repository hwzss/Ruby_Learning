
def availableVersion(version_number)

 	unless version_number =~ /^\d{1,}.\d.\d$/
 		puts "version_number格式不对，正确格式应该为 A.B.C "
 		return false
 	end
	# version_arrs = version_number.split(".").map{&:to_i}	
	true	
end