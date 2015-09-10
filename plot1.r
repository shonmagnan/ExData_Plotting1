#read in data
power <- read.table('household_power_consumption.txt', header=TRUE,sep=';', na.strings='?',
                       colClasses=c('character', 'character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


#convert Date and Time variables and put them togther
power$Date<-strptime(power$Date,"%d/%m/%Y")
power$Time <- paste(power$Date, power$Time, sep=" ")
power$DateTime <- strptime(power$Time, "%Y-%m-%d %H:%M:%S")

#pull out two days I need
power<-power[power$Date=="2007-02-01"|power$Date=="2007-02-02",]

#plot 1
png(filename='plot1.png')
hist(power$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()