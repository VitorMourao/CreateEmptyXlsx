#A function to create a xlsx document.
xlsxTemplate <- function(file){
  wb <- openxlsx::createWorkbook() # create the workbook

  # Sheet names
  sheetNames <- list("st","ct","par","inp","sw","sim")

  for (x in sheetNames){
    openxlsx::addWorksheet(wb, sheetName = x, gridLines = TRUE)
  }

  # Columns
  colNames <- list("Variable", "Value", "Unit", "Description")
  colNamesInp <- list("Variable", "Value", "Unit", "Description", "Interpolation")

  # Write data in the sheets
  for(i in 1:lenght(sheetNames)){
    if(sheetNames[i] != "inp"){
      openxlsx::writeData(wb, i, x = colNames,
                          startCol = 1, startRow = 1, colNames = TRUE)
    }
    else{
      openxlsx::writeData(wb, i, x = colNamesInp,
                          startCol = 1, startRow = 1, colNames = TRUE)
    }
  }
  
  # Save the workbook
  openxlsx::saveWorkbook(wb, file, overwrite = TRUE)
