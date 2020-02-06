#I will use an xlsx file that has 2 columns, Date/Price

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

prc <- df1$Price
time <- df1$Date
lm.D1 <- lm(prc ~ time)
summary(lm.D1)
plot(time, prc, pch = 16, xlab = " ", ylab = " ")
abline(lm(prc ~ time), col = "red")