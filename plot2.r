plot2<-function()
{
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)[c(1:3)]
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
time<-as.vector(data$Time)
date<-as.vector(data$Date)
data$mytime<-strptime(paste(date,time),"%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(data$mytime,as.numeric(as.vector(data$Global_active_power)),type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
}