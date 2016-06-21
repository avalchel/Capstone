# Load file and convert char to strings
OR_Nonprofit_raw <- read.csv("OR_Nonprofit.csv", stringsAsFactors=FALSE)
str(OR_Nonprofit_raw)

#0. Create cleaned table, filtered by "Registered Agent" to delete duplicated entries
OR_Nonprofit <- filter(OR_Nonprofit_raw, Associated.Name.Type == "REGISTERED AGENT")
str(OR_Nonprofit)
# 33589 

#1. How many unique organizations are there from Business.Name
Unique <- OR_Nonprofit %>%
  select(Business.Name) %>%
  unique()
str(Unique_Organizations)
# 31325 

''' Do not know how to account for the difference in OR_Nonprofit and Unique values '''


#2. Examine different Nonprofit.Types 
table(OR_Nonprofit$Nonprofit.Type)


#3. Table of unique orgs per city
table(OR_Nonprofit$City)


#4. Table of unique orgs per zipcode 
table(OR_Nonprofit$Zip.Code)


#5. Table of unique orgs per YEAR. Essential to first convert Registry.Date from chr -> POSIXct type

# Essential to first convert Registry.Date from chr -> POSIXct type for separation
library(lubridate)
OR_Nonprofit$Registry.Date <- ymd_hms(OR_Nonprofit$Registry.Date)
str(OR_Nonprofit)

# Apply separate() to Registry.Date to create a col for "Year" 
OR_Nonprofit_DateClean <- separate(OR_Nonprofit, Registry.Date, c("Year", "Month", "Day"), sep = "-")

# Create table showing non-profit distribution per year
table(OR_Nonprofit_DateClean$Year)






