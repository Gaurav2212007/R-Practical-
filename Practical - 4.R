#Assignment 4 -----------------------

# Create sample sales dataset

sales_data <- data.frame(
  OrderID = 1:10,
  
  CustomerName = c(
    "Rahul","Amit","Priya","Neha","Arjun",
    "Sneha","Rohit","Kiran","Pooja","Vikas"
  ),
  
  City = c(
    "Pune","Mumbai","Delhi","Bangalore","Hyderabad",
    "Pune","Mumbai","Delhi","Bangalore","Hyderabad"
  ),
  
  Product = c(
    "Laptop","Mobile","Tablet","Shoes","Watch",
    "Laptop","Mobile","Tablet","Shoes","Watch"
  ),
  
  Category = c(
    "Electronics","Electronics","Electronics",
    "Fashion","Fashion",
    "Electronics","Electronics","Electronics",
    "Fashion","Fashion"
  ),
  
  Quantity = c(
    2,1,3,5,2,
    1,4,2,3,1
  ),
  
  Price = c(
    50000,25000,15000,3000,5000,
    52000,27000,14000,3500,6000
  )
)

print(sales_data)

#Import dataset from CSV and Excel file 
sales_data <- read.csv("…\\CSV_File\\sales_data.csv") 
sales_data_Excel <- read_excel("…\\Excel_File\\sales_data.xlsx") 


#Q1) Importing and Exploring Data from CSV file and Excel File 

#a) Import dataset from CSV file and Excel file. 
#b) Display first 10 rows. 
#c) Display last 10 rows. 
#d) Check structure of dataset. 
#e) Display summary statistics. 

#Dataset Import 
# Import CSV file 
sales_data <- read.csv("sales_data.csv") 
# Import Excel file 
library(readxl) 
sales_data_Excel <- read_excel("sales_data.xlsx") 

#Importing and Exploring Data from CSV file and Excel File 
#a) Import dataset from CSV file and Excel file 
sales_data <- read.csv("sales_data.csv") 
library(readxl) 
sales_data_Excel <- read_excel("sales_data.xlsx") 

#b) Display first 10 rows 
head(sales_data, 10) 

#c) Display last 10 rows 
tail(sales_data, 10) 

#d) Check structure of dataset 
str(sales_data) 

#e) Display summary statistics 
summary(sales_data) 


#Q2) Exporting Data  

#a) Export dataset to CSV file. 
#b) Export dataset to Excel file. 
#c) Export only Electronics category. 
#d) Export customers from Pune. 
#e) Export top 20 rows. 

#Exporting Data 
#a) Export dataset to CSV file 
write.csv(sales_data, "output_sales_data.csv", row.names = FALSE) 

#b) Export dataset to Excel file 
library(writexl) 
write_xlsx(sales_data, "output_sales_data.xlsx") 

#c) Export only Electronics category 
electronics_data <- sales_data[sales_data$Category == "Electronics", ] 
write.csv(electronics_data, "electronics_data.csv", row.names = FALSE) 

#d) Export customers from Pune 
pune_customers <- sales_data[sales_data$City == "Pune", ] 
write.csv(pune_customers, "pune_customers.csv", row.names = FALSE) 

#e) Export top 20 rows 
top20 <- head(sales_data, 20) 
write.csv(top20, "top20.csv", row.names = FALSE) 


#Q3) Modifying Data and Subset Creation 

#1. Create Profit column. 
#2. Rename FinalAmount column. 
#3. Remove DiscountAmount column. 
#4. Add Tax column. 
#5. Select orders with Quantity > 5 by using subset creation. 

# Create Revenue Column
sales_data$Revenue <- sales_data$Quantity * sales_data$Price

# Create DiscountAmount Column
# Assume 10% Discount
sales_data$DiscountAmount <- sales_data$Revenue * 0.10

# Create FinalAmount Column
sales_data$FinalAmount <- sales_data$Revenue - sales_data$DiscountAmount

# Display Data
print(sales_data)

#1. Create Profit Column
#Assume Profit = 20% of FinalAmount
sales_data$Profit <- sales_data$FinalAmount * 0.20

cat("\nProfit Column Added\n")
print(sales_data)

#2. Rename FinalAmount to NetAmount
names(sales_data)[names(sales_data) == "FinalAmount"] <- "NetAmount"

cat("\nColumn Renamed\n")
print(names(sales_data))

#3. Remove DiscountAmount Column
sales_data$DiscountAmount <- NULL

cat("\nDiscountAmount Column Removed\n")
print(sales_data)

#4. Add Tax Column
#Assume Tax = 18% of NetAmount
sales_data$Tax <- sales_data$NetAmount * 0.18

cat("\nTax Column Added\n")
print(sales_data)

#5. Select Orders with Quantity >= 5
high_quantity_orders <- subset(
  sales_data,
  Quantity >= 5
)

cat("\nOrders with Quantity >= 5\n")
print(high_quantity_orders)


#Q4) Column Selection 

#1. Select CustomerName and Product columns. 
#2. Select first 5 columns. 
#3. Select numeric columns. 
#4. Remove Discount column. 
#5. Select specific columns using index. 

#Column Selection 
#1) Select CustomerName and Product columns 
sales_data[, c("CustomerName", "Product")] 

#2) Select first 5 columns 
sales_data[, 1:5] 

#3) Select numeric columns 
sales_data[sapply(sales_data, is.numeric)] 

#4) Remove Discount column 
sales_data$Discount <- NULL 
head(sales_data) 

#5) Select specific columns using index 
sales_data[, c(2,4,6)] 


#Q5) Sorting Data 

#1. Sort by City alphabetically. 
#2. Sort by City and Revenue 
#3. Average price by city. 
#4. Maximum order value by city. 
#5. Total quantity sold by city. 

#Sorting Data 
#1) Sort by City alphabetically 
sales_data[order(sales_data$City), ] 

#2) Sort by City and Revenue 
sales_data[order(sales_data$City, -sales_data$Revenue), ] 

#4) Maximum order value by city 
aggregate(Revenue ~ City, sales_data, max) 

#5) Total quantity sold by city 
total_quantity_city <- stats::aggregate(
  x = list(TotalQuantity = sales_data$Quantity),
  by = list(City = sales_data$City),
  FUN = base::sum
)

print(total_quantity_city)