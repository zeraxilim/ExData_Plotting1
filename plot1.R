household_power=read.csv("household_power_consumption.txt",sep=";")
household_power$Date = as.Date(household_power$Date,"%d/%m/%Y")

png(filename = "plot1.png",width = 480, height = 480)

hp = household_power[household_power$Date==as.Date("2007-02-01") |household_power$Date==as.Date("2007-02-02") ,]

hp$Time = strptime(paste(format(hp$Date, "%Y-%m-%d"), hp$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
hp$Global_active_power = as.numeric(as.character(hp$Global_active_power))

hist(hp$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",xlim=c(0,6),col="red")

dev.off()