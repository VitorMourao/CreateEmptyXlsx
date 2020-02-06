#I will use an xlsx file that has 2 columns, Date/Month/Price

#We will use the library openxlsx
library(openxlsx)

#Then save our data in a data frame (df1),
#We can choose what sheet we want, as the rows and columns
df1 <- readWorkbook(xlsxFile = "path/filename.xlsx", sheet = 1, rows = 3:27, cols = c(1,2))

#If we have dates on our worksheet we can use the parameter "detectDates = TRUE",
#but this don't work for me so I will convert the data to date format
dts <- convertToDate(df1$Date)

#Then we will put back on our data frame our new format
df1$Date <- dts

#Now we have our data from xlsx to R, suppose that we want to
#make a linear regression model.

#So we save our column price in prc and the column date to time
prc <- df1$Price

time <- df1$Date

#Then we made the linear regression model,  y ~ x
lm.D1 <- lm(prc ~ time)

#We can print a summary of our analysis, a plot of our data and
#The regression line.
print(summary(lm.D1))
plot(time, prc, pch = 16, xlab = " ", ylab = " ")
abline(lm(prc ~ time), col = "red")

#If we want to analyze our data by month ----------------------------------------------------------
month <- df1$Month

#Then again we make our linear regression y ~ x
lm.D2 <- lm(prc ~ month)

#We can print our summary and plot our data with the linear regression
print(summary(lm.D2))
plot(month, prc, pch = 16, xlab = " ", ylab = " ")
abline(lm(prc ~ month), col = "red")

#Then we can make a list of months
by.mth <- list();
by.mth[[1]] <- month

#Apply the mean funtion to each month and plot it.
mth.mean <- aggregate(prc, by = by.mth, FUN = mean)
plot(mth.mean)
