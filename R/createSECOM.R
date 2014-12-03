#' Create SECOM dataset
#' 
#' From UCI: " A complex modern semi-conductor manufacturing process is normally under consistent surveillance via the monitoring of signals/variables collected from sensors and or process measurement points. However, not all of these signals are equally valuable in a specific monitoring system. The measured signals contain a combination of useful information, irrelevant information as well as noise. It is often the case that useful information is buried in the latter two. Engineers typically have a much larger number of signals than are actually required. If we consider each type of signal as a feature, then feature selection may be applied to identify the most relevant signals. The Process Engineers may then use these signals to determine key factors contributing to yield excursions downstream in the process. This will enable an increase in process throughput, decreased time to learning and reduce the per unit production costs.
#'
#' Key facts: Data Structure: The data consists of 2 files the dataset file SECOM consisting of 1567 examples each with 591 features a 1567 x 591 matrix and a labels file containing the classifications and date time stamp for each example. As with any real life data situations this data contains null values varying in intensity depending on the individuals features. This needs to be taken into consideration when investigating the data either through pre-processing or within the technique applied."
#' 
#' End goal is feature selection. Note that there might be constant features in the dataset. Task:  formula(Class ~ .)
#' 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/SECOM}
#' @export
createSECOM<-function(file="SECOM.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    require(foreign)
    data<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/secom/secom.data",na.strings = c(NaN,"NaN"),sep=" ",header=FALSE)
    
    # Convert NaN to NA (this only works because all columns are numeric)
    data<-data.table(data.frame(lapply(data,function(col){is.na(col)<-is.nan(col); col})))
    
    warning("We might be missing 1 column for this dataset")
    
    data$Class<-as.factor(fread("http://archive.ics.uci.edu/ml/machine-learning-databases/secom/secom_labels.data",sep=" ",header=FALSE)$V1)
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
