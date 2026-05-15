#Q1.

df <- data.frame(
  name = c("Raj","Amit","Neha","Raj","Amit"),
  marks = c("80","90",NA,"85","90"),
  city = c("Pune","pune","Mumbai","PUNE","Mumbai")
)

#Remove extra spaces from the name column
df$name <- trimws(df$name)
df$name

#convert all names to lowercase
df$name <- tolower(df$name)
df$name

#convert marks column to numeric and handle missing values
df$marks <- as.numeric(df$marks)
df$marks

df$marks[is.na(df$marks)] <- mean(df$marks, na.rm = TRUE)
df$marks

#standardize city names (all lowercase)
df$city <- tolower(df$city)
df$city

#filter students with marks greater than 80
filtered_df <- df[df$marks > 80, ]
filtered_df

#Create a new column grade: Marks > 85 -> "A"
#                           Marks < 85 -> "B"
filtered_df$grade <- ifelse(filtered_df$marks > 85, "A", "B")
filtered_df$grade

# Display result
filtered_df        

#Q3. 

# 1 and 2: Creating the Dataset
Purchase_data <- data.frame(
  Gender = c("Male", "Female", "Male", "Female", "Male", "Female"),
  Purchase = c("Yes", "No", "Yes", "Yes", "No", "Yes"),
  Amount = c(5000, 7000, 8000, 6000, 4000, 9000)
)

# 3. Calculate Mean and Median of Amount
mean_amount <- mean(Purchase_data$Amount)
print(mean_amount)

median_amount <- median(Purchase_data$Amount)
print(median_amount)

# 4. Frequency Table for Gender
table(Purchase_data$Gender)

# 5. Cross Tabulation of Gender and Purchase
table(Purchase_data$Gender, Purchase_data$Purchase)

# 6. Find Total Purchase Amount
total_amount <- sum(Purchase_data$Amount)
print(total_amount)

# 7. Count Number of Yes Purchases
yes_count <- sum(Purchase_data$Purchase == "Yes")
print(yes_count)
