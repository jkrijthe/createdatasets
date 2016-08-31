#' Create Indian Liver Patient dataset
#' 
#' This data set contains 416 liver patient records and 167 non liver patient records.The data set was collected from north east of Andhra Pradesh, India. Selector is a class label used to divide into groups(liver patient or not). This data set contains 441 male patient records and 142 female patient records. Any patient whose age exceeded 89 is listed as being of age "90".
#' 
#' Task:  formula(Patient ~ . )
#' 
#' 1. Age  Age of the patient 
#'2. Gender	Gender of the patient 
#'3. TB	Total Bilirubin 
#'4. DB	Direct Bilirubin 
#'5. Alkphos Alkaline Phosphotase 
#'6. Sgpt Alamine Aminotransferase 
#'7. Sgot Aspartate Aminotransferase 
#'8. TP	Total Protiens 
#'9. ALB	Albumin 
#'10. A/G Ratio	Albumin and Globulin Ratio 
#'11. Selector field used to split the data into two sets (labeled by the experts) 
#' 
#' @references Bendi Venkata Ramana, Prof. M. S. Prasad Babu and Prof. N. B. Venkateswarlu, Critical Comparative Study of Liver Patients from USA and INDIA: An Exploratory Analysis, International Journal of Computer Science Issues, ISSN :1694-0784, May 2012. 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/ILPD+(Indian+Liver+Patient+Dataset)}
#' @export
createIndianLiverPatient<-function(file=getfilepath("indianliverpatient.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/00225/Indian%20Liver%20Patient%20Dataset%20(ILPD).csv")
    
    setnames(data,colnames(data),c("Age","Gender","TotalBilirubin","DirectBilirubin","Alkphos","Sgpt","Sgot","TotalProtiens","Albumin","AG","Patient"))
  data$Gender<-factor(data$Gender)  
  data$Patient<-factor(data$Patient,levels=1:2,labels=c("Liver","NonLiver"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
