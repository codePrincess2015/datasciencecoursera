complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  id_vector <- vector()
  nobs_vector <- vector()
  for(current_id in id) {
    num_chars = nchar(current_id)
    file_name = ""
    if(num_chars == 1) file_name = paste(c(directory,"/00",current_id,".csv"),collapse = "")
    else if (num_chars == 2) file_name = paste(c(directory,"/0",current_id,".csv"),collapse = "")
    else file_name = paste(c(directory,"/",current_id,".csv"),collapse = "")
    
    current_file <- read.csv(file_name, header = TRUE)
    id_vector <- c(id_vector,current_id)
    nobs_vector <- c(nobs_vector,nrow(na.omit(current_file)))
   
  }
  data.frame(id = id_vector, nobs = nobs_vector)
}