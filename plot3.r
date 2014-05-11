plot3<-function()
{
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)[c(1,2,7,8,9)]
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
time<-as.vector(data$Time)
date<-as.vector(data$Date)
data$mytime<-strptime(paste(date,time),"%d/%m/%Y %H:%M:%S")
png("plot3.png")
with(data,{
  plot(mytime,as.numeric(as.vector(Sub_metering_1)),type="l",xlab="",ylab="Energy Sub Metering")
  points(mytime,as.numeric(as.vector(Sub_metering_2)),type="l",col="red")
  points(mytime,as.numeric(as.vector(Sub_metering_3)),type="l",col="blue")
  legend("topright", lty=1,col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
})
dev.off()
}
