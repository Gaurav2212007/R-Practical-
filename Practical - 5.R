#Assignment 5 --------------------

# Install and Load Package 
install.packages("ggplot2") 
library(ggplot2) 
# ------------------------------------------------- 
# Create Dataset 
# ------------------------------------------------- 
set.seed(123) 
sales_data <- data.frame( 
  OrderID = 1:200, 
  CustomerName = sample( 
    c("Rahul","Amit","Priya","Neha","Arjun","Sneha","Rohit","Kiran","Pooja","Vikas"), 
    200, replace = TRUE 
  ), 
  City = 
    sample(c("Pune","Mumbai","Delhi","Bangalore","Hyderabad","Chennai","Kolkata"), 
           200, replace = TRUE 
    ), 
  Product = sample( 
    c("Laptop","Mobile","Tablet","Shoes", 
      "Watch","Headphones","Camera"), 
    200, 
    replace = TRUE 
  ), 
  Category = sample( 
    c("Electronics","Fashion","Accessories"), 
    200, 
    replace = TRUE 
  ), 
  Quantity = sample(1:10, 200, replace = TRUE), 
  Price = sample( 
    seq(500, 50000, 500),200,replace = TRUE), 
  Discount = sample( 
    c(0,5,10,15,20,25), 
    200, 
    replace = TRUE 
  ), 
  PaymentMethod = sample( 
    c("Cash","Card","UPI","Net Banking"), 
    200, 
    replace = TRUE 
  ) 
) 
# Create Calculated Columns 
sales_data$Revenue <- sales_data$Quantity * sales_data$Price 
sales_data$DiscountAmount <-  
  sales_data$Revenue * sales_data$Discount / 100 
sales_data$FinalAmount <-sales_data$Revenue - sales_data$DiscountAmount 
# Display First Rows 
head(sales_data) 


#Q1) Basic ggplot Charts 

#a) Create scatter plot of Price vs Revenue 
#b) Create bar chart for City 
#c) Create histogram of Price 
#d) Create boxplot of Revenue by Category 
#e) Create line chart for Revenue by OrderID 


#a) Create scatter plot of Price vs Revenue 
ggplot(sales_data, aes(x = Price, y = Revenue)) + 
  geom_point() 

#b) Create bar chart for City 
ggplot(sales_data, aes(x = City)) + 
  geom_bar() 

#c) Create histogram of Price 
ggplot(sales_data, aes(x = Price)) + 
  geom_histogram(bins = 20) 

#d) Create boxplot of Revenue by Category 
ggplot(sales_data, aes(x = Category, y = Revenue)) + 
  geom_boxplot() 

#e) Create line chart for Revenue by OrderID 
ggplot(sales_data, aes(x = OrderID, y = Revenue)) + 
  geom_line() 

#Q2) Customized Visualization 

#a) Add title to chart 
#b) Change axis labels 
#c) Change color of bars 
#d) Change theme style 
#e) Rotate x-axis labels 

#Customized Visualization 

#a) Add title to chart 
ggplot(sales_data, aes(x = City)) + 
  geom_bar() + 
  labs(title = "Orders by City") 

#b) Change axis labels 
ggplot(sales_data, aes(x = Price, y = Revenue)) + 
  geom_point() + 
  labs(x = "Product Price", y = "Total Revenue") 

#c) Change color of bars 
ggplot(sales_data, aes(x = City)) + 
  geom_bar(fill = "blue") 

#d) Change theme style 
ggplot(sales_data, aes(x = City)) + 
  geom_bar() + 
  theme_minimal() 

#e) Rotate x-axis labels 
ggplot(sales_data, aes(x = Product)) + 
  geom_bar() + 
  theme(axis.text.x = element_text(angle = 45)) 

#Q3) Multi-Variable Visualization 

#a) Price vs Revenue colored by Category 
#b) Price vs Quantity colored by Category 
#c) Revenue vs Discount 
#d) Top cities by revenue 
#e) Top products by sales 

#Multi-Variable Visualization 

#a) Price vs Revenue colored by Category 
ggplot(sales_data, aes(x = Price, y = Revenue, color = Category)) + 
  geom_point() 

#b) Price vs Quantity colored by Category 
ggplot(sales_data, aes(x = Price, y = Quantity, color = Category)) + 
  geom_point() 

#c) Revenue vs Discount 
ggplot(sales_data, aes(x = Discount, y = Revenue)) + 
  geom_point() 

#d) Top cities by revenue 
city_rev <- aggregate(
  x = list(TotalRevenue = sales_data$Revenue),
  by = list(City = sales_data$City),
  FUN = sum
)

ggplot(city_rev, aes(x = City, y = TotalRevenue)) +
  geom_bar(stat = "identity")

#e) Top products by sales 
product_sales <- aggregate(
  x = list(TotalRevenue = sales_data$Revenue),
  by = list(Product = sales_data$Product),
  FUN = sum
)

ggplot(product_sales, aes(x = Product, y = TotalRevenue)) +
  geom_bar(stat = "identity")

#Q4) Bar Chart, Scatter Plot, Histogram Analysis 

#a) Number of orders per city. (Bar Chart). 
#b) Price vs Revenue. (Scatter Plot) 
#c) Quantity vs Revenue (Scatter Plot) 
#d) Distribution of Quantity (Histogram) 
#e) Histogram by Category (Histogram) 

#Bar Chart, Scatter Plot, Histogram Analysis 

#a) Number of orders per city (Bar Chart) 
ggplot(sales_data, aes(x = City)) + 
  geom_bar() 

#b) Price vs Revenue (Scatter Plot) 
ggplot(sales_data, aes(x = Price, y = Revenue)) + 
  geom_point() 

#c) Quantity vs Revenue (Scatter Plot) 
ggplot(sales_data, aes(x = Quantity, y = Revenue)) + 
  geom_point() 

#d) Distribution of Quantity (Histogram) 
ggplot(sales_data, aes(x = Quantity)) + 
  geom_histogram(bins = 10) 

#e) Histogram by Category 
ggplot(sales_data, aes(x = Revenue, fill = Category)) + 
  geom_histogram(bins = 20) 

#Q5) Box Plot, Line Chart, Faceted Chart Analysis 

#a) Revenue by Category (Box Plot) 
#b) Price by Product (Box Plot) 
#c) Revenue trend by OrderID (Line Chart) 
#d) Discount trend (Line Chart) 
#e) City orders by category (Faceted Chart) 

#Box Plot, Line Chart, Faceted Chart Analysis 

#a) Revenue by Category (Box Plot) 
ggplot(sales_data, aes(x = Category, y = Revenue)) + 
  geom_boxplot() 

#b) Price by Product (Box Plot) 
ggplot(sales_data, aes(x = Product, y = Price)) + 
  geom_boxplot() 

#c) Revenue trend by OrderID (Line Chart) 
ggplot(sales_data, aes(x = OrderID, y = Revenue)) + 
  geom_line() 

#d) Discount trend (Line Chart) 
ggplot(sales_data, aes(x = OrderID, y = Discount)) + 
  geom_line() 

#e) City orders by category (Faceted Chart) 
ggplot(sales_data, aes(x = City)) + 
  geom_bar() + 
  facet_wrap(~Category)

