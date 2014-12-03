#' Create SPECTF dataset
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
createSPECTF<-function(file=getfilepath("SPECTF.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/spect/SPECTF.train")
    data2 <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/spect/SPECTF.test")
    data<-rbind(data,data2)
    
    setnames(data,colnames(data),c("Diagnosis",c(paste0(rep(paste0("F",1:22),each=2),c("R","S")))))
    
  # Scale by 100  
  data[,colnames(data)[-1]:=data[,-1,with=F]/100]
    
    data$Diagnosis<-factor(data$Diagnosis,levels=0:1,labels=c("Abnormal","Normal"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
