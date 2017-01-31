require "csv"
require "pry"
class AccountInfo

  def set_up_initial_values
    @tally = 0.00
    @categories = {}
  end

  def update_tally(amount)
    @tally += amount
  end

  def add_category(category_name)
    @categories[category_name] = Category.new
    @categories[category_name].set_up_initial_values
  end

  def pretty_tally
    return @tally.round(2)
  end

  def already_has_category(category_name)
    return (@categories[category_name] != nil)
  end

  def category(category_name)
    return @categories[category_name]
  end

  def categories
    return @categories
  end
end

class Category
  def set_up_initial_values
    @tally = 0.00
    @num_transactions = 0
    @average_transaction_cost = 0.00
  end

  def add_transaction(amount)
    @tally += amount
    @num_transactions += 1
    @average_transaction_cost = @tally / @num_transactions
  end

  def tally_number
     return @tally.round(2)
  end

  def pretty_tally
   tally_number.to_s.ljust(10)
  end

  def pretty_avg_transaction
    @average_transaction_cost.round(2).to_s.ljust(20)
  end
end

class Outflow
  def set_value(number_string_from_csv)
    @value = number_string_from_csv.gsub(/[,\$]/, "").to_f.round(2)
  end

  def to_f
    return @value
  end
end

class Inflow
  def set_value(number_string_from_csv)
    @value = number_string_from_csv.gsub(/[,\$]/, "").to_f.round(2)
  end

  def to_f
    return @value
  end
end

accounts = {}

CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
  # Add a key for each account to the accounts Hash.
  account = row["Account"].chomp

  if !accounts[account]
    accounts[account] = AccountInfo.new
    accounts[account].set_up_initial_values
  end

  # Set the account which is being affected by this iteration.
  current_account = accounts[account]

  # Clean up outflow and inflow.
  outflow = Outflow.new
  outflow.set_value(row["Outflow"])
  inflow = Inflow.new
  inflow.set_value(row["Inflow"])
  
  transaction_amount = inflow.to_f - outflow.to_f

  # Keep a tally for current balance of the account.
  current_account.update_tally(transaction_amount)

  category = row["Category"].chomp

  # Initialize category.
  if !current_account.already_has_category(category)
    current_account.add_category(category)
  end

  # Add transaction for that category.
  current_account.category(category).add_transaction(transaction_amount)
end

#  Display

accounts.each do |name, info|
  puts "\n"
  puts "======================================================================"
  puts "Account: #{name}... Balance: $#{info.pretty_tally}"
  puts "======================================================================"
  puts "Category                     | Total Spent | Average Transaction"
  puts "---------------------------- | ----------- | -------------------------"
  info.categories.each do |category, c_info|
    print "#{category.ljust(28)} | $#{c_info.pretty_tally} | $#{c_info.pretty_avg_transaction}\n"
  end
  puts "\n"
end


# test of sum


#test of avg


#test of unique categories

## test of Category .pretty_tally??
a = 423.4
b = 0.0
c = 29.1298410289741
d = -1


# some of these, for example resultPretty is combining tests of both arithmetic and display function, so fix this, or parse

#also perhaps test the string scrubber?

testFloat = [a,b,c,d]
resultPretty = ["423.4     ","0.0       ","29.13     ","-1.0      "]  # of length 10
resultAddTrans = [423.4, 0.0, 29.13,-1.0]

## test pretty 
i = 0
while i<4 do
  testPrettyStr = testFloat[i].round(2).to_s.ljust(10)
  puts "pretty test: #{i} is #{testPrettyStr == resultPretty[i]}"
  i += 1
end



i = 0
while i<4 do
  farce = AccountInfo.new
  farce.set_up_initial_values
  farce.update_tally(testFloat[i])
  puts "update_tally test for AccountInfo result: #{i+1} is #{farce.pretty_tally == resultAddTrans[i]}"
  i += 1
end

i = 0
while i<4 do
  test2 = Category.new
  test2.set_up_initial_values
  test2.add_transaction(testFloat[i]) 
  puts "add_transaction test #{i+1} for Category result: #{test2.pretty_tally == resultPretty[i]}"
  i += 1
end

# This tests that the average is being calculated correctly
#division  need to go into function and pass the variable, set 
avgTestAry = [23,34,45,56,67,78,89,90]
avgTestAry_2 = [32,43,54,65,76,87,98,9]
avgExpectResult = ["27.5                ", "38.5                ", "49.5                ", "60.5                ", "71.5                ","82.5                ", "93.5                ", "49.5                "]

i = 0
while i < 8 do
  test3 = Category.new
  test3.set_up_initial_values
  test3.add_transaction(avgTestAry[i])
  test3.add_transaction(avgTestAry_2[i])
  puts "Test #{i+1} for pretty_avg_transaction #{test3.pretty_avg_transaction == avgExpectResult[i]}"
  i +=1
end

#categories
weasels =["Weasels"]
test4 = AccountInfo.new
test4.set_up_initial_values
test4.add_category(weasels)
print test4.already_has_category(weasels)