#Load data set and convert time
household_power=read.csv("household_power_consumption.txt",sep=";")
household_power$Date = as.Date(household_power$Date,"%d/%m/%Y")

#Create png file
png(filename = "plot3.png",width = 480, height = 480)

#Subset data
hp = household_power[household_power$Date==as.Date("2007-02-01") |household_power$Date==as.Date("2007-02-02") ,]

#Convert time variable and force the column values to be used from "factor" to "numeric"
hp$Time = strptime(paste(format(hp$Date, "%Y-%m-%d"), hp$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
hp$Sub_metering_1 = as.numeric(as.character(hp$Sub_metering_1))
hp$Sub_metering_2 = as.numeric(as.character(hp$Sub_metering_2))
hp$Sub_metering_3 = as.numeric(as.character(hp$Sub_metering_3))

#Creat plot and draw first line
plot(hp$Time,hp$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",main="")

#Add the next two lines
lines(hp$Time,hp$Sub_metering_2,col="red")
lines(hp$Time,hp$Sub_metering_3,col="blue")

#Add a legend with line colors
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#Close png file
dev.off()