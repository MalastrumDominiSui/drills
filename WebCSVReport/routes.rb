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

	CSV.open("accounts.csv", "a") do |csv|
		binding.pry
		formArray = params.values
		formArray[4] = "$" + formArray[4]
		formArray[5] = "$" + formArray[5]
		formArray[1] = formArray[1].gsub(/[-]/,"/")
		csv << formArray

	end
	


	
	# binding.pry
	# @csvRow = @account + "," + @date + "," + @payee + "," + @category + "," + @inflow + "," + @outflow
	# binding.pry

	# {name=> Priya, date=> 12412 ,Payee=> WALGREENS, Category=> Medical/Dental, etcetc}
	#combine key values into one string with commas
	#CSV.open("./accounts.csv","ab") do |csv| # write to end of CSV file
end


get ("/Sonia+Priya"){
	build_accounts("bldrsdjvsldkvj")
	erb :csv_views
}

