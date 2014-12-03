#' Create Wisconsin Breast Cancer Prognosis
#' 
#' From UCI:
#' Features are computed from a digitized image of a fine needle aspirate (FNA) of a breast mass.  They describe characteristics of the cell nuclei present in the image. A few of the images can be found at http://www.cs.wisc.edu/~street/images/
#' 
#' Two tasks:
#' Predicting recurrence in next 24 months
#' formula(Outcome ~ . -ID -Time)
#' 
#' Predicting time of recurrence
#' Something like:
#' formula(Time ~ . -ID -Outcome)
#' 
#' @param file character; path/filename to write RData file to
#' @param write logical; should the dataset be written to disk? (default: FALSE)
#' @export
createWPBC<-function(file=getfilepath("WPBC.RData"),write=FALSE) {
  require(data.table)
  data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wpbc.data",na.strings=c("NA","?"))
  
  setnames(data,colnames(data),c("ID","Outcome","Time",paste0(rep(c("Mean","SD","Worst"),each=10),rep(c("Radius","Texture","Perimeter","Area","Smoothness","Compactness","Concavity","ConcavePoints","Symmetry","FractalDimension"),3)),"TumorSize","LymphNode"))
  
  
  data$Outcome<-factor(data$Outcome,levels=c("N","R"),labels=c("Nonrec","Recur"))
  data$LymphNode<-as.integer(data$LymphNode)
  
  if (write) {
    save(data, file=file)
  }
  
  return(data)
}
