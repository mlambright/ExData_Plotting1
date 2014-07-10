run <- function() {
  housePower <- read.table('household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors=FALSE)
  allowedDates <- c('1/2/2007', '2/2/2007')
  housePower <- housePower[housePower$Date %in% allowedDates,]
  housePower$Date <- strptime(paste(housePower$Date, housePower$Time), '%d/%m/%Y %H:%M:%S')
  
 
  png('plot4.png')
  par(mfrow=c(2, 2))
  plot(housePower$Date, y=as.numeric(housePower$Global_active_power), xlab='', type='n', ylab='Global Active Power (kilowatts)')
  lines(housePower$Date, as.numeric(housePower$Global_active_power))  
  
  plot(housePower$Date, y=as.numeric(housePower$Voltage), type='n', ylab='Voltage', xlab='datetime')
  lines(housePower$Date, as.numeric(housePower$Voltage))  
  
  plot(housePower$Date, y=as.numeric(housePower$Sub_metering_1), xlab='', ylab='Energy sub metering', type='n')
  lines(housePower$Date, as.numeric(housePower$Sub_metering_1))
  lines(housePower$Date, as.numeric(housePower$Sub_metering_2), col='red')
  lines(housePower$Date, as.numeric(housePower$Sub_metering_3), col='blue')
  legend('topright', paste('Sub_metering',1:3,sep='_'), lwd=rep(1,3), col=c('black','red','blue'), bty='n')
  
  plot(housePower$Date, y=as.numeric(housePower$Global_reactive_power), type='n', xlab='datetime', ylab='Global_reactive_power')
  lines(housePower$Date, as.numeric(housePower$Global_reactive_power))  
  dev.off()
}