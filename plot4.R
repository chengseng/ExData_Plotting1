plot4 <- function() {

  #read the file into data
  data <- read.csv("household_power_consumption.txt", na.strings="?",
                 sep=";", header=TRUE,stringsAsFactors=FALSE)
  
  #subsetting the data to contain only required dates
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

  #set the Date Format
  data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

  png(filename = "plot4.png",width = 480,height = 480)
  
  #layout a 2x2 grid
  par(mfrow = c(2, 2))

  # Plot 1 - Global active power against Day in upper left
  plot(data$DateTime,data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

  # Plot 2 - Voltage against Day in upper right
  plot(data$DateTime,data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

  # Plot 3 - Sub metering in lower left
  plot(data$DateTime, data$Sub_metering_1, type="l",ylab = "Energy sub metering", xlab="")
  lines(data$DateTime, data$Sub_metering_2, col="red")
  lines(data$DateTime, data$Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = "n", cex = 0.7)
 
  # Plot 4 - global Reactive power against Day in lower right
  plot(data$DateTime,data$Global_reactive_power, type="l",
       xlab="datetime", ylab="Global_reactive_power")

  #save the file to plot4.png
  dev.off()
}