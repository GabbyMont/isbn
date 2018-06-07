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
end