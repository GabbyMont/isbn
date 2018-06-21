require 'sinatra'
require_relative 'isbn.rb'
require_relative 'isbn_csv.rb'

enable :sessions

get '/' do 
	session[:mod_num] = ""
	erb :enter_isbn
end

post '/first_page' do
	puts params
	num = params[:num]
	session[:mod_num] = num_length(num)
	p "this is modded num"
	puts session[:mod_num]
	redirect '/second_page?num=' + num
end

get '/second_page' do
	data_array = []
	num = params[:num]
	p CSV.read('isbn_file.csv')
	data = CSV.read('isbn_file.csv')
	data.each do |isbn|
		p isbn
		data_array << isbn
	end
	data_array << [num, session[:mod_num]]
	csv_open(data_array)
	erb :isbn_message, locals:{mod_num: session[:mod_num],num: num, data: data}
end

post '/second_page' do
	redirect '/redo'
end

get '/redo' do
	erb :enter_isbn
end