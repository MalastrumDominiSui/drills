require 'csv'
require 'pry'

## cleans a string from money, decimal point
def scrub(str)
    scrubstr = str.delete("$").delete(",").delete("\n")
    return(scrubstr)
end

## Finds Sum of Out Flow for Each Catagories for Each Account, accounting for refund
def perCatSpend(catStr, acctStr)  

	num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
		if row[3].delete("\n") == catStr && row[0].delete("\n") == acctStr
			num1 -= row["Outflow"].gsub(/[^\d\.]/, '').to_f
			num1 += row["Inflow"].gsub(/[^\d\.]/, '').to_f
		end  
	end

 	
	return(num1)

end

## Used to Find Allowance. Sums InFlow for Each Account
def allowance(account_name)  

	allowance_total = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
		if row[3].delete("\n") == "Allowance" && row[0].delete("\n") == account_name
			allowance_total += row["Inflow"].gsub(/[^\d\.]/, '').to_f
		end  
	end

	return(allowance_total)

end

## for account_ name gives  total spent in everything BUT "Allowance"
def eachSpent(account_name)  

	total_spent = 0
	

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
		if row["Account"].delete("\n") == account_name && row["Category"] != "Allowance" 
			total_spent += row["Outflow"].gsub(/[$]/, '').to_f
			total_spent -= row["Inflow"].gsub(/[$]/, '').to_f			
		end  
	
	end
	
	return(total_spent)

end

## takes a name, and counts nonzero transactions, and gives the average, and count for that Acct

def avg(account_name, category) 
	counter = 0
	number_of_accounts = []

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
	
		if row["Account"].delete("\n") == account_name && row["Category"].delete("\n") == category

			if row["Outflow"].gsub(/[$]/, '').to_f == 0.0

				number_of_accounts.push(row["Inflow"].gsub(/[^\d\.]/, '').to_f)


			else 
				number_of_accounts.push(row["Outflow"].gsub(/[^\d\.]/, '-').to_f) 

			end

				
		end  
	
	end


	average = number_of_accounts.sum  / number_of_accounts.length
		


	return(average.round(2))
end

## takes name of header, finds all unique strings within that header row[num], returns an array of those strings

def uniqueValuesInColumn(header_str)
	valuesArr = []
	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		value = row[header_str].delete("\n")
		valuesArr.push(value)
	end

	return(valuesArr.uniq)
end

## specific variation of csvUnique : takes an string of an account name (e.g Sonia) and prints name and all its unique accounts
def csvUniqCatForName(strAcct)
    catchArray = []
    CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
        cleanCategory = scrub(row["Category"])
        cleanAcct = scrub(row["Account"])
        if cleanAcct == strAcct
            catchArray.push(cleanCategory)
        end
    end
    uniqCat = catchArray.uniq
    return(uniqCat)
end

## takes a string and a number gives us a string with that number of spaces after and a divider "|"

def makeSpaceStr (csvStr , spaceNum)
	spaces = spaceNum - csvStr.length 
	spaces1 = " " * spaces 

	return(print csvStr + spaces1)

end

########################################################################
#         BEGINNING OF MAIN CODE FOR FORMATTING TERMINAL               #
########################################################################


uniqueValuesInColumn("Account").each do |name|

	balance = allowance(name) - eachSpent(name)
   		puts "=" * 69
    	puts "Account: #{name}... Balance: $#{balance.round(2)}"
    	puts "=" * 69
      	
      	makeSpaceStr(" Category", 30)
      	print "|"
      	makeSpaceStr(" Total Spent", 17)
      	print "|" 
      	makeSpaceStr(" Average Transaction", 22)
      	puts 
      	print "-" * 30
      	print "|"
      	print "-" * 17
      	print "|"
      	print "-" * 22
      	puts

		# display all the spend
		csvUniqCatForName(name).each do |cat|
			spentRow = perCatSpend(cat, name).round(2).to_s
			makeSpaceStr(cat, 30) 
			print "|"
			print " $"
		   	makeSpaceStr(spentRow, 15) 
		   	print "|"
		   	print " $"
		   	makeSpaceStr(avg(name, cat).to_s, 20)
		   	puts  #with average #{avg(name, cat)} #{cat.length}"		    
		end
end


