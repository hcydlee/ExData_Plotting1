hp<-read.table('household_power_consumption.txt',header=TRUE,
sep=';',na.string='?',stringsAsFactors=FALSE,skip=66636,nrow=2880,
col.names=c("Date","Time","Global_active_power","Global_reactive_power",
            "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
hp$datetime<-strptime(paste(hp$Date,hp$Time),format="%d/%m/%Y %H:%M:%S")

png(filename='plot2.png',width=480,height=480,units='px')

plot(hp$datetime,hp$Global_active_power,type='n',xlab='',
     ylab='Global Active Power (kilowatts)')
lines(hp$datetime,hp$Global_active_power)

dev.off()