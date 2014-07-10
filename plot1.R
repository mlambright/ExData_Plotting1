run <- function() {
  housePower <- read.table('household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors=FALSE)
  housePower$Date <- strptime(housePower$Date, '%d/%m/%Y')
  allowedDates <- strptime(c('1/2/2007', '2/2/2007'),'%d/%m/%Y')
  housePower <- housePower[housePower$Date %in% allowedDates,]
  
  png('plot1.png', bg='transparent')
  hist(as.numeric(housePower$Global_active_power), col='red', 
       xlab='Global Active Power (kilowatts)', ylab='Frequency', 
       main='Global Active Power', breaks=seq(0,8,0.5), 
       axes=F)
  axis(1, at=seq(0,6,2))
  axis(2, at=seq(0,1200,200))
  
  dev.off()
}