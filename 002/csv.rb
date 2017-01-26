require 'csv'
require 'pry'


## cleans a string from money, decimal point
def scrub(str)
	scrubstr = str.delete("$").delete(",").delete("\n")
	return(scrubstr)
end


## NOT SURE: run spent for Every unique person,(e.g. sonya, priya) run spent for every unique category
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




## WORKS: spent takes an Category name (a string) and returns amount of total outflow in that Category

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


## WORKS: takes name of header, finds all unique strings within that header row[num], returns an array of those strings

def csvUnique(str)
	rowArray = []
	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		category = row[str].delete("\n")
		rowArray.push(category)
	end
	uniqCat = rowArray.uniq

	return(uniqCat)
end

## WORKS: specific variation of csvUnique : takes an string of an account name (e.g Sonia) and prints name and all its unique accounts
def csvUniqCatForName(strAcct)
	catchArray = []
	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		cleanCategory = scrub(row[3])
		cleanAcct = scrub(row[0])
		if cleanAcct == strAcct
			catchArray.push(cleanCategory)
		end
	end
	uniqCat = catchArray.uniq

	puts
	puts strAcct
	puts
	puts uniqCat

	return(uniqCat)
end

csvUniqCatForName("Sonia")

csvUniqCatForName("Priya")


 ## display workhorse
#  sArray = []
#  pArray = []

# CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
# 	if row[0] == "Sonia"
# 		sArray.push(row["Category"])
# 	elsif 
# 		pArray.push(row["Category"])
# 	end
# end

# csvUnique("Account").each do |name|

# 	puts name
# 	# csvUnique("Category").each do |cat|
# 	# 	puts cat  + " $" + spent(cat).round(2).to_s
# 	# end

# 	puts sArray.uniq
# 	puts
# 	puts pArray.uniq
	
# end

    

## WORKS: balance function takes a user, all the outflow and inflow, and gives us the total sum for that user
def balance(strAcct)
	bal = 0
	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		cleanAcct = row[0].delete("\n")   ## cleans up newlines
		if cleanAcct == strAcct 
			bal = bal + scrub(row[5]).to_f - scrub(row[4]).to_f
		end
	end
	puts strAcct
	puts
	puts bal
	return(bal)
end
balance("Priya")
balance("Sonia")


## spent function takes user, category, all the outflow sums in that category
def spent(str)

return()
end
## avg transaction takes user, category, all the outflow avgs in that category
def avg(str)

	return()
end


