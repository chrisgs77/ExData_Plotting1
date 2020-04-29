#required libraries
library(lubridate)

#download data then read
#note that the file is semicolon (;) separated with ? as NA
plot_data<-read.table(file="household_power_consumption.txt",
                      header=TRUE,sep=';',stringsAsFactors = F,na.strings = "?")


#convert to date format
plot_data$Date<-as.Date(plot_data$Date,"%d/%m/%Y")

#subset to 2/1/2007 and 2/2/2007
plot_sub<-subset(plot_data,Date>=as.Date("2/1/2007","%m/%d/%Y")
                 & Date<=as.Date("2/2/2007","%m/%d/%Y"))
plot_sub$DateTime<-ymd_hms(paste(plot_sub$Date,plot_sub$Time))

#plot 4: 4 panel figure
png(filename="plot4.png")
par(mfrow=c(2,2))
# date/time and global active power
plot(plot_sub$DateTime,plot_sub$Global_active_power,type="l",
     xlab="",ylab="Global Active Power")
#date/time and voltage
plot(plot_sub$DateTime,plot_sub$Voltage,type="l",
     xlab="datetime",ylab="Voltage")
#date/time and sub metering
plot(plot_sub$DateTime,plot_sub$Sub_metering_1,type="l",
     xlab="",ylab='Entery Sub Metering')
lines(plot_sub$DateTime,plot_sub$Sub_metering_2,col='red')
lines(plot_sub$DateTime,plot_sub$Sub_metering_3,col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
      "Sub_metering_3"),lty=c(1,1,1),col=c('black','red','blue'),
      bty="n")
#date/time by global reactive power
with(plot_sub,plot(DateTime,Global_reactive_power,type="l",
     xlab="datetime"))
dev.off()



