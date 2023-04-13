## Read data
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
str(data)

## Subset data by date range
dat<-subset(data,Date %in% c("1/2/2007","2/2/2007"))
str(dat)

## Graphing Plot 3
png("plot3.png")
dat$Sub_metering_1<-as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2<-as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3<-as.numeric(dat$Sub_metering_3)
plot(dat$DateTime,dat$Sub_metering_1,type = "l", col="black", xlab = " ", ylab = "Energy sub metering")
lines(dat$DateTime,dat$Sub_metering_2,col="red")
lines(dat$DateTime,dat$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()
