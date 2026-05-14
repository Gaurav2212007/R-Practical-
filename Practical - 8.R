#Assignment 8 ----------------------

# INSTALL AND LOAD REQUIRED PACKAGE 

install.packages("readxl") 

library(readxl) 

# Create Sales Dataset 
set.seed(123) 
sales <- data.frame( 
  
  Product = sample( 
    c("Laptop","Mobile","Tablet", 
      "Shoes","Watch"), 
    100, 
    replace = TRUE 
  ), 
  
  Category = sample( 
    c("Electronics","Fashion"), 
    100, 
    replace = TRUE 
  ), 
  
  Quantity = sample( 
    1:100, 
    100, 
    replace = TRUE 
  ), 
  
  Price = sample( 
    seq(500,50000,500), 
    100, 
    replace = TRUE 
  ) 
) 
# Create Revenue 
sales$Revenue <- 
  sales$Quantity * 
  sales$Price 

#Q1) A Retail Sales Analysis (Dataset: sales.csv) 

#a) Load the sales dataset and display the first 10 records. 
#b) Calculate total revenue for each product. 
#c) Find the top 5 products with highest revenue. 
#d) Filter sales where quantity sold is greater than 50. 
#e) Find average product price by category. 


#a) Load the sales dataset and display the first 10 records. 
# Display first 10 records 
head(data, 10) 

Explanation: 
  • head() function displays top records from dataset.  
• 10 specifies first 10 rows.  

# b) Total Revenue for Each Product 
aggregate( 
  Revenue ~ Product, 
  sales, 
  sum 
) 

# c) Top 5 Products with Highest Revenue 
top_products <- 
  aggregate( 
    Revenue ~ Product, 
    sales, 
    sum 
  ) 
top_products[ 
  order(-top_products$Revenue), 
][1:5, ] 

# d) Quantity Sold Greater than 50 
subset( 
  sales, 
  Quantity > 50 
) 

# e) Average Product Price by Category 
aggregate( 
  Price ~ Category, 
  sales, 
  mean 
) 

#Q2) The E-Commerce Customer Analysis (Dataset: customers.csv) 

#a) Load the customers dataset and display the first 10 records. 
#b) Calculate average purchase amount. 
#c) Find customers above average purchase amount. 
#d) Count number of male and female customers. 
#e) Create age groups: Youth (<25), Adult (25–50), Senior (>50) 
#f) Find top 10 highest spending customers. 

# Create Customer Dataset 
customers <- data.frame( 
  CustomerID = 1:100, 
  Gender = sample( 
    c("Male","Female"), 
    100, 
    replace = TRUE 
  ), 
  Age = sample( 
    18:70, 
    100, 
    replace = TRUE 
  ), 
  PurchaseAmount = sample( 
    1000:50000, 
    100, 
    replace = TRUE 
  ) 
) 

#a) Load the customers dataset and display the first 10 records. 
# Display first 10 records 
head(data, 10) 

Explanation: 
  • head() function displays the first rows of the dataset.  
• 10 specifies first 10 records.  

#b) Calculate average purchase amount. 
# Average Purchase Amount 
mean(customers$PurchaseAmount) 

Explanation: 
  • mean() calculates average purchase amount of all customers.  

#c) Find customers above average purchase amount. 
# Customers Above Average Purchase 
avg_purchase <- 
  mean(customers$PurchaseAmount) 
subset( 
  customers, 
  PurchaseAmount > avg_purchase 
) 

Explanation: 
  • filter() selects customers whose purchase amount is greater than average.  

#d) Count number of male and female customers. 
# Gender Count 
table(customers$Gender)  

gender_count 
Explanation: 
  • table() counts frequency of each gender category.  

#e) Create age groups: Youth (<25), Adult (25–50), Senior (>50) 
# Create Age Groups 
customers$AgeGroup <- 
  ifelse( 
    customers$Age < 25, 
    "Youth", 
    ifelse( 
      customers$Age <= 50, 
      "Adult", 
      "Senior" 
    ) 
  ) 
