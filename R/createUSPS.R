#' Create USPS dataset from the SSL benchmarks
#'
#'  Task:
#'  formula(Class ~ .)
#'
#' Cite: Chapelle
#'
#' @inheritParams createDiabetes
#' @export
createUSPS <- function(file=getfilepath("USPS.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    requireNamespace("R.matlab")
    ds<-readMat(url("http://olivier.chapelle.cc/ssl-book/SSL,set=2,data.mat"))
    data<-data.table(ds$X,Class=factor(ds$y))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data) 
}
