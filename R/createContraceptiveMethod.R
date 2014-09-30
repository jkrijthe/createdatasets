#' Create Contraceptive Method Choice dataset
#' 
#' 
#' From UCI: This dataset is a subset of the 1987 National Indonesia Contraceptive Prevalence Survey. The samples are married women who were either not pregnant or do not know if they were at the time of interview. The problem is to predict the current contraceptive method choice (no use, long-term methods, or short-term methods) of a woman based on her demographic and socio-economic characteristics.
#' 
#' 1. Wife's age (numerical) 
#'2. Wife's education (categorical) 1=low, 2, 3, 4=high 
#'3. Husband's education (categorical) 1=low, 2, 3, 4=high 
#'4. Number of children ever born (numerical) 
#'5. Wife's religion (binary) 0=Non-Islam, 1=Islam 
#'6. Wife's now working? (binary) 0=Yes, 1=No 
#'7. Husband's occupation (categorical) 1, 2, 3, 4 
#'8. Standard-of-living index (categorical) 1=low, 2, 3, 4=high 
#'9. Media exposure (binary) 0=Good, 1=Not good 
#'10. Contraceptive method used (class attribute) 1=No-use, 2=Long-term, 3=Short-term
#' 
#' Task: two class: formula(factor(Contraceptive=="No-use") ~ .)
#' multiclass: formula(Contraceptive ~ .)
#' 
#' @references Lim, T.-S., Loh, W.-Y. & Shih, Y.-S. (1999). A Comparison of Prediction Accuracy, Complexity, and Training Time of Thirty-three Old and New Classification Algorithms. Machine Learning
#' 
#' 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Contraceptive+Method+Choice}
#' @export
createContraceptiveMethod<-function(file="contraceptivemethod.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/cmc/cmc.data")
    
    setnames(data,colnames(data),c("Age","Education","HusbandEducation","Children","Religion","Working","HusbandOccupation","StandardOfLiving","MediaExposure","Contraceptive"))
    
    data$Education<-ordered(data$Education)
    data$HusbandEducation<-ordered(data$HusbandEducation)
    data$Religion<-factor(data$Religion,levels=0:1,labels=c("Non-Islam","Islam"))
    data$Working<-factor(data$Working,levels=0:1,labels=c("Yes","No"))
    data$HusbandOccupation<-factor(data$HusbandOccupation)
    data$StandardOfLiving<-ordered(data$StandardOfLiving)
    data$MediaExposure<-factor(data$MediaExposure,levels=0:1,labels=c("Good","Not Good"))
    data$Contraceptive<-factor(data$Contraceptive,levels=1:3,labels=c("No-use","Short-term","Long-term"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
