rm(list=ls())
setwd("C:/Users/bpu313718/Desktop/coursera/exdata_data_household_power_consumption")
Sys.setlocale("LC_MESSAGES", "en_US.utf8")

df <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
df_2 <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_2$DateTime <- paste(df_2$Date,df_2$Time,sep=" ")
df_2$DateTime <- as.POSIXct(df_2$DateTime, format="%d/%m/%Y %H:%M:%S")


# Graph 3
png("plot3.png")
plot(df_2$DateTime,df_2$Sub_metering_1,type = "n",ylab="Energy sub metering")
with(df_2,lines(DateTime,as.numeric(as.character(df_2$Sub_metering_1))))
with(df_2,lines(DateTime,as.numeric(as.character(df_2$Sub_metering_2)),col="red"))
with(df_2,lines(DateTime,as.numeric(as.character(df_2$Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()