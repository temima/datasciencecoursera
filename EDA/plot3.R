plot3<-function(){
f<-file("household_power_consumption.txt",open="r")
x<-read.table(text = grep("^[1,2]/2/2007|^Date",readLines(f),value=TRUE),na.strings="?",sep=";",header=TRUE)
close(f)

x$Ts<-as.POSIXct(strptime(paste(x$Date, x$Time),format="%d/%m/%Y %H:%M:%S"))

#3
png(filename="plot3.png",width = 480, height = 480, units = "px")
with(x,plot(Ts,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
lines(x$Ts,x$Sub_metering_1,col='black')
lines(x$Ts,x$Sub_metering_2,col='red')
lines(x$Ts,x$Sub_metering_3,col='blue')
legend("topright",names(x[7:9]),lty=1,col=c('black','red','blue'))
dev.off()
}