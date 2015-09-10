#read in data
power <- read.table('household_power_consumption.txt', header=TRUE,sep=';', na.strings='?',
                       colClasses=c('character', 'character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


#convert Date and Time variables and put them togther
power$Date<-strptime(power$Date,"%d/%m/%Y")
power$Time <- paste(power$Date, power$Time, sep=" ")
power$DateTime <- strptime(power$Time, "%Y-%m-%d %H:%M:%S")

#pull out two days I need
power<-power[power$Date=="2007-02-01"|power$Date=="2007-02-02",]

#plot 4
png(filename='plot4.png')
par(mfrow=c(2,2))
plot(power$DateTime,power$Global_active_power,xlab=" ",
     ylab="Global Active Power",type="l")

plot(power$DateTime,power$Voltage,xlab="datetime",
     ylab="Voltage",type="l")

plot(power$DateTime,power$Sub_metering_1,type="l",xlab=' ', ylab="Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, col='red')
lines(power$DateTime, power$Sub_metering_3, col='blue')
legend('topright',legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'),lty='solid', bty='n')

plot(power$DateTime, power$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')
dev.off()

