require 'csv'
require 'pry'



## run spent for Every unique person,(e.g. sonya, priya) run spent for every unique category
##  for every unique(persons) & for every unique(categories) run spent(category) ==> [an array of arrays]

# def personCatSpent(pplArr,catArr)
# 	 pplArr.each do |person|

# 		#CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|

# 		catArr.each do |category|
# 			#CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
# 			spent(catArr[clength])
# 			clength -=

			
# 		end

# 		plength -=
# 	end

# end

##personCatSpent(csvUnique("Account"), csvUnique("Category"))






## spent takes an Category name (a string) and returns amount of total outflow in that Category

def spent(str)  ## str is our category e.g. "Allowance"

num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		##expense = row[4].delete("\n")
			if row[3] == str
			num1 += row[4].gsub(/[$]/, '').to_f
			end  ##stackoverflow takes dollar sign substitutes with nothing
	end

	return(num1)

end

##spent("Rent")

## takes name of header, finds all unique strings within that header row[num], returns an array of those strings

def csvUnique(str)
	rowArray = []
	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		category = row[str].delete("\n")
		rowArray.push(category)
	end
	uniqCat = rowArray.uniq

	return(uniqCat)
end

 
 sArray = []
 pArray = []

CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
	if row[0] == "Sonia"
		sArray.push(row["Category"])
	elsif 
		pArray.push(row["Category"])
	end
end

csvUnique("Account").each do |name|

	puts name
	# csvUnique("Category").each do |cat|
	# 	puts cat  + " $" + spent(cat).round(2).to_s
	# end

	puts sArray.uniq
	puts
	puts pArray.uniq
	
end

    

## balance function takes a user, all the outflow and inflow, and gives us the total sum for that user
def balance(str)

# CSV.foreach("/Users/michaelsefranek/Code/drills/002/accounts.csv", {headers: true, return_headers: false}) do |row|
# puts row["Outflow"]

# CSV.foreach("/Users/michaelsefranek/Code/drills/002/accounts.csv", {headers: true, return_headers: false}) do |row|
# puts row["Inflow"]


	return()
end

## spent function takes user, category, all the outflow sums in that category
def spent(str)

return()
end
## avg transaction takes user, category, all the outflow avgs in that category
def avg(str)

	return()
end


