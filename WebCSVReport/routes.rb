require "sinatra"
require "./functions.rb"
require "CSV"
require "pry"
# http:/localhost:4567/ ...

get "/home" do
	erb :csv_home
end

get "/account" do
	@account_name = params
	build_accounts(@account_name["name"])
	erb :csv_views
end

post "/getinfo" do
	formArray = params.values # we tried to set this inside the if, but it seems better here because .include on the next line needs to work on an array (like formArray) rather than the hash (params)
	if formArray.include?("") == false  # we were trying to catch nil, but empty params actually seem to return "", so this conditional is better
		CSV.open("accounts.csv", "a") do |csv|
			formArray[4] = "$" + formArray[4] # does the formArray had to begin with @? not sure
			formArray[5] = "$" + formArray[5]
			formArray[1] = formArray[1].gsub(/[-]/,"/")
			csv << formArray # TODO : this somehow need to make a newLine so it doesnt keep appending to the same line
		end
	else
		redirect "/home" # it might be nice to define a site here that throws an error?
	end
	redirect "/account"

end