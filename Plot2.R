f<- "C:\\Users\\Sakina Zaveri\\Desktop\\household_power_consumption.txt"
data <- read.table(f,header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?",dec=".")

sub_data<- subset(data,Date %in% c("1/2/2007" ,"2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date,"%d/%m/%Y")

date_time <- with(sub_data,as.POSIXct(paste(Date,Time)))

with(sub_data,plot(date_time,Global_active_power,type = "l",
                   ylab = "Global Active Power(Kilowatts)",xlab = " "))

#PNG FILE CONVERT
dev.copy(png,"plot2.png",width = 480,height = 480,units = "px")
dev.off()

