subrequire 'csv'

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