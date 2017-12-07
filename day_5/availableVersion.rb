
def availableVersion(version_number)

 	unless version_number =~ /^\d{1,}.\d.\d$/
 		puts "version_number格式不对，正确格式应该为 A.B.C "
 		return false
 	end
	# version_arrs = version_number.split(".").map{&:to_i}	
	true	
end

def fixVersionNumber(version_number)

	version_arrs = version_number.split('.')
	
	version_arrs << "0" if version_arrs.count == 1
	version_arrs << "0" if version_arrs.count == 2

	temp_version_number = version_arrs[0..2].join('.')


end
def addVersionNumber(version_number)

	version_arrs = version_number.split('.').map(&:to_i)


	if version_arrs[2]>8
		if version_arrs[1]>8
			version_arrs[0] +=1
			version_arrs[1] = 0
			version_arrs[2] = 0
		else
			version_arrs[2] = 0
			version_arrs[1] +=1
		end
	else
		version_arrs[2] +=1
	end

	version_arrs[0..2].join('.')

end