head(customers) 
# Display Dataset 
head(data) 

Explanation: 
  • Youth → Age below 25  
• Adult → Age between 25 and 50  
• Senior → Age above 50  

#f) Find top 10 highest spending customers. 

# Top 10 Highest Spending Customers 
customers[ 
  order(-customers$PurchaseAmount), 
][1:10, ] 

#Explanation: 
• arrange(desc()) sorts customers by highest purchase amount.  
• head(10) returns top 10 spending customers. 

# Q3) BANKING TRANSACTION ANALYSIS

#Create Transactions Dataset 
transactions <- data.frame( 
  AccountID = 1:100, 
  Type = sample( 
    c("Deposit","Withdrawal"), 
    100, 
    replace = TRUE 
  ), 
  Amount = sample( 
    1000:20000, 
    100, 
    replace = TRUE 
  ) 
) 

#a) Load the transactions dataset and display the first 10 records. 
# Display First 10 Records 
head(transactions, 10)

Explanation: 
  • head() displays the top rows of the dataset.  
• 10 specifies first 10 records.  

#b) Calculate total deposits. 
# Total Deposits 
sum( 
  transactions$Amount[ 
    transactions$Type == "Deposit" 
  ] 
)

Explanation: 
  • Filters only deposit transactions.  
• sum() calculates total deposited amount.  

#c) Calculate total withdrawals. 
# Total Withdrawals 
sum( 
  transactions$Amount[ 
    transactions$Type == "Withdrawal" 
  ] 
) 

Explanation: 
  • Filters withdrawal transactions.  
• Calculates total withdrawn amount.  

#d) Find accounts with transactions above 10000. 
# Transactions Above 10000 
subset( 
  transactions, 
  Amount > 10000 
) 

Explanation: 
  • Displays accounts where transaction amount exceeds 10000.  

#e) Calculate average transaction amount. 
# Average Transaction Amount 
mean(transactions$Amount) 

Explanation: 
  • mean() calculates average transaction amount.  

#f) Count number of transactions by type. 
# Transaction Count by Type 
table(transactions$Type) 

Explanation: 
  • table() counts frequency of each transaction type.  
• Example: Deposit, Withdrawal, Transfer, etc. 

#Q4) The Healthcare Patient Dataset (patients.csv) 

#a) Load the patient’s dataset and display the first 10 records. 
#b) Find patients with high blood pressure (>140). 
#c) Detect patients with fever (>37°C). 
#d) Calculate average patient age. 
#e) Find maximum and minimum blood pressure. 
#f) Count number of patients above 60 years. 

# Create Patient Dataset 
patients <- data.frame( 
  PatientID = 1:100, 
  Age = sample( 
    1:90, 
    100, 
    replace = TRUE 
  ), 
  BloodPressure = sample( 
    90:180, 
    100, 
    replace = TRUE 
  ), 
  Temperature = runif( 
    100, 
    35, 
    40 
  ) 
) 

#a) Load the patient’s dataset and display the first 10 records. 
# Display First 10 Records 
head(patients, 10) 

Explanation: 
  • head() displays top rows of dataset.  
• 10 specifies first 10 patient records.  

#b) Find patients with high blood pressure (>140). 
# High Blood Pressure Patients 
subset( 
  patients, 
  BloodPressure > 140 
) 

Explanation: 
  • filter() selects patients having blood pressure greater than 140.  

#c) Detect patients with fever (>37°C). 
# Patients with Fever 
subset( 
  patients, 
  Temperature > 37 
) 

Explanation: 
  • Filters patients whose body temperature exceeds 37°C.  

#d) Calculate average patient age. 
# Average Age 
mean(patients$Age)

Explanation: 
  • mean() calculates average age of patients.  

#e) Find maximum and minimum blood pressure. 
# Maximum Blood Pressure 
max(patients$BloodPressure) 
min(patients$BloodPressure) 

Explanation: 
  • max() returns highest blood pressure.  
• min() returns lowest blood pressure.  

#f) Count number of patients above 60 years. 
# Patients Above 60 
sum(patients$Age > 60)

