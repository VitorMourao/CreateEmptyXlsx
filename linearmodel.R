library(openxlsx)
df1 <- readWorkbook(xlsxFile = "/home/e20241/Documentos/upecExample.xlsx", sheet = 1, rows = 3:27, cols = c(1,2))
datas <- convertToDate(df1$Data)

df1$Data <- datas

precos <- df1$Preço
meses <- df1$Data
lm.D1 <- lm(precos ~ meses)
summary(lm.D1)
plot(meses, precos, pch = 16, xlab = " ", ylab = " ")
abline(lm(precos ~ meses), col = "red")
