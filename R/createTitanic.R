#' Create Titanic survival dataset
#' 
#' From source: "The titanic and titanic2 data frames describe the survival status of individual passengers on the Titanic. The titanic data frame does not contain information from the crew, but it does contain actual ages of half of the passengers. The principal source for data about Titanic passengers is the Encyclopedia Titanica. The datasets used here were begun by a variety of researchers. One of the original sources is Eaton & Haas (1994) Titanic: Triumph and Tragedy, Patrick Stephens Ltd, which includes a passenger list created by many researchers and edited by Michael A. Findlay."
#' 
#' Task:  formula(survived ~ . -name) # This includes life-boat information
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{http://lib.stat.cmu.edu/S/Harrell/data/descriptions/titanic.html}
#' @export
createTitanic<-function(file=getfilepath("titanic.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://lib.stat.cmu.edu/S/Harrell/data/ascii/titanic.txt",header=TRUE,na.strings=c("NA",""),stringsAsFactors = TRUE)
    
    # Explicitly convert strings to factors
    data[row.names:=NULL]
    data$pclass <- as.factor(data$pclass)
    data$survived <- as.factor(data$survived)
    data$embarked <- as.factor(data$embarked)
    data$home.dest <- as.factor(data$home.dest)
    data$room <- as.factor(data$room)
    data$ticket <- as.factor(data$ticket)
    data$boat <- as.factor(data$boat)
    data$sex <- as.factor(data$sex)
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }

return(data)
}

