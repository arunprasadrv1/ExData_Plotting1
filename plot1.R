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
         
        dev.off()
        png(file="plot1.png")
        hist(powdata$Global_active_power,col="red",main="Global Active Power", xlab = "Global Active Power (KiloWatts)")
        dev.off()
