
amount = 1.26

    qCount = 0
    dCount = 0
    nCount = 0
    pCount = 0
    
    qCount = (amount / 0.25).floor
     amount = amount % 0.25
     puts "#{qCount}"
     
    dCount = (amount / 0.10).floor
     amount = amount % 0.10
     puts "#{dCount}"
     
    nCount = (amount / 0.05).floor
     amount = amount % 0.05
     puts "#{nCount}"
     
    pCount = (amount / 0.01).floor
    puts "#{pCount}"
     
     puts "You have #{qCount} Quarters, #{dCount} Dimes #{nCount} Nickels, and #{pCount} Pennies."
     
     ## type ruby coin.rb to test this.  I was typing node coins.rb like an idiot, getting errors
    

