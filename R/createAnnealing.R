#' Create Steel Annealing dataset
#' 
#' 
#' \emph{Task:} First 798 training, last 100 testing. Classification formula(Class~.)
#' 
#' \emph{From UCI:} "Explanation: I suspect this was left by Ross Quinlan in 1987 at the 4th Machine Learning Workshop.  I'd have to check with Jeff Schlimmer to double check this."
#' 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Annealing}
#' 
#' @export
createAnnealing<-function(file=getfilepath("annealing.rds"),write=TRUE,read=TRUE) {

  if (!read | !file.exists(file)) {
    data<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/annealing/anneal.data",na.strings = "?",colClasses=list("factor"=39),stringsAsFactors = TRUE)
    data2<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/annealing/anneal.test",na.strings = "?",colClasses=list("factor"=39),stringsAsFactors = TRUE)
    data<-rbind(data,data2)
    
    charcols<-which(sapply(data,class)=="character")
    data[,(charcols):=lapply(.SD, as.factor),.SDcols=charcols]
    
    setnames(data,colnames(data),c("Family","ProductType","Steel","Carbon","Hardness","TemperRolling","Condition","Formability","Strength","NonAgeing","SurfaceFinish","SurfaceQuality","Enamelability","BC","BF","BT","BWME","BL","M","Chrom","Phos","Cbond","Marvi","Exptl","Ferro","Corr","BlueBrightVarnClean","Lustre","Jurofm","S","P","Shape","Thick","Width","Len","Oil","Bore","Packing","Class"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}

