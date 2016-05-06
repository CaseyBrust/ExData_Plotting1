#download data
if(!file.exists("projectdata.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","projectdata.zip")
} 
if(!file.exists("household_power_consumption.txt")) {
  unzip("projectdata.zip","household_power_consumption.txt")
}

#read data into R
data <- read.table("household_power_consumption.txt",na.strings="\\?",header=FALSE,nrows=2879,skip=66637,sep=";")
varnames <- read.table("household_power_consumption.txt",nrows=1,sep=";",header=TRUE)

#assign column names
colnames(data) <- colnames(varnames)

#convert date & time variables to date format
data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y%H:%M:%S")

#Plot 2
png("plot2.png",width=480,height=480,units="px")
plot(data$DateTime,data$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(data$DateTime,data$Global_active_power,type="l")
dev.off()
