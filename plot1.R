power <- read.table('household_power_consumption.txt', sep=';', header=T , colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings='?')

power$Date <-as.Date(power$Date,format='%d/%m/%Y')
febPower = subset(power, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
png('plot1.png', width= 480, height=480, units="px")

# axis(2, at=seq(0, 1200, 200),labels=seq(0, 1200, 200) )
hist(febPower$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

