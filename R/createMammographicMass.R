#' Create Mammographic Mass dataset
#' 
#' From UCI:
#' This data set can be used to predict the severity (benign or malignant) of a mammographic mass lesion from BI-RADS attributes and the patient's age. It contains a BI-RADS assessment, the patient's age and three BI-RADS attributes together with the ground truth (the severity field) for 516 benign and 445 malignant masses that have been identified on full field digital mammograms collected at the Institute of Radiology of the University Erlangen-Nuremberg between 2003 and 2006. Each instance has an associated BI-RADS assessment ranging from 1 (definitely benign) to 5 (highly suggestive of malignancy) assigned in a double-review process by physicians. Assuming that all cases with BI-RADS assessments greater or equal a given value (varying from 1 to 5), are malignant and the other cases benign, sensitivities and associated specificities can be calculated. These can be an indication of how well a CAD system performs compared to the radiologists.
#' 
#' formula(Severity ~ . -BIRADS)
#' 
#' @param file character; path/filename to write RData file to
#' @param write logical; should the dataset be written to disk? (default: FALSE)
createMammographicMass<-function(file="mammographicmass.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/mammographic-masses/mammographic_masses.data", na.strings="?", colClasses = list(character=1:4))
    
    setnames(data,colnames(data),c("BIRADS","Age","Shape","Margin","Density","Severity"))
    
    data$Shape<-factor(data$Shape, levels=1:4, labels=c("Round","Oval","Lobular","Irregular"))
    data$Margin<-factor(data$Margin, levels=1:5, labels=c("Circumscribed","Microlobulated","Obscured","Ill-defined","spiculated"))
    data$Severity<-factor(data$Severity,levels=c(0,1),labels=c("Benign","Malignant"))
    data$Age<-as.integer(data$Age)
    data$Density<-as.integer(data$Density)
    data$BIRADS<-as.integer(data$BIRADS)
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
