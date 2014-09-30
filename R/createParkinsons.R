#' Create Parkinsons dataset
#' 
#' 
#' 
#' TODO: dataset contains 32 subjects, UCI claims 31
#' 
#' 
#' Note there is a grouping in this dataset!
#' \emph{Task:} formula(status~ . -subject -recording)
#' 
#' @references Max A. Little, Patrick E. McSharry, Eric J. Hunter, Lorraine O. Ramig (2008), 'Suitability of dysphonia measurements for telemonitoring of Parkinson's disease', IEEE Transactions on Biomedical Engineering (to appear).
#' 
#' @param file character; path/filename to write RData file to
#' @param write logical; should the dataset be written to disk? (default: FALSE)
#' @export
createParkinsons<-function(file="parkinsons.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/parkinsons/parkinsons.data")
    data$status<-factor(data$status,levels=0:1,labels=c("Healthy","Parkinsons"))
    data$subject<-sapply(data$name,function(x) {strsplit(x[[1]],"_")[[1]][3]})
    data$recording<-as.integer(sapply(data$name,function(x) {strsplit(x[[1]],"_")[[1]][4]}))
    data$name<-NULL
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}