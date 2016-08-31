#' Create Wisconsin Breast Cancer Diagnosis (Original)
#' 
#' From UCI:
#' Citation Request:
# This breast cancer databases was obtained from the University of Wisconsin
# Hospitals, Madison from Dr. William H. Wolberg.  If you publish results
# when using this database, then please include this information in your
# acknowledgements.  Also, please cite one or more of:
#   
#   1. O. L. Mangasarian and W. H. Wolberg: "Cancer diagnosis via linear 
#       programming", SIAM News, Volume 23, Number 5, September 1990, pp 1 & 18.
# 
# 2. William H. Wolberg and O.L. Mangasarian: "Multisurface method of 
#       pattern separation for medical diagnosis applied to breast cytology", 
# Proceedings of the National Academy of Sciences, U.S.A., Volume 87, 
# December 1990, pp 9193-9196.
# 
# 3. O. L. Mangasarian, R. Setiono, and W.H. Wolberg: "Pattern recognition 
#       via linear programming: Theory and application to medical diagnosis", 
# in: "Large-scale numerical optimization", Thomas F. Coleman and Yuying
# Li, editors, SIAM Publications, Philadelphia 1990, pp 22-30.
# 
# 4. K. P. Bennett & O. L. Mangasarian: "Robust linear programming 
#       discrimination of two linearly inseparable sets", Optimization Methods
# and Software 1, 1992, 23-34 (Gordon & Breach Science Publishers).
# 
#' formula(Class ~ . -ID)
#' 
#' @param file character; path/filename to write RData file to
#' @param write logical; should the dataset be written to disk? (default: FALSE)
#' @export
createWOBC<-function(file=getfilepath("WOBC.RData"),write=FALSE) {
  
  data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data",na.strings = c("NA",'?'), colClasses=list(character=c(1,7)))
  
  setnames(data,colnames(data),c("ID","ClumpThickness","UniformitySize","UniformityShape","MarginalAdhesion","SingleEpiSize","BaseNuclei","BlandChromatin","NormalNucleoli","Mitoses","Class"))
  data$BaseNuclei<-as.integer(data$BaseNuclei)
  
  data$Class<-factor(data$Class,levels=c(4,2),labels=c("Malignant","Benign"))
  
  if (write) {
    save(data, file=file)
  }
  
  return(data)
}
