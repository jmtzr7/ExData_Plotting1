plot1 = function(){
  ## Read in data
  data=read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  ## Covert Date field to date/time type
  data$Date=as.Date(data$Date, format="%d/%m/%Y")
  
  ## create subset of data
  SubData=data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
  
  ## Convert data from text to numeric
  SubData$Global_active_power = as.numeric(as.character(SubData$Global_active_power))
  
  ## Create plot
  par(mfrow=c(1,1))
  hist(SubData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
  
  ## Copy graph to png file
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}
