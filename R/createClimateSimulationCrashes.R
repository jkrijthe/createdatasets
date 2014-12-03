#' Create Climate Model Failure dataset
#' 
#' 
#' From UCI: "This dataset contains records of simulation crashes encountered during climate model uncertainty quantification (UQ) ensembles.Ensemble members were constructed using a Latin hypercube method in LLNL's UQ Pipeline software system to sample the uncertainties of 18 model parameters within the Parallel Ocean Program (POP2) component of the Community Climate System Model (CCSM4). Three separate Latin hypercube ensembles were conducted, each containing 180 ensemble members. 46 out of the 540 simulations failed for numerical reasons at combinations of parameter values. The goal is to use classification to predict simulation outcomes (fail or succeed) from input parameter values, and to use sensitivity analysis and feature selection to determine the causes of simulation crashes. Further details about the data and methods are given in the publication 'Failure Analysis of Parameter-Induced Simulation Crashes in Climate Models,' Geoscientific Model Development"
#' 
#' Task:  formula(outcome ~ . -Study -Run)
#' 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Climate+Model+Simulation+Crashes}
#' @export
createClimateSimulationCrashes<-function(file=getfilepath("climatesimulationcrashes.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data<-read.table(url("http://archive.ics.uci.edu/ml/machine-learning-databases/00252/pop_failures.dat"),header=TRUE)
    
    data$Study <- factor(data$Study)
    data$Run <- factor(data$Run)
    data$outcome <- factor(data$outcome)
    
    data<-data.table(data)
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
