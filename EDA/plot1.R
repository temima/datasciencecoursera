plot1<-function(){
f<-file("household_power_consumption.txt",open="r")
x<-read.table(text = grep("^[1,2]/2/2007|^Date",readLines(f),value=TRUE),na.strings="?",sep=";",header=TRUE)
close(f)

x$Ts<-as.POSIXct(strptime(paste(x$Date, x$Time),format="%d/%m/%Y %H:%M:%S"))

#1
png(filename="plot1.png",width = 480, height = 480, units = "px")
hist(x$Global_active_power,col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
}