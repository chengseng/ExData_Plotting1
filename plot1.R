plot1 <- function() {

  #read the file into data
  data <- read.csv("household_power_consumption.txt", na.strings="?",
                   sep=";", header=TRUE,stringsAsFactors=FALSE)

  #subsetting the data to contain only required dates
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

  #set the Date Format
  data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

  png(filename = "plot1.png",width = 480,height = 480)
  
  #plot using hist function
  hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

  #save the file to plot1.png
  dev.off()
}