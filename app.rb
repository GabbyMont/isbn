require 'sinatra'
require 'aws-sdk-s3'
require_relative 'isbn.rb'
require_relative 'isbn_csv.rb'
require_relative 'aws.rb'
load './local_env.rb' if File.exist?('./local_env.rb')

enable :sessions

get '/' do 
	session[:mod_num] = ""
	erb :enter_isbn
end

post '/first_page' do
	# puts params
	num = params[:num]
	session[:mod_num] = num_length(num)
	# p "this is modded num"
	# puts session[:mod_num]
	redirect '/second_page?num=' + num
end

get '/second_page' do
	data_array = []
	num = params[:num]
	# p CSV.read("isbn_file.csv")
	data = CSV.read("isbn_file.csv")
	data.each do |isbn|
		# p isbn
		data_array << isbn
	end
	data_array << [num, session[:mod_num]]
	csv_open(data_array)
	data = CSV.read("isbn_file.csv")
	erb :isbn_message, locals:{mod_num: session[:mod_num],num: num,data: data}
end

get '/redo' do
	erb :enter_isbn
end

post '/csv' do
	redirect '/results'
end

get '/results' do
	data_array = []
	num = params[:num]
	data = CSV.read("isbn_file.csv")
	connect = connect_to_s3
  	connect
    connect2 = connect_to_s3_2
    erb :results, locals:{mod_num: session[:mod_num], num: num, data: data, connect2:connect2}
	# erb :results, locals:{mod_num: session[:mod_num],num: num, data: data}
end