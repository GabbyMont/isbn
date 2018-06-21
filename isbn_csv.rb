require 'csv'

def csv_open(isbn_array)
	CSV.open('isbn_file.csv', 'wb') do |csv|
		# csv << ["ISBN", "Status"]
		isbn_array.each do |isbn|
			csv << isbn
		end
	end
end

p CSV.read("isbn_file.csv")