#' Census Income prediction (Adult) dataset
#' 
#' 
#' \emph{Task:} Classification: formula(Income~.-fnlwgt)
#' 
#' \emph{From UCI:} "Description of fnlwgt (final weight) The weights on the CPS files are controlled to independent estimates of thecivilian noninstitutional population of the US.  These are prepared monthlyfor us by Population Division here at the Census Bureau.  We use 3 sets ofcontrols.These are: 1.  A single cell estimate of the population 16+ for each state.2.  Controls for Hispanic Origin by age and sex. 3.  Controls by Race, age and sex.We use all three sets of controls in our weighting program and "rake" throughthem 6 times so that by the end we come back to all the controls we used.The term estimate refers to population totals derived from CPS by creating"weighted tallies" of any specified socio-economic characteristics of thepopulation.People with similar demographic characteristics should havesimilar weights.  There is one important caveat to rememberabout this statement.  That is that since the CPS sample isactually a collection of 51 state samples, each with its ownprobability of selection, the statement only applies withinstate."
#' 
#' @references Kohavi, Ron. "Scaling Up the Accuracy of Naive-Bayes Classifiers: A Decision-Tree Hybrid." KDD. 1996.
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Census+Income}
#' @export
createCensusIncome<-function(file=getfilepath("censusincome.rds"),write=TRUE,read=TRUE) {
  
  if (!read | !file.exists(file)) {
    data<-read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data", header=FALSE,na.strings = c("?"," ?"),stringsAsFactors = TRUE,strip.white=TRUE)
    data2<-read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.test", header=FALSE,na.strings = c("?"," ?"),stringsAsFactors = TRUE,strip.white=TRUE,skip=1)
    data<-data.table(rbind(data,data2))
    
    setnames(data,colnames(data),c("Age","Workclass","fnlwgt","Education","EductionNum","MaritalStatus","Occupation","Relationship","Race","Sex","CapitalGain","CapitalLoss","HoursPerWeek","NativeCountry","Income"))
    levels(data$Income)<-c("<=50K",">50K","<=50K",">50K")
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }

  return(data)
}
