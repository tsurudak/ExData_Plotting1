# set working directory for assignment
setwd("/Users/KT/Documents/Coursera/4ExploratoryDataAx/assignment1")

# # download and unzip files from the internet
# # make variable to show where data is
# url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# 
# # download data
# download.file(url, "zippedData.zip", method="curl")
# 
# #unzip downloaded data
# unzip("zippedData.zip")
# 
# #list files in working directory
# list.files()

# ASSIGNMENT DATA --------
dat <- read.table("household_power_consumption.txt", sep = ";", 
                  header = T, na.strings = "?")

# quick look at data
str(dat)

# convert Date variable into date format
dat$Date <- as.Date(dat[,"Date"], format = "%d/%m/%Y")


# take only data between 2007-02-01 and 2007-02-02 (inclusive)
dat1 <- subset(dat, Date >= as.Date("01/02/2007",  format = "%d/%m/%Y") &
                 Date <= as.Date("02/02/2007",  format = "%d/%m/%Y"))

# make date/time variable
dat1$datetime <- as.POSIXct(paste(dat1$Date, dat1$Time), format="%Y-%m-%d %H:%M:%S")

#write plot to png
png('plot2.png', width = 480, height = 480,)

# make plot
with(dat1, plot(y = Global_active_power,x = datetime, type = "l",
                ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.off()

