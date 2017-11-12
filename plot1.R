#Create a directory and download the dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Read the dataset from the dates 2007-02-01 and 2007-02-02
power_cons <- read.csv("household_power_consumption.txt", skip = 66636, nrows = 2880, sep = ";", na.strings = "?", stringsAsFactors = FALSE, check.names = F)

#Assing column names to dataset
colnames <- c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(power_cons) <- colnames


library(lubridate)
#convert the Date and Time variables to Date/Time classes
power_cons$Time <- dmy_hms(paste(power_cons$Date,power_cons$Time))
power_cons$Date <- dmy(power_cons$Date)

#Open Graphic Device
png(file = "./plot1.png", width = 480, height = 480,bg= NA)

#Create Plot
hist(power_cons$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red", ylim = c(0,1200))

#Close Graphic Device
dev.off()

