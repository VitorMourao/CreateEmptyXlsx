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

#So we save our column price in prc and the column date to time
prc <- df1$Price

time <- df1$Date

#Then we made the linear regression model,  y ~ x
lm.D1 <- lm(prc ~ time)

#We can print a summary of our analysis, a plot of our data and
#The regression line.
print(summary(lm.D1))

plot(time, prc, main = "Historical Prices", pch = 16, xlab = "Year", ylab = "Inflation updated prices - US$", type = "b")
axis.Date(1, at = seq(as.Date("2000/1/1"), max(as.Date("2008/1/1")), "years"))
legend("topleft", c(paste("Coef. Ang = ", signif(lm.D1$coefficients[[2]], digits = 4)), paste("p-value = ", 
        signif(summary(lm.D1)$coefficients[2,4], digits = 4))), cex = 0.8, box.lty = 0, bg = "transparent", box.lwd = 2)

abline(lm(prc ~ time), col = "red")
