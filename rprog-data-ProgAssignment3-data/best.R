best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate

  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(!state %in% outcomedata$State) stop("invalid state")
  if(!outcome %in% outcomes) stop("invalid outcome")
  statedata <- outcomedata[outcomedata$State == state,]
  hospitalnames <- NULL
  if(outcome == "heart attack") {
    stateoutcomedata <- statedata[,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
    stateoutcomedata[,2] <- as.numeric(as.character(stateoutcomedata[,2]))
    stateoutcomedata <- na.omit(stateoutcomedata)
    order <- order(stateoutcomedata[,"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",drop=FALSE])
    stateoutcomedata.sorted <- stateoutcomedata[order,]
    targetvalue <- stateoutcomedata.sorted[1,2]
    targethospitals <- stateoutcomedata.sorted[stateoutcomedata.sorted$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == targetvalue,]
    order <- order(targethospitals$Hospital.Name)
    hospitalnames <- targethospitals$Hospital.Name[order]
  }
  else if(outcome == "heart failure") {
    stateoutcomedata <- statedata[,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
    stateoutcomedata[,2] <- as.numeric(as.character(stateoutcomedata[,2]))
    stateoutcomedata <- na.omit(stateoutcomedata)
    order <- order(stateoutcomedata[,"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",drop=FALSE])
    stateoutcomedata.sorted <- stateoutcomedata[order,]
    targetvalue <- stateoutcomedata.sorted[1,2]
    targethospitals <- stateoutcomedata.sorted[stateoutcomedata.sorted$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == targetvalue,]
    order <- order(targethospitals$Hospital.Name)
    hospitalnames <- targethospitals$Hospital.Name[order]
  }
  else if(outcome == "pneumonia") {
    stateoutcomedata <- statedata[,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
    stateoutcomedata[,2] <- as.numeric(as.character(stateoutcomedata[,2]))
    stateoutcomedata <- na.omit(stateoutcomedata)
    order <- order(stateoutcomedata[,"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia",drop=FALSE])
    stateoutcomedata.sorted <- stateoutcomedata[order,]
    targetvalue <- stateoutcomedata.sorted[1,2]
    targethospitals <- stateoutcomedata.sorted[stateoutcomedata.sorted$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == targetvalue,]
    order <- order(targethospitals$Hospital.Name)
    hospitalnames <- targethospitals$Hospital.Name[order]
  }
  hospitalnames[1]
}
