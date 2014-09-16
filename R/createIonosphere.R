#' Create Ionosphere dataset
#' 
#' UCI description:
#' "This radar data was collected by a system in Goose Bay, Labrador. This system consists of a phased array of 16 high-frequency antennas with a total transmitted power on the order of 6.4 kilowatts. See the paper for more details. The targets were free electrons in the ionosphere. "Good" radar returns are those showing evidence of some type of structure in the ionosphere. "Bad" returns are those that do not; their signals pass through the ionosphere. "
#' "Received signals were processed using an autocorrelation function whose arguments are the time of a pulse and the pulse number. There were 17 pulse numbers for the Goose Bay system. Instances in this databse are described by 2 attributes per pulse number, corresponding to the complex values returned by the function resulting from the complex electromagnetic signal."
#' 
#' \emph{Task:} formula(Return~.)
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Ionosphere}
createIonosphere<-function(file="ionosphere.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data<-fread("http://archive.ics.uci.edu/ml/machine-learning-databases/ionosphere/ionosphere.data")
    setnames(data,colnames(data),c(paste0(rep(paste0("pulse",1:17),each=2),c("att1","att2")),"Return"))
    data$Return<-factor(data$Return,levels=c("b","g"),labels=c("Bad","Good"))
    data$pulse1att1 <- as.numeric(data$pulse1att1)
    data$pulse1att2 <- as.numeric(data$pulse1att2)
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
      data<-readRDS(file)
    }
  
  return(data)
}