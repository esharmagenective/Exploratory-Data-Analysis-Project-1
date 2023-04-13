## Read data
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
str(data)

## Subset data by date range
dat<-subset(data,Date %in% c("1/2/2007","2/2/2007"))
str(dat)

## Graphing Plot 1
png("plot1.png")
dat$Global_active_power<-as.numeric(dat$Global_active_power)
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
