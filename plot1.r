plot1<-function()
{
  data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)[c(1,3)]
  data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  data<-na.omit(data)
  data$Global_active_power<-as.numeric(as.vector(data$Global_active_power))
  png("plot1.png")
  hist(data$Global_active_power,breaks=12,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
  dev.off()
}