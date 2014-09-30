#' Balance Scale dataset
#' 
#' 
#' \emph{Task:} Multiclass: formula(Class ~ . )
#' 
#' \emph{From UCI:} "This data set was generated to model psychologicalexperimental results.  Each example is classified as having thebalance scale tip to the right, tip to the left, or bebalanced.  The attributes are the left weight, the leftdistance, the right weight, and the right distance.  Thecorrect way to find the class is the greater of (left-distance * left-weight) and (right-distance * right-weight).  If they are equal, it is balanced."
#' 
#' @references Siegler, R. S. (1976).  Three Aspects of CognitiveDevelopment.  Cognitive Psychology, 8, 481-520.
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Balance+Scale}
#' @export
createBalanceScale<-function(file="balancescale.rds",write=TRUE,read=TRUE) {
  require(data.table)
  if (!read | !file.exists(file)) {
    data<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/balance-scale/balance-scale.data")

    
    setnames(data,colnames(data),c("Class","LeftWeight","LeftDistance","RightWeight","RightDistance"))
    data$Class<-factor(data$Class)
    
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}

