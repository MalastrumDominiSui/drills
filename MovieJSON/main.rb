require "sinatra"
require "pry"

get "/" do
  erb :home
end

get "/results" do
	ourQuery = params['query']
	erb :"#{ourQuery}"
end