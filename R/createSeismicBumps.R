#' Create Seismic bump dataset
#' 
#' 
#' From UCI: "Mining activity was and is always connected with the occurrence of dangers which are commonly called mining hazards. A special case of such threat is a seismic hazard which frequently occurs in many underground mines. Seismic hazard is the hardest detectable and predictable of natural hazards and in this respect it is comparable to an earthquake. More and more advanced seismic and seismoacoustic monitoring systems allow a better understanding rock mass processes and definition of seismic hazard prediction methods. Accuracy of so far created methods is however far from perfect. Complexity of seismic processes and big disproportion between the number of low-energy seismic events and the number of high-energy phenomena (e.g. > 10^4J) causes the statistical techniques to be insufficient to predict seismic hazard. Therefore, it is essential to search for new opportunities of better hazard prediction, also using machine learning methods. In seismic hazard assessment data clustering techniques can be applied (Lesniak A., Isakow Z.: Space-time clustering of seismic events and hazard assessment in the Zabrze-Bielszowice coal mine, Poland. Int. Journal of Rock Mechanics and Mining Sciences, 46(5), 2009, 918-928), and for prediction of seismic tremors artificial neural networks are used (Kabiesz, J.: Effect of the form of data on the quality of mine tremors hazard forecasting using neural networks. Geotechnical and Geological Engineering, 24(5), 2005, 1131-1147). In the majority of applications, the results obtained by mentioned methods are reported in the form of two states which are interpreted as 'hazardous' and 'non-hazardous'. Unbalanced distribution of positive ('hazardous state') and negative ('non-hazardous state') examples is a serious problem in seismic hazard prediction. Currently used methods are still insufficient to achieve good sensitivity and specificity of predictions. In the paper (Bukowska M.: The probability of rockburst occurrence in the Upper Silesian Coal Basin area dependent on natural mining conditions. Journal of Mining Sciences, 42(6), 2006, 570-577) a number of factors having an effect on seismic hazard occurrence was proposed, among other factors, the occurrence of tremors with energy > 10^4J was listed. The task of seismic prediction can be defined in different ways, but the main aim of all seismic hazard assessment methods is to predict (with given precision relating to time and date) of increased seismic activity which can cause a rockburst. In the data set each row contains a summary statement about seismic activity in the rock mass within one shift (8 hours). If decision attribute has the value 1, then in the next shift any seismic bump with an energy higher than 10^4 J was registered. That task of hazards prediction bases on the relationship between the energy of recorded tremors and seismoacoustic activity with the possibility of rockburst occurrence. Hence, such hazard prognosis is not connected with accurate rockburst prediction. Moreover, with the information about the possibility of hazardous situation occurrence, an appropriate supervision service can reduce a risk of rockburst (e.g. by distressing shooting) or withdraw workers from the threatened area. Good prediction of increased seismic activity is therefore a matter of great practical importance. The presented data set is characterized by unbalanced distribution of positive and negative examples. In the data set there are only 170 positive examples representing class 1. "
#' 
#' Task:  formula(class ~ .)
#' 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/seismic-bumps}
#' @export
createSeismicBumps<-function(file="seismicbumps.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    require(foreign)
    data<-read.arff(url("http://archive.ics.uci.edu/ml/machine-learning-databases/00266/seismic-bumps.arff"))
    
    data<-data.table(data)
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
