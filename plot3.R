hp<-read.table('household_power_consumption.txt',header=TRUE,
sep=';',na.string='?',stringsAsFactors=FALSE,skip=66636,nrow=2880,
col.names=c("Date","Time","Global_active_power","Global_reactive_power",
            "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
hp$datetime<-strptime(paste(hp$Date,hp$Time),format="%d/%m/%Y %H:%M:%S")

png(filename='plot3.png',width=480,height=480,units='px')

plot(hp$datetime,hp$Sub_metering_1,type='n',xlab='',
     ylab='Energy sub metering')
lines(hp$datetime,hp$Sub_metering_1,col='black')
lines(hp$datetime,hp$Sub_metering_2,col='red')
lines(hp$datetime,hp$Sub_metering_3,col='blue')
legend("topright",lty=1,col=c('black','red','blue'),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()