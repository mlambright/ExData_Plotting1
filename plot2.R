run <- function() {
  housePower <- read.table('household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors=FALSE)
  allowedDates <- c('1/2/2007', '2/2/2007')
  housePower <- housePower[housePower$Date %in% allowedDates,]
  housePower$Date <- strptime(paste(housePower$Date, housePower$Time), '%d/%m/%Y %H:%M:%S')
    
  png('plot2.png')
  plot(housePower$Date, y=as.numeric(housePower$Global_active_power), xlab='', type='n', ylab='Global Active Power (kilowatts)')
  lines(housePower$Date, as.numeric(housePower$Global_active_power))  
  dev.off()
}

