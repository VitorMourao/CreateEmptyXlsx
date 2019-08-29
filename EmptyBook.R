library(openxlsx) # import the openxlsx library

wb <- createWorkbook() # create the workbook (xlsx archive that contains the sheets)

# Add every sheet we want, in order, to our workbook
addWorksheet(wb, sheetName = "st", gridLines = TRUE)
addWorksheet(wb, sheetName = "ct", gridLines = TRUE)
addWorksheet(wb, sheetName = "par", gridLines = TRUE)
addWorksheet(wb, sheetName = "inp", gridLines = TRUE)
addWorksheet(wb, sheetName = "sw", gridLines = TRUE)
addWorksheet(wb, sheetName = "sim", gridLines = TRUE)

# Create the names of our columns (if we use c() instead of list() we have the row names)
colnames1 <- list("Variable", "Value", "Unit", "Description")
colnames2 <- list("Variable", "Value", "Unit", "Description", "Interpolation")

# Write the names in our archive starting from column 1 and row 1
# x = list of names that our columns will have.
writeData(wb, 1, x = colnames1,startCol = 1, startRow = 1, colNames = TRUE)
writeData(wb, 2, x = colnames1,startCol = 1, startRow = 1, colNames = TRUE)
writeData(wb, 3, x = colnames1,startCol = 1, startRow = 1, colNames = TRUE)
writeData(wb, 4, x = colnames2,startCol = 1, startRow = 1, colNames = TRUE)
writeData(wb, 5, x = colnames1,startCol = 1, startRow = 1, colNames = TRUE)
writeData(wb, 6, x = colnames1,startCol = 1, startRow = 1, colNames = TRUE)

# Save the workbook
saveWorkbook(wb, "emptyBook.xlsx", overwrite = TRUE)