rm(list=ls())
setwd("C:/Users/bpu313718/Desktop/coursera/exdata_data_household_power_consumption")
Sys.setlocale("LC_MESSAGES", "en_US.utf8")

df <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
df_2 <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_2$DateTime <- paste(df_2$Date,df_2$Time,sep=" ")
df_2$DateTime <- as.POSIXct(df_2$DateTime, format="%d/%m/%Y %H:%M:%S")


# Graph 2
png("plot2.png")
plot(df_2$DateTime,as.numeric(as.character(df_2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()