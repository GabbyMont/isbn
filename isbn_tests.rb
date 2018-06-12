require 'minitest/autorun'
require_relative 'isbn.rb'

class Isbn_test < Minitest::Test
	def test_true_is_true
		assert_equal(true,true)
	end

	def test_no_spaces
		num = "1943 82908x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_remove_spaces
		num = "1 943 829 08x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_cap
		num = "194382908x"
		assert_equal([194382908],num_length(num))
	end

	def test_remove_hyphens
		num = "1-943-829-08x"
		assert_equal([194382908],num_length(num))
	end

	def test_remove_symbols
		num = "1-943-829-08x"
		assert_equal([194382908],num_length(num))
	end

	def test_remove_parentheses
		num = "194)3X82908x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_X_in_middle
		num = "(194)328X208x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_num_length_1
		num = "98&2547"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_num_length_2
		num = "496(25)36"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_num_length_3
		num = "496(25)36859"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_num_length_4
		num = "982547"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_num_length_5
		num = "8254x67898"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_num_length_6
		num = "7943%67898"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_num_length_7
		num = "25@45$633x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_valid_num_length_1
		num = "192-36-567-85"
		assert_equal([192365678],num_length(num))
	end

	def test_valid_num_length_2
		num = "192 567 2678"
		assert_equal([192567267],num_length(num))
	end

	def test_valid_num_length_3
		num = "1235789543"
		assert_equal([123578954],num_length(num))
	end

	def test_valid_num_length_4
		num = "653256789x"
		assert_equal([653256789],num_length(num))
	end

	def test_valid_num_cap_1
		num = "653256789x"
		assert_equal([653256789],num_cap(num))
	end

	def test_invalid_num_cap_1
		num = "46578"
		assert_equal("Invalid ISBN",num_cap(num))
	end	

	def test_invalid_num_cap_2
		num = "8254x67898"
		assert_equal("Invalid ISBN",num_cap(num))
	end	

	def test_invalid_num_cap_3
		num = "7943%67898"
		assert_equal("Invalid ISBN",num_cap(num))
	end	

	def test_invalid_num_cap_4
		num = "25@45$633x"
		assert_equal("Invalid ISBN",num_cap(num))
	end

	def test_check_sum_1254568893
		num = "1254568893"
		assert_equal("Invalid ISBN",check_sum(num))
	end

	def test_check_sum_comparison_7421394761
		num = "7421394761"
		assert_equal("Valid ISBN",check_sum(num))
	end	

	def test_check_sum_invalid_num_7943567898
		num = "7943567898"
		assert_equal("Invalid ISBN",check_sum(num))
	end	

	def test_check_sum_valid_num_2945017262
		num = "2945017262"
		assert_equal("Valid ISBN",check_sum(num))
	end	

	def test_check_sum_invalid_num_4936017468
		num = "4936017468"
		assert_equal("Invalid ISBN",check_sum(num))
	end	

	def test_check_sum_valid_num_4836268448
		num = "4836268448"
		assert_equal("Valid ISBN",check_sum(num))
	end	

	def test_if_last_digit_is_x_checksum_is_10
		num = "869543256x"
		assert_equal("Valid ISBN",check_sum(num))
	end

	def test_num_length_114_isbn13
		num = "29504-37653862"
		assert_equal(114,num_length(num))
	end

	def test_num_length_isbn13_121
		num = "29@504-376525 69"
		assert_equal(121,num_length(num))
	end

	def test_num_length_isbn13_135
		num = "2+1!584 1 76 527 89"
		assert_equal(135,num_length(num))
	end
end