rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(!state %in% outcomedata$State) stop("invalid state")
  if(!outcome %in% outcomes) stop("invalid outcome")
  statedata <- outcomedata[outcomedata$State == state,]
  stateoutcomedata <- NULL
  if(outcome == "heart attack") {
    stateoutcomedata <- statedata[,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
    stateoutcomedata[,2] <- as.numeric(as.character(stateoutcomedata[,2]))
    stateoutcomedata <- na.omit(stateoutcomedata)
    stateoutcomedata <- stateoutcomedata[order(stateoutcomedata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, stateoutcomedata$Hospital.Name),]
  
  }
  else if(outcome == "heart failure") {
    stateoutcomedata <- statedata[,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
    stateoutcomedata[,2] <- as.numeric(as.character(stateoutcomedata[,2]))
    stateoutcomedata <- na.omit(stateoutcomedata)
    stateoutcomedata <- stateoutcomedata[order(stateoutcomedata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, stateoutcomedata$Hospital.Name),]
  }
  else if(outcome == "pneumonia") {
    stateoutcomedata <- statedata[,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
    stateoutcomedata[,2] <- as.numeric(as.character(stateoutcomedata[,2]))
    stateoutcomedata <- na.omit(stateoutcomedata)
    stateoutcomedata <- stateoutcomedata[order(stateoutcomedata$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, stateoutcomedata$Hospital.Name),]
  }
  hospital <- NULL
  if(num == "worst") hospital = stateoutcomedata[nrow(stateoutcomedata),1]
  else if (num == "best") hospital = best(state,outcome)
  else hospital = stateoutcomedata[num,1]
  
  hospital
}