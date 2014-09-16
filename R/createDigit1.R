#' Create Digit1 dataset from the SSL benchmarks
#'
#'  Task:
#'  formula(Class ~ .)
#'
#' Cite: Chapelle
#'
#' @param file character; path/filename to write RData file to
#' @param write logical; should the dataset be written to disk? (default: FALSE)
createDigit1 <- function(file="digit1.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    require(R.matlab)
    ds<-readMat(url("http://olivier.chapelle.cc/ssl-book/SSL,set=1,data.mat"))
    data<-data.table(ds$X,Class=factor(ds$y))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data) 
}
