#' Create SecStr dataset from the SSL benchmarks
#'
#'  Task:
#'  formula(Class ~ .)
#'
#' Cite: Chapelle
#'
#' @inheritParams createDiabetes
#' @seealso \url{http://olivier.chapelle.cc/ssl-book/benchmarks.html}
#' @export
createSecStr <- function(file=getfilepath("secstr.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    requireNamespace("R.matlab")
    ds<-readMat(url("http://olivier.chapelle.cc/ssl-book/SSL,set=8,data.mat"))
  
  
    m <- nrow(ds$T)
    d0 <- ncol(ds$T)
    ks = unique(as.numeric(ds$T))
    k = length(ks)
    d1 = k * d0
    X = matrix(0,m,d1) #repmat( logical(0), m, d1 );
    l = 0;
    for (i  in 1:k) {
      X[, (l+1):(l+d0)] = ( ds$T == ks[i] )
      l = l + d0
    }
  
    data<-data.table(X,Class=factor(ds$y))
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data) 
}
