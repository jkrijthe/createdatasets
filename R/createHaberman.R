#' Create Haberman breast cancer survival dataset
#' 
#' Survival of patients who had undergone surgery for breast cancer
#' 
#' \emph{Task:} formula(Survival~.)
#' 
#' \emph{From UCI:} "The dataset contains cases from a study that was conducted between 1958 and 1970 at the University of Chicago's Billings Hospital on the survival of patients who had undergone surgery for breast cancer."
#' 
#' @references Haberman, S. J. (1976). Generalized Residuals for Log-Linear Models, Proceedings of the 9th International Biometrics Conference, Boston, pp. 104-122.
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Haberman's+Survival}
createHaberman<-function(file="haberman.rds",write=TRUE,read=TRUE) {
  if (!read | !file.exists(file)) {
    data<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/haberman/haberman.data")
    setnames(data,colnames(data),c("Age","YearOperation","AxillaryNodes","Survival"))
    data$Survival<-factor(data$Survival,levels=1:2,labels=c("Survived","Died"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}