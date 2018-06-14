def num_length(num)
	new_array = []
	full_array = []
	new_num_array = []
	str = num.gsub(/([- ])/, '')
	# p "i am str num length#{str}"
	first_length = str.length
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	# p "i am new_str num length#{new_str}"
	str_length = new_str.length
	if str_length == 13
		if first_length > 13
			"Invalid ISBN"
		else 
			check_thirteen(num)
		end
	elsif str_length == 10 
		num_str = str.split(//)
		# p num_str
		array = num_str.join
		# p array
		array_length = array.length
		if array_length == 10 && array.include?("x") == true
			check_x(num)
		elsif array_length == 10
			full_array << array.to_i
			# p "i am full_array num length #{full_array} #{full_array.class}"
			new_num = num_str.pop
			# p "i am new_num num length #{new_num} #{ new_num.class}"
			joined_number = num_str.join
			# p "i am joined_number num length #{joined_number} #{joined_number.class}"
			new_num_array << joined_number.to_i
			# p "i am new_num_array  num length#{new_num_array} #{new_num_array.class}"
			"Valid ISBN"
		else 
			"Invalid ISBN"
		end
	elsif str_length < 10 || str_length > 10 && str_length < 13
		check_x(num)
	elsif str_length > 13
		"Invalid ISBN"
	else
		check_ten(num)
	end
end

def check_thirteen(num)
	odds = []
	evens = []
	full_array = []
	# p "numbers check 13#{numbers}"
	str = num.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	num_str = new_str.split(//)
	num_str.each do |x|
		full_array << x.to_i
	end
	popped = full_array.pop
	full_array.each_with_index do |item,index|
		if (index.odd?)
			odds.push(item*3)
		else (index.even?)
			evens.push(item*1)
		end
	end
	sum = odds.sum+evens.sum
	mod = sum%10
	remainder = 10-mod
	if remainder == popped
		"Valid ISBN" 
	else 
		"Invalid ISBN"
	end
end

def check_x(num)
	new_array = []
	str = num.gsub(/[^Xx0-9 ]/, '')
	# p "i am str c check x #{str}"
	num_str = str.split(//)
	# p "i am num str check x #{num_str}"
	if num_str.length == 10 && num_str.include?("x") == true
		if num_str[9] == "x"
			partial_array = num_str.pop
			new_array << num_str.join.to_i
			"Valid ISBN"
			# p "i am new array check x #{new_array}"
		elsif num_str[0]..num_str[8] == "x"
			"Invalid ISBN"
		else num_str > 10
			"Invalid ISBN"
		end
	else
		"Invalid ISBN"
	end
end

def check_ten(num)
	answer_array = []
	new_array = []
	full_array = []
	new_num_array = []
	str = num.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	str_length = new_str.length
	# p "str length check ten #{str_length}"
	num_str = str.split(//)
	# p "num_str check ten#{num_str}"
	match_element = num_str[9].to_i
	# p "match_element check ten#{match_element}"
	numbers = num_length(num)
	# p "numbers #{numbers}"
  	new_num = numbers.zip([1,2,3,4,5,6,7,8,9])
  	# p "new_num check ten #{new_num}"
	new_num.map! do |v,i|
		answer = v*i
		answer_array << answer 	
	end
		sum = answer_array.sum
		remainder = sum%11
		# p "remainder check ten #{remainder}"
	if match_element == remainder
		"Valid ISBN"
	elsif num_str[9] && remainder == 10
		"Valid ISBN"
	else
		"Invalid ISBN"
	end
end



# p check_ten("483623844x")