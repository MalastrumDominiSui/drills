require "sinatra"
require "./functions.rb"
require "CSV"
require "pry"
# http:/localhost:4567/ ...

	get ("/Sonia"){
	build_accounts("Sonia")

#
		erb :csv_views
	}
#end
	get ("/Priya"){
	build_accounts("Priya")
		erb :csv_views
	}


	get ("/Sonia+Priya"){
		build_accounts("bldrsdjvsldkvj")
		erb :csv_views
	}
get("/home"){
	erb :csv_home
}