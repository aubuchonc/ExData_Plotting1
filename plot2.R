
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
png(file = "plot2.png", width = 480, height = 480,bg= NA)

#Create Plot
plot(power_cons$Time,power_cons$Global_active_power, type = "l",  xlab= "",ylab= "Global Active Power (kilowatts)")

#Close Graphic Device
dev.off()

