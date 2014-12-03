#' Create SPECT dataset
#' 
#' Single-photon emission computed tomography
#' 
#' First 80 train, the rest is test
#' 
#' formula(Diagnosis ~ .)
#' 
#' @param file character; path/filename to write RData file to
#' @param write logical; should the dataset be written to disk? (default: FALSE)
#' @export
createSPECT<-function(file=getfilepath("SPECT.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/spect/SPECT.train")
    data2 <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/spect/SPECT.test")
    data<-rbind(data,data2)
    
    setnames(data,colnames(data),c("Diagnosis",paste0("F",1:22)))
    
    data$Diagnosis<-factor(data$Diagnosis,levels=0:1,labels=c("Abnormal","Normal"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
