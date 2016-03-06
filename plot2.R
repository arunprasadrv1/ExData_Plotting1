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
        png(file="plot2.png")
        plot(powdata$datetime,powdata$Global_active_power,type = "n",ylab="Global Active Power (KiloWatts)",xlab="")
        lines(powdata$datetime,powdata$Global_active_power)
        dev.off()
