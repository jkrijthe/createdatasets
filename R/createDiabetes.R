#' Pima Indians Diabetes dataset
#' 
#' Diagnosis of diabetes in Pima Indian women (at least 21 years old)   
#' 
#' \emph{Task}: formula(Diabetes~.)
#' 
#' \emph{Preprocessing}: Identify missing values and encode them as NA
#' 
#' \emph{From UCI description}: "Several constraints were placed on the selection of these instances from a larger database. In particular, all patients here are females at least 21 years old of Pima Indian heritage. ADAP is an adaptive learning routine that generates and executes digital analogs of perceptron-like devices. It is a unique algorithm; see the paper for details."
#' 
#' @references Smith, J.W., Everhart, J.E., Dickson, W.C., Knowler, W.C., & Johannes, R.S. (1988). Using the ADAP learning algorithm to forecast the onset of diabetes mellitus. In Proceedings of the Symposium on Computer Applications and Medical Care (pp. 261--265). IEEE Computer Society Press.
#' 
#' @param file character; path/filename to write data file to
#' @param write logical; should the dataset be written to disk for later use? (default: TRUE)
#' @param read logical; should we try to read the dataset from the specified location first? (default: TRUE)
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Pima+Indians+Diabetes}
#' @export
createDiabetes<-function(file=getfilepath("diabetes.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/pima-indians-diabetes/pima-indians-diabetes.data")
    setnames(data,colnames(data),c("TimesPregnant","Glucose","DiastolicBloodPressure","Skinfold","Insulin","BMI","Pedigree","Age","Diabetes"))
    data$DiastolicBloodPressure[data$DiastolicBloodPressure==0]<-NA
    data$Glucose[data$Glucose==0]<-NA
    data$Skinfold[data$Skinfold==0]<-NA
    data$BMI[data$BMI==0]<-NA
    # Are insulin levels of 0 possible? Insulin is somewhat suspicious
    data$Diabetes<-factor(data$Diabetes,0:1,c("Negative","Positive"))
      
      # Write generated data object to disk
      if (write) {
        saveRDS(data, file=file)
      }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
