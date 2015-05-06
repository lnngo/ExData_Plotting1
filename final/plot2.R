household_power_consumption <- read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";")
hhpc_select_days <- subset(household_power_consumption, household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007")
hhpc_select_days$Global_active_power <- gsub("?",NA,hhpc_select_days$Global_active_power, fixed = TRUE)
png(filename <- "plot2.png",width = 480, height = 480)
GAP_by_timeofday <- with(hhpc_select_days,
                         as.POSIXct(paste(as.Date(Date, "%d/%m/%Y"),Time), 
                                     format="%Y-%m-%d %H:%M:%S"))
plot(GAP_by_timeofday,
    sapply(hhpc_select_days$Global_active_power, as.numeric),
    type="l", 
    xlab="",
    ylab="Global Active Power (kilowatts)")
dev.off()