Explanation: 
  • filter() selects patients above 60 years.  
• nrow() counts total such patients. 

#Q5) The Student Performance Dataset (students.csv) 

#a) Load the students dataset and display the first 10 records. 
#b) Find students who scored above 80. 
#c) Calculate average marks by subject. 
#d) Find top scoring student. 
#e) Find students who failed (Marks < 40). 
#f) Count number of students in each subject. 

# Create Student Dataset 
students <- data.frame( 
  StudentID = 1:100, 
  Subject = sample( 
    c("Maths","Science","English"), 
    100, 
    replace = TRUE 
  ), 
  Marks = sample( 
    1:100, 
    100, 
    replace = TRUE 
  ) 
)  

#a) Load the students dataset and display the first 10 records. 
# Display First 10 Records 
head(students, 10) 

Explanation: 
  • head() displays the top rows of the dataset.  
• 10 specifies first 10 student records.  

#b) Find students who scored above 80. 
# Students Scoring Above 80 
subset( 
  students, 
  Marks > 80 
) 

Explanation: 
  • filter() selects students with marks greater than 80.  

#c) Calculate average marks by subject. 
# Average Marks by Subject 
aggregate( 
  Marks ~ Subject, 
  students, 
  mean 
) 

Explanation: 
  • Groups data subject-wise.  
• mean() calculates average marks for each subject.  

#d) Find top scoring student. 
# Top Scoring Student 
students[ 
  which.max(students$Marks), 
] 

Explanation: 
  • arrange(desc(Marks)) sorts marks in descending order.  
• head(1) returns highest scoring student.  

#e) Find students who failed (Marks < 40). 
# Failed Students 
subset( 
  students, 
  Marks < 40 
)   

Explanation: 
  • Displays students scoring below 40 marks.  

#f) Count number of students in each subject. 
# Student Count by Subject 
table(students$Subject)  

Explanation: 
  • table() counts number of students in each subject category. 

#Q6) The Social Media Analytics Dataset (posts.csv) 

#a) Load the posts dataset and display the first 10 records. 
#b) Calculate total engagement per post. 
#c) Find posts with engagement > 500. 
#d) Find most liked post. 
#e) Calculate average engagement. 
#f) Find posts with low engagement (<100). 

# Create Posts Dataset 
posts <- data.frame( 
  PostID = 1:100, 
  Likes = sample( 
    1:80, 
    100, 
    replace = TRUE 
  ), 
  Comments = sample( 
    1:40, 
    100, 
    replace = TRUE 
  ), 
  Shares = sample( 
    1:20, 
    100, 
    replace = TRUE 
  ) 
) 
# Create Engagement Column 
posts$Engagement <- 
  posts$Likes + 
  posts$Comments + 
  posts$Shares  

#a) Load the posts dataset and display the first 10 records. 
# Display First 10 Records 
head(posts, 10) 

Explanation: 
  • head() displays the top rows of the dataset.  
• 10 specifies first 10 records.  

#b) Calculate total engagement per post. 
# Total Engagement 
posts[, c("PostID", "Engagement")] 

Explanation: 
  • Total Engagement = Likes + Comments + Shares  

#c) Find posts with engagement > 500. 
# Posts with High Engagement 
subset( 
  posts, 
  Engagement > 500 
)  

subset( 
  posts, 
  Engagement > 100 
)  

Explanation: 
  • Filters posts having engagement greater than 500 and 100.  

#d) Find most liked post. 
# Most Liked Post 
posts[ 
  which.max(posts$Likes), 
]  

Explanation: 
  • Sorts posts by likes in descending order.  
• Returns the post with highest likes.  

#e) Calculate average engagement. 
# Average Engagement 
mean(posts$Engagement)  

Explanation: 
  • mean() calculates average engagement across all posts.  

#f) Find posts with low engagement (<100). 
# Low Engagement Posts 
subset( 
  posts, 
  Engagement < 100 
)

Explanation: 
  • Displays posts whose total engagement is less than 100. 


