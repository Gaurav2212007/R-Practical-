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
df$marks <- as.numeric(df$marks)
df$marks


#convert marks column to numeric and handle missing values
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

purchase_data <- data.frame(
  Gender = c("Male", "Female", "Male", "Female", "Male", "Female"),
  Purchase = c("Yes", "No", "Yes", "Yes", "No", "Yes"),
  Amount = c(5000, 7000, 8000, 6000, 4000, 9000)
)

mean(purchase_data$Amount)
median(purchase_data$Amount)

table(purchase_data$Gender)

table(purchase_data$Gender, purchase_data$Purchase)

total_amount <- sum(data$amount)
print(total_amount)

sum(purchase_data$Purchase == "Yes")