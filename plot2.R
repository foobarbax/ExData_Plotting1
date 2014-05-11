power <- read.table('household_power_consumption.txt', sep=';', header=T , colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings='?')
power$Date <-as.Date(power$Date,format='%d/%m/%Y')
febPower = subset(power, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
febPower$DateTime <- strptime(paste(febPower$Date, febPower$Time), format="%Y-%m-%d %H:%M:%S")
png('plot2.png', width= 480, height=480, units="px")

plot(febPower$DateTime, febPower$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off();