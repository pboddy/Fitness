library(ggplot2)

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

year$DayMonth <- paste(year$date, year$month)

year$week <- rep(1:100, each = 7, length.out = nrow(year))

year$ExerciseWindow <- rep(1:7, length.out = nrow(year))
rownames(year) <- NULL
year <- year[1:119,]
mondays <- year[year$days == "Mon", ]

ggplot(data = year, aes(x = week, y = ExerciseWindow))+
  geom_point(shape = 1, size = 10,) + 
  scale_y_continuous(labels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun") , breaks = seq(1, 7, by = 1))+
  scale_x_continuous(labels = mondays$DayMonth, breaks = seq(1,17,1)) +
  theme_minimal() 
  