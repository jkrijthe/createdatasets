#' Create COIL2 dataset from the SSL benchmarks
#'
#'  Task:
#'  formula(Class ~ .)
#'
#' Cite: Chapelle
#'
#' @inheritParams createDiabetes
#' @export
createCOIL2 <- function(file=getfilepath("COIL2.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    requireNamespace("R.matlab")
    ds<-readMat(url("http://olivier.chapelle.cc/ssl-book/SSL,set=3,data.mat"))
    data<-data.frame(ds$X,Class=factor(ds$y))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data) 
}
