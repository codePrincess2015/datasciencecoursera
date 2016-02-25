pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  pollutant_values <- vector()
  
  for(current_id in id) {
    num_chars = nchar(current_id)
    file_name = ""
    if(num_chars == 1) file_name = paste(c("00",current_id,".csv"),collapse = "")
    else if (num_chars == 2) file_name = paste(c("0",current_id,".csv"),collapse = "")
    else file_name = paste(c(current_id,".csv"),collapse = "")
    
    current_pollutant_values <- read.csv(file_name, header = TRUE)
    print(current_pollutant_values)
    break
  }
}