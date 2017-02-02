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


# #end
# 	get ("/Priya"){
# 	build_accounts("Priya")
# 		erb :csv_views
# 	}


# 	get ("/Sonia+Priya"){
# 		build_accounts("bldrsdjvsldkvj")
# 		erb :csv_views
# 	}

