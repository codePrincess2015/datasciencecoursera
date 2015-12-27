corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  cor_vector <- vector()
  for(current_id in 1:332) {
    num_chars = nchar(current_id)
    file_name = ""
    if(num_chars == 1) file_name = paste(c(directory,"/00",current_id,".csv"),collapse = "")
    else if (num_chars == 2) file_name = paste(c(directory,"/0",current_id,".csv"),collapse = "")
    else file_name = paste(c(directory,"/",current_id,".csv"),collapse = "")
    
  
    current_file <- read.csv(file_name, header = TRUE)
    if(complete(directory,id = current_id)$nobs > threshold) {
      correlation <- 0
      complete_cases <- na.omit(current_file)
      v_1 <- complete_cases$nitrate
      v_2 <- complete_cases$sulfate
      correlation <- cor(v_1,v_2)
      cor_vector <- c(cor_vector,correlation)
    }
  }
  cor_vector
}