household_power_consumption <- read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";")
hhpc_select_days <- subset(household_power_consumption, household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007")
hhpc_select_days$Global_active_power <- gsub("?",NA,hhpc_select_days$Global_active_power, fixed = TRUE)
hhpc_select_days$Sub_metering_1 <- gsub("?",NA,hhpc_select_days$Sub_metering_1, fixed = TRUE)
hhpc_select_days$Sub_metering_2 <- gsub("?",NA,hhpc_select_days$Sub_metering_2, fixed = TRUE)
hhpc_select_days$Sub_metering_3 <- gsub("?",NA,hhpc_select_days$Sub_metering_3, fixed = TRUE)
png(filename <- "plot4.png",width = 480, height = 480)
par(mfrow=c(2, 2))
GAP_by_timeofday <- with(hhpc_select_days,
                         as.POSIXct(paste(as.Date(Date, "%d/%m/%Y"),Time), 
                                    format="%Y-%m-%d %H:%M:%S"))
plot(GAP_by_timeofday,
     sapply(hhpc_select_days$Global_active_power, as.numeric),
     type="l", 
     xlab="",
     ylab="Global Active Power")

plot(GAP_by_timeofday,
     sapply(hhpc_select_days$Voltage, as.numeric),
     type="l", 
     xlab="datetime",
     ylab="Voltage")

plot(GAP_by_timeofday,
     sapply(hhpc_select_days$Sub_metering_1, as.numeric),
    type="l", 
    xlab="",
    ylab="Energy Sub Metering")
lines(GAP_by_timeofday, 
      sapply(hhpc_select_days$Sub_metering_2, as.numeric), 
      col = "red")
lines(GAP_by_timeofday, 
      sapply(hhpc_select_days$Sub_metering_3, as.numeric), 
      col = "blue")
legend("topright", 
       lwd=1, bty = "n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(GAP_by_timeofday,
     sapply(hhpc_select_days$Global_reactive_power, as.numeric),
     type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()