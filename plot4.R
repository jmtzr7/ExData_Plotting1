plot4 = function(){
  ## Read in data
  data=read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  ## Covert Date field to date/time type
  data$Date=as.Date(data$Date, format="%d/%m/%Y")
  
  ## create subset of data
  SubData=data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
  
  ## Combine Date and Time and convert to date/time type
  SubData <- transform(SubData, DateTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  ## Convert data from text to numeric
  SubData$Global_active_power = as.numeric(as.character(SubData$Global_active_power))
  SubData$Global_reactive_power <- as.numeric(as.character(SubData$Global_reactive_power))
  SubData$Voltage <- as.numeric(as.character(SubData$Voltage))
  SubData$Sub_metering_1 <- as.numeric(as.character(SubData$Sub_metering_1))
  SubData$Sub_metering_2 <- as.numeric(as.character(SubData$Sub_metering_2))
  SubData$Sub_metering_3 <- as.numeric(as.character(SubData$Sub_metering_3))
  
  ## Create plot
  par(mfrow=c(2,2))
  plot(SubData$DateTime,SubData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(SubData$DateTime,SubData$Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(SubData$DateTime,SubData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(SubData$DateTime,SubData$Sub_metering_2, col="red")
  lines(SubData$DateTime,SubData$Sub_metering_3, col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1), bty="n", cex=.5)
  plot(SubData$DateTime,SubData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  ## Copy graph to png file
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
}
