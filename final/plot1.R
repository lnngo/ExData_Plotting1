household_power_consumption <- read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";")
hhpc_select_days <- subset(household_power_consumption, household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007")
hhpc_select_days$Global_active_power <- gsub("?",NA,hhpc_select_days$Global_active_power, fixed = TRUE)
png(filename = "plot1.png",width = 480, height = 480)
with(hhpc_select_days, hist(sapply(Global_active_power, as.numeric), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)"))
dev.off()