#' Create Fertility Diagnosis dataset
#' 
#' 
#' From UCI: Data were extracted from images that were taken from genuine and forged banknote-like specimens. For digitization, an industrial camera usually used for print inspection was used. The final images have 400x 400 pixels. Due to the object lens and distance to the investigated object gray-scale pictures with a resolution of about 660 dpi were gained. Wavelet Transform tool were used to extract features from images.
#' 
#' Season in which the analysis was performed. 1) winter, 2) spring, 3) Summer, 4) fall. (-1, -0.33, 0.33, 1) 
#' Age at the time of analysis. 18-36 (0, 1) 
#' Childish diseases (ie , chicken pox, measles, mumps, polio)  1) yes, 2) no. (0, 1) 
#' Accident or serious trauma 1) yes, 2) no. (0, 1) 
#' Surgical intervention 1) yes, 2) no. (0, 1) 
#' High fevers in the last year 1) less than three months ago, 2) more than three months ago, 3) no. (-1, 0, 1) 
#' Frequency of alcohol consumption 1) several times a day, 2) every day, 3) several times a week, 4) once a week, 5) hardly ever or never (0, 1) 
#' Smoking habit 1) never, 2) occasional 3) daily. (-1, 0, 1) 
#' Number of hours spent sitting per day ene-16	(0, 1) 
#' Output: Diagnosis	normal (N), altered (O)	
#' 
#' Task:  formula(Diagnosis ~ .)
#' 
#' @references David Gil, Jose Luis Girela, Joaquin De Juan, M. Jose Gomez-Torres, and Magnus Johnsson. Predicting seminal quality with artificial intelligence methods. Expert Systems with Applications, 39(16), 2012
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Fertility}
#' @export
createFertility<-function(file="fertility.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- fread("http://archive.ics.uci.edu/ml/machine-learning-databases/00244/fertility_Diagnosis.txt")
    
    setnames(data,colnames(data),c("Season","Age","ChildishDiseases","Trauma","Surgery","RecentFever","AlcoholConsumption","Smoking","HoursSitting","Diagnosis"))
    
    data$Season <- factor(data$Season,levels=c(-1,-0.33,0.33,1),labels=c("Winter","Spring","Summer","Fall"))
    data$Age <- (data$Age*18)+18 #TODO Note: not so sure this gives the correct ages
    data$ChildishDiseases <- factor(data$ChildishDiseases,levels=0:1,labels=c("Yes","No")) #Note: may be switched
    data$Trauma <- factor(data$Trauma,levels=0:1,labels=c("Yes","No")) #Note: may be switched
    data$Surgery <- factor(data$Surgery,levels=0:1,labels=c("Yes","No")) #Note: may be switched
    data$Surgery <- factor(data$Surgery,levels=0:1,labels=c("Yes","No")) #Note: may be switched
    data$RecentFever <- factor(data$RecentFever,levels=-1:1,labels=c("<3 Months",">3 Months","No"))
    data$AlcoholConsumption<-ordered(data$AlcoholConsumption,levels=c(0.2,0.4,0.6,0.8,1),labels=c("SeveralDay","EveryDay","SeveralWeek","OnceWeek","Never"))
    data$Smoking<- ordered(data$Smoking,levels=-1:1,labels=c("Never","Occasional","Daily"))
    data$HoursSitting <- data$HoursSitting*15+1 #TODO: convert to hours?
    data$Diagnosis<-factor(data$Diagnosis)
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
