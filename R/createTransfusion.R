#' Create Blood Transfusion dataset
#' 
#' From UCI:
#' R (Recency - months since last donation),
#' F (Frequency - total number of donation),
#' M (Monetary - total blood donated in c.c.),
#' T (Time - months since first donation), and
#' a binary variable representing whether he/she donated blood in March 2007 (1 stand for donating blood; 0 stands for not donating blood).
#' 
#' 
#' @references Yeh, I-Cheng, Yang, King-Jang, and Ting, Tao-Ming, "Knowledge discovery on RFM model using Bernoulli sequence, "Expert Systems with Applications, 2008 (doi:10.1016/j.eswa.2008.07.018)
#' 
#' formula(Donated ~ .)
#' 
#' @param file character; path/filename to write RData file to
#' @param write logical; should the dataset be written to disk? (default: FALSE)
#' @export
createTransfusion<-function(file=getfilepath("transfusion.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/blood-transfusion/transfusion.data")
    
    setnames(data,colnames(data),c("Recency","Frequency","Monetary","Time","Donated"))
    
    data$Donated<-factor(data$Donated,levels=0:1,labels=c("No","Yes"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
