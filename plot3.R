plot3 <- function() {
  
  #read the file into data
  data <- read.csv("household_power_consumption.txt", na.strings="?",
                 sep=";", header=TRUE,stringsAsFactors=FALSE)

  #subsetting the data to contain only required dates
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

  #set the Date Format
  data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

  png(filename = "plot3.png",width = 480,height = 480)
  
    #plotting using plot and line function
  plot(data$DateTime, data$Sub_metering_1, type="l",ylab = "Energy sub metering", xlab="")

  lines(data$DateTime, data$Sub_metering_2, col="red")

  lines(data$DateTime, data$Sub_metering_3, col="blue")

  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

  #save the file to plot3.png
  dev.off()
}