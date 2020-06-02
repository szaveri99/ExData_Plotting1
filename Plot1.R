f<- "C:\\Users\\Sakina Zaveri\\Desktop\\household_power_consumption.txt"
data <- read.table(f,header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?",dec=".")

sub_data<- subset(data,Date %in% c("1/2/2007" ,"2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date,"%d/%m/%Y")

hist(sub_data$Global_active_power,col = "red",xlab = "Global Active Power(Kilowatts)",
     main = "Gobal Active Power")

#PNG FILE CONVERT
dev.copy(png,"plot1.png",width = 480,height = 480,units = "px")
dev.off()

