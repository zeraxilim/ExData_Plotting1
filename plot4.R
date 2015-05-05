household_power=read.csv("household_power_consumption.txt",sep=";")
household_power$Date = as.Date(household_power$Date,"%d/%m/%Y")

png(filename = "plot4.png",width = 480, height = 480)

hp = household_power[household_power$Date==as.Date("2007-02-01") |household_power$Date==as.Date("2007-02-02") ,]

hp$Time = strptime(paste(format(hp$Date, "%Y-%m-%d"), hp$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
hp$Global_active_power = as.numeric(as.character(hp$Global_active_power))
hp$Global_reactive_power = as.numeric(as.character(hp$Global_reactive_power))
hp$Voltage = as.numeric(as.character(hp$Voltage))
hp$Sub_metering_1 = as.numeric(as.character(hp$Sub_metering_1))
hp$Sub_metering_2 = as.numeric(as.character(hp$Sub_metering_2))
hp$Sub_metering_3 = as.numeric(as.character(hp$Sub_metering_3))

par(mfrow=c(2,2))

plot(hp$Time,hp$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="",col="black")
plot(hp$Time,hp$Voltage,type="l",xlab="datetime",ylab="Voltage",main="",col="black")


plot(hp$Time,hp$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",main="")
lines(hp$Time,hp$Sub_metering_2,col="red")
lines(hp$Time,hp$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)


plot(hp$Time,hp$Global_active_power,type="l",xlab="datetime",main="",col="black")

dev.off()