require 'minitest/autorun'
require_relative 'isbn.rb'

class Isbn_test < Minitest::Test
	def test_true_is_true
		assert_equal(true,true)
	end

	def test_invalid_isbn10_check_ten_function
		num = "7432456493"
		assert_equal("Invalid ISBN",check_ten(num))
	end

	def test_valid_isbn10_one_space_and_x
		num = "1943 82908x"
		assert_equal("Valid ISBN",num_length(num))
	end

	def test_valid_isbn10_three_spaces_x_on_end
		num = "1 943 829 08x"
		assert_equal("Valid ISBN",num_length(num))
	end

	def test_num_length_valid_isbn10_x_on_end
		num = "194382908x"
		assert_equal("Valid ISBN",check_ten(num))
	end

	def test_check_ten_hyphens_and_x_valid_isbn10
		num = "1-943-829-08X"
		assert_equal("Valid ISBN",check_ten(num))
	end

	def test_invalid_isbn10_hypens_included
		num = "1-913129-088"
		assert_equal("Invalid ISBN",check_ten(num))
	end

	def test_num_length_invalid_isbn10_symbols_and_invalid_X
		num = "$194)3X82908x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_length_invalid_isbn10_parentheses_and_X
		num = "(194)328X208"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_length_isbn10_nad_symbol
		num = "98&2547"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn10_10_elements_7_digits
		num = "49s6(25)36"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn10_parentheses_in_middle
		num = "496(25)36859"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_num_length_isbn10_length_6
		num = "982547"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_num_length_x_wrong_position
		num = "8254x67898"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn10_invalid_symbol
		num = "7943%67898"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn10_two_symbols_one_x
		num = "25@45$633x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn10_with_hyphens_check_ten
		num = "192-36-567-85"
		assert_equal("Invalid ISBN",check_ten(num)) 
	end

	def test_invalid_isbn10_with_spaces_check_ten
		num = "192 567 2678"
		assert_equal("Invalid ISBN",check_ten(num))
	end

	def test_valid_isbn10_check_ten_no_symbols_or_letters
		num = "1235789543"
		assert_equal("Valid ISBN",check_ten(num))
	end

	def test_invalid_isbn10_with_x_in_last_place
		num = "653256789x"
		assert_equal("Invalid ISBN",check_ten(num))
	end

	def test_invalid_isbn10_with_x_on_end_no_symbols_check_ten
		num = "653256789x"
		assert_equal("Invalid ISBN",check_ten(num))
	end

	def test_num_length_invalid_isbn_empty_string
		num = ""
		assert_equal("Invalid ISBN",num_length(num))
	end	

	def test_num_length_invalid_isbn_string_with_space
		num = " "
		assert_equal("Invalid ISBN",num_length(num))
	end	

	def test_num_length_invalid_isbn_string_with_single_hyphen
		num = "-"
		assert_equal("Invalid ISBN",num_length(num))
	end	

	def test_invalid_isbn_length_invalid
		num = "46578"
		assert_equal("Invalid ISBN",num_length(num))
	end	

	def test_invalid_isbn10_x_wrong_position_num_length
		num = "8254x67898"
		assert_equal("Invalid ISBN",num_length(num))
	end	

	def test_invalid_isbn10_with_percent_symbol
		num = "7421%394761"
		assert_equal("Invalid ISBN",num_length(num))
	end	

	def test_invalid_isbn_with_symbols_and_valid_x
		num = "25@45$633x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn10_no_symbols_spaces_or_letters
		num = "1254568893"
		assert_equal("Invalid ISBN",check_ten(num))
	end

	def test_valid_isbn10_no_symbols_spaces_or_letters_check_ten
		num = "7421394761"
		assert_equal("Valid ISBN",check_ten(num))
	end	

	def test_valid_isbn_10_check_ten_8943567898
		num = "8943567898"
		assert_equal("Valid ISBN",check_ten(num))
	end	

	def test_num_length_invalid_num_2945017262
		num = "2945017262"
		assert_equal("Invalid ISBN",check_ten(num))
	end	

	def test_num_length_valid_num_4936017468
		num = "3-936017-46-8"
		assert_equal("Valid ISBN",check_ten(num))
	end	

	def test_num_length_invalid_num_4836268448
		num = "4836268448"
		assert_equal("Invalid ISBN",check_ten(num))
	end	

	def test_if_last_digit_is_x_checksum_is_10
		num = "869543256x"
		assert_equal("Invalid ISBN",check_ten(num))
	end

	def test_num_length_8_isbn13
		num = "29504376x53862"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_length_114_isbn13
		num = "9999-99-9999-999"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_length_isbn13_invalid_symbols
		num = "29@504-376525 69"
		assert_equal("Invalid ISBN",num_length(num)) 
	end

	def test_num_length_isbn13_invalid_spaces_and_symbols
		num = "2+1!584 1 76 527 89"
		assert_equal("Invalid ISBN",num_length(num)) 
	end

	def test_with_thirteen_digit_places_valid_isbn13_spaces
		num = "83254 978 62545"
		assert_equal("Valid ISBN",num_length(num))
	end

	def test_isbn_thirteen_invalid_isbn_and_x
		num = "83254x97862545"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_valid_isbn13_spaces_
		num = "978 04%7 0059 029"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_valid_isbn13_hyphens
		num = "978-047-0059-029"
		assert_equal("Valid ISBN",num_length(num))
	end

	def test_invalid_isbn13_num_length_s_in_middle
		num = "4780470s059029"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn_for_10
		num = "0-321@14653-0"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn_for_13
		num = "8-325@4978z6-2545"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn_19_digits
		num = "83-25#31!46@51*31%01_47=69$4"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_length_function_with_13_and_parentheses
		num = "8325(49)7862545"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_length_function_with_thirteen_numbers_and_symbols
		num = "83$2 54-9@786%2545"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_length_function_with_thirteen_numbers_and_parentheses
		num = "83$2>)54(9@786%254.5"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_length_word
		num = "word"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_check_x_less_than_10
		num = "7820"
		assert_equal("Invalid ISBN",check_x(num))
	end

	def test_check_x_less_than_10_invalid
		num = "782067"
		assert_equal("Invalid ISBN",num_length(num))
	end
end