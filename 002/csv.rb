require 'csv'

num1 = 0
num2 = 0

CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
	name = row[0].delete("\n")
	spent = []
	if name == "Priya"
		num1 += row[4].gsub(/[$]/, '').to_f  ##stackoverflow takes dollar sign substitutes with nothing
	elsif name == "Sonia"
		num2 += row[4].gsub(/[$]/, '').to_f

	end



end

puts "number is #{num1}"

puts "number is #{num2}"

# CSV.foreach("accounts.csv") do |row|
#     puts row.inspect
# end

# average_money_spent = Array.new
#   CSV.foreach('accounts.csv') do |row|
#     average_money_spent << row[2] / row[1]

##main function, prints information formatted

##collect all the unique categories take list of categories and give us a unique list
def uniqueList(str)


	return()
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


