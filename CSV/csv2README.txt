Our CSV is a comma seperated array. We want to use the CSV method foreach, to iterate through the rows of the CSV, and do this as few times as possible.

Looking at the rows we want the program to perform several tasks.

As we look at each row, we want to clean the data as we need.  We need to delete newlines, (especially from the Account row, which seems to have the only problem)

When we look at money, in the inflow or outflow row, we need to convert it from string with "$" and "," to a float and back to a string with $ and , when we are done.

As we run through, we need to calculate the Total balance for each Account

We need to Find all the unique categories that contained outflow transactions for each Account

We need to sum the total inflow and outflow for the categories that contain outflow

We need to find the average transaction for the sum

Then we need to display it all, in an organized format:

We need, for every Row label, and for every Unique Category, to print a row that distributes space and dividers properly, and prints that space along with information that is variable in length.


The structure of this seems to imply that an account should be defined as a class.
the account class can contain some class variables useful to us

the organization of the class should be a csvAccount e.g. Priya = new.csvAccount


name - string (unique from Account Row)
uniqueCat - collection of unique categories with nonzero transactions
allowance - starting positive balance
totalEachCat - collection of total outflow (inflow and outflow) in each unique category
numEachCatTrans - collection of total # of transactions in each category (inflow and outflow)
accountAvgEachCat - collection of avg in each category

method of display -> Priya.printOutInfo, Sonia.printOutInfo


loop for each row
find unique values in account row -> Sonia, Priya
make a new.csvAccount for each account?
how would I loop through names to make new instances of a class? Can a variable name be a variable?


find unique values in category per each account
