#' Create SSL Text dataset from the SSL benchmarks
#'
#'  Task:
#'  formula(Class ~ .)
#'
#' Cite: Chapelle
#'
#' @param file character; path/filename to write RData file to
#' @param write logical; should the dataset be written to disk? (default: FALSE)
#' @export
createSSLText <- function(file=getfilepath("SSLText.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    require(R.matlab)
    require(data.table)
    warning("TODO")
#     ds<-readMat(url("http://olivier.chapelle.cc/ssl-book/SSL,set=9,data.mat"))
#     data<-list(X=ds$X,Class=factor(ds$y))
#     
#     if (write) {
#       saveRDS(data, file=file)
#     }
  } else {
    data<-readRDS(file)
  }
  
  return(data) 
}
