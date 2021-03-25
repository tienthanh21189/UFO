# Q1:
# Read the UFO dataset into a new data frame called ufo_data
# Replace each empty space with NA
ufo_data <- read.csv("ufo.csv", na="")

# -------------------------------------------
# Q2:
# Show the structure of the UFO data frame
str(ufo_data)

# Show the first 15 rows of data within the data frame
ufo_data[1:15,]

# Count the number of rows within the UFO data frame
# to confirm there are 89071 rows in it
num_rows <- nrow(ufo_data)
if (num_rows == 89071) {
  print("Exactly! There are 89071 rows in ufo_data.")
} else {
  print("Something went wrong. It must be 89071 rows in ufo_data. Recheck your .csv file")
}

# -------------------------------------------
# Q3:
# Convert the datetime variable to a date variable
converted_date <- as.Date(ufo_data$datetime, "%m/%d/%Y %H:%M")

# -------------------------------------------
# Q4:
# Update the UFO data frame with the new date structure
ufo_data$datetime <- converted_date

# Display the new structure of the UFO data frame
str(ufo_data)

# -------------------------------------------
# Q5
# Display the names of the UFO data frame
names(ufo_data)

# Modify the variable names:
#   duration..seconds. -> DurationSeconds
#   duration..hours.min. -> DurationHrsMins
#   date.posted -> DatePosted
names(ufo_data)[6] <- "DurationSeconds"
names(ufo_data)[7] <- "DurationHrsMins"
names(ufo_data)[9] <- "DatePosted"

# Check the result (show the new structure of the data frame)
names(ufo_data)

# -------------------------------------------
# Q6
# Recode the "latitude" variable so that it is a numerical variable
ufo_data$latitude <- as.numeric(ufo_data$latitude)

# Show the new structure of the data frame
str(ufo_data)

# -------------------------------------------
# Q7
# Display the number of missing variables in the UFO data frame.

# Install packages
install.packages('mice')
library(mice)
install.packages('VIM')
library(VIM)

# Plot the missing value
missing_values <- aggr(ufo_data, prop=FALSE, numbers=TRUE)

# Show summary of the content of missing_value
summary(missing_values) 

# The number of records have no missing data content is 69528
# The number of records have all missing data content is 196

# The number of variables have all data variables missing is 0

# -------------------------------------------
# Q8
# Sort the UFO data frame firstly by shape and then by city
attach(ufo_data)
sorted_ufo_data <- ufo_data[order(shape, city),]

# Extract only the columns datetime, city, country and shape
# Store the content into a data frame called sorted_ufo_data
include_list <- names(sorted_ufo_data) %in% c("datetime", "city", "country", "shape")
sorted_ufo_data <- sorted_ufo_data[(include_list)]

# Display the first 15 rows of data in this new data frame
sorted_ufo_data[1:15,]

# -------------------------------------------
# Q9
# Using the subset() function,
# find all entries in the UFO data frame
# where the country equals “gb” and the shape variable equals “disk”
# Store the contents in a data frame called ufo_gb_disk
ufo_gb_disk <- subset(ufo_data, country == "gb" & shape == "disk")

# -------------------------------------------
# Q10
# Using the write.csv() command,
# save your newly modified UFO data frame as modified_ufo.csv
write.csv(ufo_data, "modified_ufo.csv")

# save your ufo_gb_disk data frame as ufo_gb.csv
write.csv(ufo_gb_disk, "ufo_gb.csv")

# save sorted_ufo_data as sorted_ufo.csv
write.csv(sorted_ufo_data, "sorted_ufo.csv")