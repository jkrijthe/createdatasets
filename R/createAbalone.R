#' Abalone Age prediction
#' 
#' Predict the age of abalone from physical measurements
#' 
#' \emph{Task:} Regression: formula(Rings~.)
#' Often the  final 1044 examples as used test, the first 3133 for training.
#' 
#' \emph{From UCI:} "Data can be treated as a classification task, for instance Data set treated as a 3-category classification problem (grouping ring classes 1-8, 9 and 10, and 11 on)"
#' 
#' @references Warwick J Nash, Tracy L Sellers, Simon R Talbot, Andrew J Cawthorn and Wes B Ford (1994) "The Population Biology of Abalone (_Haliotis_ species) in Tasmania. I. Blacklip Abalone (_H. rubra_) from the North Coast and Islands of Bass Strait", Sea Fisheries Division, Technical Report No. 48 (ISSN 1034-3288)
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Abalone}
#' @export
createAbalone<-function(file=getfilepath("abalone.rds"),write=TRUE,read=TRUE) {
  require(data.table)
  if (!read | !file.exists(file)) {
    data<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data")
    setnames(data,colnames(data),c("Sex","Length","Diameter","Height","WholeWeight","ShuckedWeight","VisceraWeight","ShellWeigth","Rings"))
    data$Sex<-factor(data$Sex)
    levels(data$Sex)<-c("Female","Infant","Male")
  
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }

  return(data)
}
