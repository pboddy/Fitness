# library(ggplot2)
# library(ggrepel)

May <- c(1:31)
June <- c(1:30)
July <- c(1:31)
Aug <- c(1:31)
Sept <- c(1:30)
Oct <- c(1:31)
Nov <- c(1:30)
Dec <- c(1:31)

date <- c(May, June, July, Aug, Sept, Oct, Nov, Dec)

May <- rep("May", 31)
June <-rep("Jun", 30)
July <- rep("Jul", 31)
Aug <- rep("Aug", 31)
Sept <- rep("Sep", 30)
Oct <- rep("Oct", 31)
Nov <- rep("Nov", 30)
Dec <- rep("Dec", 31)

month <- c(May, June, July, Aug, Sept, Oct, Nov, Dec)

rm(May, June, July, Aug, Sept, Oct, Nov, Dec)

week <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")

year <- as.data.frame(cbind(month, date))

year <- year[4:nrow(year),]

days <- rep(week, length.out = nrow(year) )

year <- cbind(year, days)

rm(date, days, month, week)

KG <- rep(100:80, length.out = nrow(year), each = 7)

year <- cbind(year, KG)
rownames(year) <- NULL

year[148:nrow(year),]$KG <- 80

year <- year[year$days == "Mon",]

rownames(year) <- NULL

year

year <- year[1:21,]
year$week <- c(1:21)
year$DayMonth <- paste(year$date, year$month)

  
year$height <- 1.79
year$bmi <- (year$KG/year$height^2)
year$bmiNEW <- 1.3 * (year$KG/year$height^2.5)
year  
normal <- (25)
overweight <- (25)
obese <-  (30)

year$Satus <- NA
year[year$bmi <= normal , ]$Satus <- "normal"
year[year$bmi >= overweight , ]$Satus <- "overweight"
year[year$bmi >= obese , ]$Satus <- "obese"

year$SatusNEW <- NA
year[year$bmiNEW <= normal , ]$SatusNEW <- "normal"
year[year$bmiNEW >= overweight , ]$SatusNEW <- "overweight"
year[year$bmiNEW >= obese , ]$SatusNEW <- "obese"

ggplot(data = year, aes(x = week, y = KG))+
  geom_point() + 
  scale_y_continuous(breaks = seq(70, 110, by = 0.5))+
  scale_x_continuous(labels = year$DayMonth, breaks = seq(1,21,1))+
  geom_rect(aes(xmin = 1, xmax = 21, ymin = 79, ymax = 83), fill="green", alpha=0.01)+
  geom_rect(aes(xmin = 1, xmax = 21, ymin = 83, ymax = 96), fill="yellow", alpha=0.01)+
  geom_rect(aes(xmin = 1, xmax = 21, ymin = 96, ymax = 101), fill="red", alpha=0.01) 
  