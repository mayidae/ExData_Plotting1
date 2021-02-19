## project Exploratory Data Analysis

# Plot 1

#Cargar los datos solo los dias 2007-02-01 y 2007-02-02 de “Individual household electric power consumption Data Set” 
#("Conjunto de datos de consumo de energía eléctrica de los hogares individuales")

consumo <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(consumo) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subconsumo <- subset(consumo,consumo$Date=="1/2/2007" | consumo$Date =="2/2/2007")

#cambiar formato de variales de interés
subconsumo$Date <- as.Date(subconsumo$Date, format="%d/%m/%Y")
subconsumo$Global_active_power <- as.numeric(subconsumo$Global_active_power)

#crear plot 1
hist(subconsumo$Global_active_power, xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

#crear el gráfico en formato png
png("plot1.png", width=480, height=480)
with(subconsumo, hist(subconsumo$Global_active_power, xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red"))
dev.off()
