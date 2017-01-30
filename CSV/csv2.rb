### Remake optimizing, definitely using hashes, possibly using hashes.  I will attempt to do solo
require "csv"
require "pry"

accounts = {}

# {
#   "Priya" => {
#     "tally" => 0.00,
#     "categories" => {
#       "Entertainment" => {
#         "tally" => 332.03,
#         "average_transaction_cost" => 34.00
#       },
#       "Rent" => {
#         "tally" => 278.03,
#         "average_transaction_cost" => 34.00
#       },
#       "Utilities" => {
#         "tally" => 1232.03,
#         "average_transaction_cost" => 34.00
#       }
#     }
#   },

#   "Sonia" => {...}
# }

class Account
  def set_up_initial_values
    @tally = 0.00    
    @categories = {}
  end

  def update_tally(amount)
    @tally += amount
  end

  def doesnt_have_category(category_name)
    @categories[category_name] == nil
  end

  def add_category(category_name)
    @categories[category_name] = Category.new
    @categories[category_name].set_up_initial_values
  end
end

class Category
  def set_up_initial_values
    @tally = 0.00
    @num_transactions = 0
    @average_transaction_cost = 0.00
  end
end

class Outflow
  def set_value(value_from_the_csv)
    @value = value_from_the_csv.gsub(/[,\$]/, "").to_f.round(2)
  end

  def to_f
    return @value
  end
end

class Inflow
  def set_value(value_from_the_csv)
    @value = value_from_the_csv.gsub(/[,\$]/, "").to_f.round(2)
  end

  def to_f
    return @value
  end
end

CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
  # Add a key for each account to the accounts Hash.
  account = row["Account"].chomp

  if !accounts[account]
    accounts[account] = Account.new
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
  if current_account.doesnt_have_category(category)
    current_account.add_category(category)
  end

  # Tally category.
  current_account[:categories][category][:tally] += transaction_amount

  # Increment transaction counter.
  current_account[:categories][category][:num_transactions] += 1

  # Update average transaction cost.
  current_account[:categories][category][:average_transaction_cost] = current_account[:categories][category][:tally] / current_account[:categories][category][:num_transactions]  

end

#  Display

accounts.each do |name, info|
  puts "\n"
  puts "======================================================================"
  puts "Account: #{name}... Balance: $#{info[:tally].round(2)}"
  puts "======================================================================"
  puts "Category                     | Total Spent | Average Transaction"
  puts "---------------------------- | ----------- | -------------------------"
  info[:categories].each do |category, c_info|
    print "#{category.ljust(28)} | $#{c_info[:tally].round(2).to_s.ljust(10)} | $#{c_info[:average_transaction_cost].round(2).to_s.ljust(20)}\n"
  end
  puts "\n"
end