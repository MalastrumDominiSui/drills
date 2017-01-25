
require 'pry'
require 'csv'

def csvUnique(num)
	rowArray = []
		CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
			category = row[num].delete("\n")
			rowArray.push(category)
		end
	uniqCat = rowArray.uniq
	print uniqCat
	return(uniqCat)
end

csvUnique(0)
