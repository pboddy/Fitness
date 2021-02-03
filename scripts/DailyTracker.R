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

year

# year <- year[4:nrow(year),]

days <- rep(week, length.out = nrow(year) )

year <- cbind(year, days)

rm(date, days, month, week)

year$DayMonth <- paste(year$date, year$month)

year$week <- rep(1:100, each = 7, length.out = nrow(year))

year$ExerciseWindow <- rep(1:7, length.out = nrow(year))
rownames(year) <- NULL
year <- year[1:221,]
mondays <- year[year$days == "Mon", ]

ggplot(data = year, aes(x = week, y = ExerciseWindow))+
  geom_point(shape = 1, size = 10,) + 
  scale_y_continuous(labels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun") , breaks = seq(1, 7, by = 1))+
  scale_x_continuous(labels = mondays$DayMonth, breaks = seq(1,32,1)) +
  guides(x =  guide_axis(angle = 90), y =  guide_axis(angle = 90))+
  labs(x = "", y = "")+
  theme_minimal() 

ggsave("2021_track.pdf", width = 29.7, height = 21.0, units = "cm"  )
rm(year, KG, normal, obese, overweight)