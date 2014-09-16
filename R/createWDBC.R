#' Create Wisconsin Breast Cancer Diagnosis
#' 
#' From UCI:
#' Features are computed from a digitized image of a fine needle aspirate (FNA) of a breast mass.  They describe characteristics of the cell nuclei present in the image. A few of the images can be found at http://www.cs.wisc.edu/~street/images/
#' 
#' formula(Diagnosis ~ . -ID)
#' 
#' @param file character; path/filename to write RData file to
#' @param write logical; should the dataset be written to disk? (default: FALSE)
#' @export
createWDBC<-function(file="WDBC.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data")
    
    setnames(data,colnames(data),c("ID","Diagnosis",paste0(rep(c("Mean","SD","Worst"),each=10),rep(c("Radius","Texture","Perimeter","Area","Smoothness","Compactness","Concavity","ConcavePoints","Symmetry","FractalDimension"),3))))
    
    
    data$Diagnosis<-factor(data$Diagnosis,levels=c("M","B"),labels=c("Malignant","Benign"))
    
    if (write) {
      saveRDS(data, file=file)
    } 
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
