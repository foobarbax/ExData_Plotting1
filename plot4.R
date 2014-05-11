power <- read.table('household_power_consumption.txt', sep=';', header=T , colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings='?')
power$Date <-as.Date(power$Date,format='%d/%m/%Y')
febPower = subset(power, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
febPower$DateTime <- strptime(paste(febPower$Date, febPower$Time), format="%Y-%m-%d %H:%M:%S")
png('plot4.png', width= 480, height=480, units="px")

par(mfrow=c(2,2))
#plot 1

plot(febPower$DateTime, febPower$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")

#plot 2
plot(febPower$DateTime, febPower$Voltage, type='l', xlab='datetime', 'ylab'='Voltage')

#plot 3
plot(febPower$DateTime, febPower$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(febPower$DateTime, febPower$Sub_metering_2, col='red')
lines(febPower$DateTime, febPower$Sub_metering_3, col='blue')

legend('topright', legend=c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'), lwd=1, col=c('black', 'red', 'blue'))

#plot 4

plot(febPower$DateTime, febPower$Global_reactive_power, type='l',xlab='datetime', 'ylab'='Global_reactive_power')
dev.off();