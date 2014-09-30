#' Create Banknote Authentication dataset
#' 
#' 
#' From UCI: Data were extracted from images that were taken from genuine and forged banknote-like specimens. For digitization, an industrial camera usually used for print inspection was used. The final images have 400x 400 pixels. Due to the object lens and distance to the investigated object gray-scale pictures with a resolution of about 660 dpi were gained. Wavelet Transform tool were used to extract features from images.
#' 
#' 1. variance of Wavelet Transformed image (continuous) 
#' 2. skewness of Wavelet Transformed image (continuous) 
#' 3. curtosis of Wavelet Transformed image (continuous) 
#' 4. entropy of image (continuous) 
#' 5. class (integer) 
#' 
#' Task:  formula(Class ~ .)
#' 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/banknote+authentication}
#' @export
createBanknote<-function(file="banknote.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/00267/data_banknote_authentication.txt")
    
    setnames(data,colnames(data),c("Variance","Skewness","Kurtosis","Entropy","Class"))
    
    data$Class<-factor(data$Class)
    
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
