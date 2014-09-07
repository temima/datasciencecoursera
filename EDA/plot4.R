plot4<-function(){
f<-file("household_power_consumption.txt",open="r")
x<-read.table(text = grep("^[1,2]/2/2007|^Date",readLines(f),value=TRUE),na.strings="?",sep=";",header=TRUE)
close(f)

x$Ts<-as.POSIXct(strptime(paste(x$Date, x$Time),format="%d/%m/%Y %H:%M:%S"))

png(filename="plot4.png",width = 480, height = 480, units = "px")
par(mfcol=(c(2,2)))
#1
with(x,plot(Ts,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
#2
with(x,plot(Ts,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
lines(x$Ts,x$Sub_metering_1,col='black')
lines(x$Ts,x$Sub_metering_2,col='red')
lines(x$Ts,x$Sub_metering_3,col='blue')
legend("topright",names(x[7:9]),lty=1,col=c('black','red','blue'),bty="n")

#3
with(x,plot(Ts,Voltage,type="l",ylab="Voltage",xlab="datetime"))

#4
with(x,plot(Ts,Global_reactive_power,type="l",xlab="datetime"))

dev.off()
}