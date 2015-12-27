rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(!outcome %in% outcomes) stop("invalid outcome")
  bestinstate <- data.frame( "hospital" = character(), "state" = character(), stringsAsFactors=FALSE)
  for(state in unique(outcomedata$State)) {
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
    bestinstate[nrow(bestinstate) + 1, ] <- c(hospital, state)
  }
  
  bestinstate <- bestinstate[order(bestinstate$state),]
  bestinstate
}