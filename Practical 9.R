#Assignment 9 -----------------------

# Install and Load Required Package 

install.packages("readxl") 
library(readxl
        
# Create Dataset 
 
set.seed(123) 
data <- data.frame( 
  CustomerID = 1:10, 
  Name = c( 
    "Rahul","Amit","Priya","Neha","Arjun", 
    "Sneha","Rohit","Kiran","Pooja","Vikas" 
  ), 
  Age = sample(20:60, 10), 
  Income = sample( 
    30000:100000, 
    10 
  ), 
  Membership = sample( 
    c("Silver","Gold","Platinum"), 
    10, 
    replace = TRUE 
  ), 
  SpendingScore = sample( 
    1:100, 
    10 
  ) 
) 
# Display Dataset 
data 

#Q1) Customer Object Modeling (S3 System) 

Scenario: A retail company wants to convert customer records into structured objects. 

#1. Create an S3 class "Customer" using dataset rows. 
#2. Assign attributes like Age, Income, Membership. 
#3. Create a custom print.Customer() method. 
#4. Extract and display customer details using object reference. 
#5. Modify one attribute and observe behavior. 

#1.Create an S3 class "Customer" using dataset rows. 
# Create Customer Object 
customer <- list( 
  Name = "Rahul", 
  Age = 30, 
  Income = 55000, 
  Membership = "Gold" 
) 
# Assign S3 Class 
class(customer) <- "Customer" 
customer 

Explanation: 
  • list() creates object structure.  
• class() assigns S3 class named "Customer".  

#2. Assign attributes like Age, Income, Membership. 
# Access Attributes 
customer$Age 
customer$Income 
customer$Membership

Explanation: 
  • $ operator is used to access object attributes.  

#3. Create a custom print.Customer() method. 
# Custom Print Method 
print.Customer <- function(obj) 
{ 
  cat("Customer Details\n") 
  cat("------------------\n") 
  cat("Name      
 :", obj$Name, "\n") 
  cat("Age        
:", obj$Age, "\n") 
  cat("Income     :", obj$Income, "\n") 
  cat("Membership :", obj$Membership, "\n") 
} 
# Print Object 
print(customer) 

Explanation: 
  • print.Customer() overrides default print behavior for Customer class.  
• cat() displays formatted output.  

#4. Extract and display customer details using object reference. 
# Display Individual Details 
customer$Name 
customer$Age 
customer$Income 
customer$Membership 
 
Explanation: 
  • Object reference allows extraction of individual fields.  

#5. Modify one attribute and observe behavior. 
# Modify Membership 
customer$Membership <- "Platinum" 
# Display Updated Object 
print(customer) 

#Explanation: 
• Attribute value gets updated dynamically.  
• Modified object reflects new membership category. 

#Q2) Advanced Customer Class (S4 System) 

Scenario: A banking system requires strict validation of customer records. 

#1. Define an S4 class "Customer" with slots (Age, Income, Membership). 
#2. Create objects from dataset rows. 
#3. Write a show() method. 

#1. Define an S4 class "Customer" with slots (Age, Income, Membership). 
# Define S4 Class 
setClass( 
  "Customer", 
  slots = list( 
    Age = "numeric", 
    Income = "numeric", 
    Membership = "character" 
  ) 
) 

Explanation: 
  • setClass() is used to define an S4 class.  
• slots define object attributes and their data types.  
• S4 system provides strict validation.  

#2. Create objects from dataset rows. 
# Create Customer Object 
customer1 <- new(
  "Customer",
  Age = data$Age[1],
  Income = data$Income[1],
  Membership = data$Membership[1]
) 

Explanation: 
  • new() creates an object of S4 class.  
• Values must match slot data types.  

#3. Write a show() method. 
# Custom Show Method 
setMethod( 
  "show", 
  "Customer", 
  function(object) 
  { 
    cat( 
      "Age :", object@Age, 
      "\nIncome :", object@Income, 
      "\nMembership :", object@Membership 
    ) 
  } 
) 
cust_obj 

Explanation: 
  • setMethod() customizes display behavior.  
• @ operator accesses S4 object slots.  
• Object automatically uses custom show() method when printed. 

#Q3) Object Referencing and Copy Behavior 

Scenario: A data analyst copies dataset for experimentation. 

#1. Assign dataset to new variable. 
#2. Modify one column in copied dataset. 
#3. Check if original dataset changes. 
#4. Use identical() to compare objects. 

#1. Assign dataset to new variable. 

# Copy Dataset 
copy_data <- data
print(copy_data)

Explanation: 
  • copy_data <- data creates a copy reference of dataset.  

#2. Modify one column in copied dataset. 
# Modify Income Column in Copied Dataset 
copy_data$Income <- copy_data$Income + 5000 
# Display Modified Copy 
head(copy_data) 

Explanation: 
  • Adds ₹5000 to Income column in copied dataset.  
• Changes are applied only to data_copy.  

#3. Check if original dataset changes. 
# Display Original Dataset 

data$Income[1] 
copy_data$Income[1] 

Explanation: 
  • Original dataset remains unchanged.  
• R generally uses copy-on-modify behavior.  

#4. Use identical() to compare objects. 
# Compare Original and Modified Dataset 
identical(data, copy_data) 

Explanation: 
  • identical() checks whether two objects are exactly same.  
• Returns:  
  o TRUE → Objects are identical  
o FALSE → Objects are different  
• After modification, result will usually be FALSE. 

#Q4) Memory Optimization Study 

Scenario: Company wants to optimize memory usage. 

#1. Create large object from dataset. 
#2. Check memory usage using object.size(). 
#3. Remove unnecessary objects using rm(). 
#4. Run garbage collection. 

#1. Create large object from dataset. 
# Create Large Object 
large_data <- rbind(data, 
                    data, 
                    data, 
                    data, 
                    data) 
# Display First Records 
head(large_data)
large_object <- rep(data, 1000) 
large_object

Explanation: 
  • rbind() combines multiple copies of dataset.  
• Creates a larger object for memory analysis.  

#2. Check memory usage using object.size(). 
# Check Memory Usage 
object.size(large_data)

Explanation: 
  • object.size() returns memory occupied by object in bytes.  

#3. Remove unnecessary objects using rm(). 
# Remove Object 
rm(large_data) 

Explanation: 
  • rm() removes objects from R environment.  
• Helps free memory space.  

#4. Run garbage collection. 
# Garbage Collection 
gc() 

Explanation: 
  • gc() clears unused memory.  
• Improves memory management and performance in R. 

#Q5) List-Based Customer Object System 

Scenario: System uses lists instead of data frames. 

#1. Convert dataset into list of customers. 
#2. Assign S3 class to each list element. 
#3. Access nested values. 
#4. Modify one customer's data. 
#5. Print structure using str(). 

#1. Convert dataset into list of customers. 
# Convert Dataset into List 
customer_list <- split(data, data$CustomerID)
customer_list

# Display First Customer 
customer_list[[1]] 

Explanation: 
  • split() converts each row into separate list element.  
• Every customer becomes an individual list object.  

#2. Assign S3 class to each list element. 
# Assign S3 Class to Each Customer 
class(customer_list[[1]]) <- "Customer" 

Explanation: 
  • lapply() applies class assignment to all list elements.  
• Each customer now belongs to "Customer" S3 class.  

#3. Access nested values. 
# Access Customer Details 
customer_list[[1]]$Name 
customer_list[[1]]$Age

Explanation: 
  • [[ ]] accesses list element.  
• $ accesses attributes inside customer object.  

#4. Modify one customer's data. 
# Modify Customer Income 
customer_list[[1]]$Income <- 80000 
# Display Updated Customer 
customer_list[[1]] 

Explanation: 
  • Updates Income value for first customer object.  

#5. Print structure using str(). 
# Display Structure 
str(customer_list) 

Explanation: 
  • str() displays internal structure of list object.  
• Shows nested elements, attributes, and data types. 

#Q6) Class Inspection and Documentation 

Scenario: Developer needs to inspect object structure. 

#1. Check class of dataset. 
#2. Use str() to inspect structure. 
#3. Extract attributes. 
#4. Use summary() for overview. 

#1. Check class of dataset. 
# Check Class 
class(data)

Explanation: 
  • class() returns the type or class of object.  
• Data loaded from Excel is generally a data frame / tibble.  

#2. Use str() to inspect structure. 
# Inspect Structure 
str(data) 

Explanation: 
  • str() displays:  
  o Number of rows and columns  
o Variable names  
o Data types  
o Sample values  

#3. Extract attributes. 
# Extract Attributes 
attributes(data) 

Explanation: 
  • attributes() displays metadata of object.  
• Includes:  
  o Column names  
o Row names  
o Class information  

#4. Use summary() for overview. 
# Summary of Dataset 
summary(data) 

Explanation: 
• summary() provides statistical overview:  
  o Minimum  
o Maximum  
o Mean  
o Median  
o Quartiles  
• For categorical data, frequency counts are displayed. 

#Q7) S4 Slot Manipulation 

Scenario: Product system tracks spending behavior. 

#1. Create S4 class "SpendingProfile". 
#2. Add slots for SpendingScore and Income. 
#3. Create object using dataset values. 
#4. Access slots using @. 
#5. Modify slot values and validate. 

#1. Create S4 class "SpendingProfile". 
# Create S4 Class 
setClass( 
  "SpendingProfile", 
  slots = list( 
    SpendingScore = "numeric", 
    Income = "numeric" 
  ) 
) 

Explanation: 
  • setClass() defines an S4 class.  
• Slots define object properties and data types.  

#2. Add slots for SpendingScore and Income. 
# Display Class Definition 
getClass("SpendingProfile")

profile <- new( 
  "SpendingProfile", 
  SpendingScore = 80, 
  Income = 65000 
) 

Explanation: 
  • Slots included:  
  o SpendingScore  
o Income  
• Both slots are numeric type.  

#3. Create object using dataset values. 

# Create Object 
profile1 <- new( 
  "SpendingProfile", 
  SpendingScore = 78, 
  Income = 65000 
) 
profile1 

Explanation: 
  • new() creates object of S4 class.  
• Values must match slot definitions.  

#4. Access slots using @. 
# Access Slot Values 
profile1@SpendingScore 
profile1@Income 

Explanation: 
  • @ operator is used to access S4 slots.  

#5. Modify slot values and validate. 
# Modify Slot Values 
profile1@SpendingScore <- 90 
profile1@Income <- 75000 
# Display Updated Object 
profile1 

Explanation: 
  • Slot values can be updated directly using @.  
• S4 system validates datatype consistency automatically. 

#Q8) Advanced Data Structure Integration 

Scenario: Company integrates multiple data sources. 

#1. Create nested list containing dataset and summary. 
#2. Access inner elements. 
#3. Modify nested structure. 
#4. Apply class to nested object. 
#5. Display structure using str(). 

#1. Create nested list containing dataset and summary. 
# Create Summary 
sales_summary <- summary(data) 
# Create Nested List 
company_data <- list( 
  Dataset = data, 
  Summary = sales_summary 
) 
company_data 

Explanation: 
  • Nested list stores multiple objects together.  
• Contains:  
  o Complete dataset  
o Statistical summary  

#2. Access inner elements. 
# Access Dataset 
company_data$Dataset 
# Access Summary 
company_data$Summary 

Explanation: 
  • $ operator accesses inner elements of list.  

#3. Modify nested structure. 
# Add New Element 
company_data$CompanyName <- "Retail Analytics Pvt Ltd" 
# Display Updated List 
company_data 

Explanation: 
  • New elements can be dynamically added to nested lists.  

#4. Apply class to nested object. 
# Assign S3 Class 
class(nested_obj) <- "CompanyData" 

Explanation: 
  • Assigns custom S3 class "CompanyData" to nested object.  

#5. Display structure using str(). 
# Display Structure 
str(company_data) 

Explanation: 
  • str() displays:  
  o Nested list structure  
o Object hierarchy  
o Variable types  
o Class information 

#Q9) Object-Oriented Data Analysis 

Scenario: Analyst builds reusable object-based analysis system. 

#1. Convert dataset into S3 object. 
#2. Create function to calculate average income. 
#3. Apply function to object. 
#4. Extend object with new attribute. 
#5. Validate object consistency. 

#1. Convert dataset into S3 object. 
# Convert into S3 Object 
customer_object <- data 
class(customer_object) <- "CustomerData" 
# Check Class 
class(customer_object) 
analysis_obj <- data 

Explanation: 
  • Dataset is converted into custom S3 object.  
• "CustomerData" becomes user-defined class.  

#2. Create function to calculate average income. 
# Function to Calculate Average Income
average_income <- function(obj) {
  mean(obj$Income)
}

# Call the function
average_income(data)

Explanation: 
  • Function accepts object as input.  
• Calculates mean income using mean().  

#3. Apply function to object. 
# Apply Function 
average_income(customer_object) 

Explanation: 
  • Function processes S3 object data.  
• Returns average income value.  

#4. Extend object with new attribute. 
# Add New Attribute 
attr(customer_object, "Source") <- "Customer Survey Data" 
# Display Attributes 
attributes(customer_object) 

Explanation: 
  • attr() adds metadata/attributes to object.  
• New attribute "Source" is attached.  

#5. Validate object consistency. 
# Check Object Structure 
str(customer_object) 
# Verify Class 
class(customer_object) 
# Check Missing Values 
sum(is.na(customer_object)) 

Explanation: 
  • str() validates object structure.  
• class() confirms object type.  
• is.na() checks missing values for consistency validation. 

#Q10) Enterprise-Level Object System Design 

Scenario: A company wants scalable object-oriented design. 

#1. Create both S3 and S4 versions of dataset. 
#2. Compare flexibility vs strictness. 
#3. Implement method for summary statistics. 
#4. Document differences between systems. 

#1. Create both S3 and S4 versions of dataset. 
# Create S3 Object 
s3_customer <- customer1

# Create S4 version 
s4_customer <- cust_obj

Explanation: 
  • S4 system uses strict slot definitions.  
• Data types are validated automatically.  

#2. Compare flexibility vs strictness. 
# S3 Flexible Assignment 
s3_customer$new_column <- "Flexible" 
# S4 Strict Validation 
# Example: 
# s4_customer@Age <- "Thirty" 
# This will generate an error 

Feature            S3 System                 S4 System 

Structure          Flexible                  Strict 
Validation         No strict validation      Strong validation 
Complexity         Simple                    Advanced 
Performance        Faster for simple tasks   Better for large systems 
Slot Checking      Not required              Mandatory 

class(s3_customer) 
class(s4_customer) 


#3. Implement method for summary statistics. 

# S3 Summary Method

# Create S3 object
s3_customer <- list(
  Age = data$Age,
  Income = data$Income,
  Membership = data$Membership
)

class(s3_customer) <- "CustomerS3"

# Custom Summary Function for S3
summary.CustomerS3 <- function(object) {
  cat("Customer S3 Summary\n")
  cat("-------------------\n")
  cat("Average Income:", mean(object$Income), "\n")
  cat("Average Age   :", mean(object$Age), "\n")
}

# Apply Summary
summary(s3_customer)

# S4 Summary Method

# Define S4 Class
setClass(
  "CustomerS4",
  slots = list(
    Age = "numeric",
    Income = "numeric",
    Membership = "character"
  )
)

# Create S4 object
s4_customer <- new(
  "CustomerS4",
  Age = data$Age[1],
  Income = data$Income[1],
  Membership = data$Membership[1]
)

# Create Summary Method for S4
setMethod(
  "summary",
  "CustomerS4",
  function(object) {
    cat("Customer S4 Summary\n")
    cat("-------------------\n")
    cat("Age       :", object@Age, "\n")
    cat("Income    :", object@Income, "\n")
    cat("Membership:", object@Membership, "\n")
  }
)

# Apply Summary
summary(s4_customer)

# Apply Summary 
summary(s4_customer) 
summary(data)

Explanation: 
  • S3 methods use naming convention.  
• S4 methods use setMethod().  

#4. Document differences between systems. 

Differences Between S3 and S4 Systems 

Feature             S3                S4 
Definition Style    Informal          Formal 
Syntax              Simple            Complex 
Type Safety         Weak              Strong 
Method Dispatch     Basic             Advanced 
Validation          Manual            Automatic 
Best Use            Small projects    Enterprise applications 

#Conclusion: 
• S3 is suitable for lightweight and flexible applications.  
• S4 is preferred for enterprise-scale systems requiring strict validation and 
scalability.

cat( 
  "\nS3 is flexible and informal.", 
  "\nS4 is strict and supports validation." 
)
