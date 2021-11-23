rm(list=ls())
setwd("C:/Users/bpu313718/Desktop/coursera/exdata_data_household_power_consumption")
Sys.setlocale("LC_MESSAGES", "en_US.utf8")

df <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
df_2 <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_2$DateTime <- paste(df_2$Date,df_2$Time,sep=" ")
df_2$DateTime <- as.POSIXct(df_2$DateTime, format="%d/%m/%Y %H:%M:%S")


# Graph 4
png("plot4.png")
par(mfrow=c(2,2))
with(df_2,{
        plot(df_2$DateTime,as.numeric(as.character(df_2$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(df_2$DateTime,as.numeric(as.character(df_2$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(df_2$DateTime,df_2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(df_2,lines(DateTime,as.numeric(as.character(Sub_metering_1))))
        with(df_2,lines(DateTime,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(df_2,lines(DateTime,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(df_2$DateTime,as.numeric(as.character(df_2$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()