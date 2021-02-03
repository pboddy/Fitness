library(ggplot2)

Jan <- c(1:31)
Feb <- c(1:28)
Mar <- c(1:31)
Apr <- c(1:30)
May <- c(1:31)
Jun <- c(1:30)
Jul <- c(1:31)
Aug <- c(1:31)
Sep <- c(1:30)
Oct <- c(1:31)
Nov <- c(1:30)
Dec <- c(1:31)

date <- c(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)

Jan <- rep("Jan", 31)
Feb <- rep("Feb", 28)
Mar <- rep("Mar", 31)
Apr <- rep("Apr", 30)
May <- rep("May", 31)
Jun <- rep("Jun", 30)
Jul <- rep("Jul", 31)
Aug <- rep("Aug", 31)
Sep <- rep("Sep", 30)
Oct <- rep("Oct", 31)
Nov <- rep("Nov", 30)
Dec <- rep("Dec", 31)

month <- c(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)

rm(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)

week <- c("Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu")

year <- as.data.frame(cbind(month, date))

# year <- year[4:nrow(year),]

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

year <- year[1:32,]
year$week <- c(1:32)
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
  geom_point(alpha=0) + 
  scale_y_continuous(breaks = seq(70, 110, by = 0.5))+
  scale_x_continuous(labels = year$DayMonth, breaks = seq(1,32,1))+
  geom_rect(aes(xmin = 0, xmax = 32, ymin = 78, ymax = 83), fill="green", alpha=0.01)+
  geom_rect(aes(xmin = 0, xmax = 32, ymin = 83, ymax = 96), fill="yellow", alpha=0.01)+
  geom_rect(aes(xmin = 0, xmax = 32, ymin = 96, ymax = 102), fill="red", alpha=0.01)+
  theme_bw()
  
ggsave("2021.pdf", width = 29.7, height = 21.0, units = "cm"  )
rm(year, KG, normal, obese, overweight)