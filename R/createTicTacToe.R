#' Create Tic-Tac-Toe Endgame dataset
#' 
#' From UCI: "This database encodes the complete set of possible board configurations at the end of tic-tac-toe games, where "x" is assumed to have played first. The target concept is "win for x" (i.e., true when "x" has one of 8 possible ways to create a "three-in-a-row"). Interestingly, this raw database gives a stripped-down decision tree algorithm (e.g., ID3) fits. However, the rule-based CN2 algorithm, the simple IB1 instance-based learning algorithm, and the CITRE feature-constructing decision tree algorithm perform well on it."
#' 
#' Task:  formula(Class ~ .)
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' 
#' 1. top-left-square: {x,o,b} 
#' 2. top-middle-square: {x,o,b} 
#' 3. top-right-square: {x,o,b} 
#' 4. middle-left-square: {x,o,b} 
#' 5. middle-middle-square: {x,o,b} 
#' 6. middle-right-square: {x,o,b} 
#' 7. bottom-left-square: {x,o,b} 
#' 8. bottom-middle-square: {x,o,b} 
#' 9. bottom-right-square: {x,o,b} 
#' 
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Tic-Tac-Toe+Endgame}
#' @export
createTicTacToe<-function(file = getfilepath("tictactoe.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    require(foreign)
    data<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/tic-tac-toe/tic-tac-toe.data",header = FALSE)
    setnames(data,colnames(data),c("top-left-square","top-middle-square","top-right-square","middle-left-square","middle-middle-square","middle-right-square","bottom-left-square","bottom-middle-square","bottom-right-square","Class"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
