#### Exploratory Data Analysis Assignment Week 1#####
        #Setting working directory
        setwd("./assignment")
        getwd()
        rm(list=ls())

##### Reading the data
        tmp<-read.table("household_power_consumption.txt",header=TRUE,sep = ";",nrows = 100)
        
        ## Reading specific dates from 2007-02-01 and 2007-02-02 i.e. 66638 through 69517 rows
        powdata<-read.table('household_power_consumption.txt', skip=66637, nrows=2880, sep=';')
        names(powdata)<-names(tmp)
        i <- sapply(powdata, is.factor)  #get all the factors
        powdata[i] <- lapply(powdata[i], as.character)  #convert all the factors to char
                str(powdata)                
                rm(i,tmp)
        
####Adding date and time in new column
        powdata$datetime<-paste(powdata$Date,powdata$Time)
                str(powdata)
        
        #Convert character to date
        powdata$datetime <-strptime(powdata$datetime,"%d/%m/%Y %H:%M:%S")
                str(powdata)

####Plotting
        dev.off()
        par(mfcol=c(2,2)) #4 plots column wise first
        
        #1st one is global active power
        plot(powdata$datetime,powdata$Global_active_power,type = "n",ylab="Global Active Power (KiloWatts)",xlab="")
        lines(powdata$datetime,powdata$Global_active_power)
        
        #2nd plot
        plot(powdata$datetime,powdata$Sub_metering_1,type = "n",ylab="Energy sub metering",xlab="")
        lines(powdata$datetime,powdata$Sub_metering_1,col="black")
        lines(powdata$datetime,powdata$Sub_metering_2,col="red")
        lines(powdata$datetime,powdata$Sub_metering_3,col="blue")
        legend("topright", colnames(powdata[,7:9]),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
        
        #3rd plot
        plot(powdata$datetime,powdata$Voltage,type="n",ylab="Voltage",xlab="datetime")
        lines(powdata$datetime,powdata$Voltage,col="black")
        
        #4th plot
        plot(powdata$datetime,powdata$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
        lines(powdata$datetime,powdata$Global_reactive_power)
        
#Writing it into png file
        dev.copy(png,file="plot4.png")
        dev.off()
        