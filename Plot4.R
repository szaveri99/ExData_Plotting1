f<- "C:\\Users\\Sakina Zaveri\\Desktop\\household_power_consumption.txt"
data <- read.table(f,header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?",dec=".")

sub_data<- subset(data,Date %in% c("1/2/2007" ,"2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date,"%d/%m/%Y")

date_time <- with(sub_data,as.POSIXct(paste(Date,Time)))

#SCREEN ADJUSTMENT
par(mar = c(4,4,2,1),mfrow = c(2,2))

#PLOT 1
with(sub_data,plot(date_time,Global_active_power,type = "l",
                   ylab = "Global Active Power",xlab = " "))

#PLOT 2
with(sub_data,plot(date_time,Voltage,type = "l",
                   ylab = "Volatage",xlab = "datetime"))

#PLOT 3
with(sub_data,plot(date_time,Global_reactive_power,type = "l",
                   ylab = "Global_reactive_power",xlab = "datetime"))

#PLOT 4
with(sub_data,plot(Sub_metering_1 ~ date_time,type="l",
                   xlab = " ",ylab = "Energy sub metering"))
with(sub_data,lines(Sub_metering_2 ~ date_time , col = "red"))
with(sub_data,lines(Sub_metering_3 ~ date_time , col = "blue"))


legend("topright",lty = 1,bty="n",col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#PNG FILE CONVERT
dev.copy(png,"plot4.png",width = 480,height = 480,units = "px")
dev.off()

