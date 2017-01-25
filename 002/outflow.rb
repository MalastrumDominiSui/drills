require 'csv'
require 'pry'

def spent(str)  ## str is our category e.g. "Allowance"

num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		##expense = row[4].delete("\n")
			if row[3] == str
			num1 += row[4].gsub(/[$]/, '').to_f
			end  ##stackoverflow takes dollar sign substitutes with nothing
	end

puts "#{num1}"




end

spent("Rent")