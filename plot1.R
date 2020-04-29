
#download data then read
#note that the file is semicolon (;) separated with ? as NA
plot_data<-read.table(file="household_power_consumption.txt",
                      header=TRUE,sep=';',stringsAsFactors = F,na.strings = "?")


#convert to date format
plot_data$Date<-as.Date(plot_data$Date,"%d/%m/%Y")

#subset to 2/1/2007 and 2/2/2007
plot_sub<-subset(plot_data,Date>=as.Date("2/1/2007","%m/%d/%Y")
                 & Date<=as.Date("2/2/2007","%m/%d/%Y"))

# histogram plot 1
png(filename="plot1.png")
hist(plot_sub$Global_active_power,col='red',main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylim=c(0,1200))
dev.off()
