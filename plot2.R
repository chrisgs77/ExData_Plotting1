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

#plot 2 date/time by active power
png(filename="plot2.png")
plot(plot_sub$DateTime,plot_sub$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
