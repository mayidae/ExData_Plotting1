## project Exploratory Data Analysis

#Cargar los datos solo los dias 2007-02-01 y 2007-02-02 de “Individual household electric power consumption Data Set” 
#("Conjunto de datos de consumo de energía eléctrica de los hogares individuales")

consumo <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(consumo) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subconsumo <- subset(consumo,consumo$Date=="1/2/2007" | consumo$Date =="2/2/2007")

#cambiar formato de variales de interés
subconsumo$Date <- as.Date(subconsumo$Date, format="%d/%m/%Y")

#crear una nueva varible llamada datetime
datetime <- paste(as.Date(subconsumo$Date), subconsumo$Time)
subconsumo$datetime <- as.POSIXct(datetime)

#Crear el plot 3
with(subconsumo, {
  plot(Sub_metering_1~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# crear el plot3 en formato png
png("plot3.png", width=480, height=480)
with(subconsumo, {
  plot(Sub_metering_1~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
