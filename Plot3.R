f<- "C:\\Users\\Sakina Zaveri\\Desktop\\household_power_consumption.txt"
data <- read.table(f,header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?",dec=".")

sub_data<- subset(data,Date %in% c("1/2/2007" ,"2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date,"%d/%m/%Y")
date_time <- with(sub_data,as.POSIXct(paste(Date,Time)))

with(sub_data,plot(Sub_metering_1 ~ date_time,type="l",
                   xlab = " ",ylab = "Energy sub metering"))
with(sub_data,lines(Sub_metering_2 ~ date_time , col = "red"))
with(sub_data,lines(Sub_metering_3 ~ date_time , col = "blue"))

legend("topright",lty = 1,col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#PNG FILE CONVERT
dev.copy(png,"plot3.png",width = 480,height = 480,units = "px")
dev.off()

