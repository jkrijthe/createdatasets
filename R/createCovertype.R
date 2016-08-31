#' Create Covertype dataset
#'
#'  From UCI: Predicting forest cover type from cartographic variables only (no remotely sensed data).  The actual forest cover type for a given observation (30 x 30 meter cell) was determined from US Forest Service (USFS) Region 2 Resource Information System  (RIS) data.  Independent variables were derived from data originally obtained from US Geological Survey (USGS) and USFS data.  Data is in raw form (not scaled)
#'  Task:
#'  formula(Cover_Type ~ .)
#'
#'
#' @references Blackard, Jock A. and Denis J. Dean.  2000.  "Comparative Accuracies of Artificial Neural Networks and Discriminant Analysis in Predicting Forest Cover Types from Cartographic Variables."  Computers and Electronics in Agriculture 24(3):131-151.
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Covertype}
#' @export
createCovertype <- function(file=getfilepath("covertype.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    tmp<-tempfile()
    download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/covtype/covtype.data.gz",tmp)
    data <- data.table(read.csv(gzfile(tmp)))
    
    data[,"Wilderness_Area":=apply(data[,11:14,with=FALSE],1,which.max)]
    data[,11:14:=NULL]
    data[,"Soil_Type":=apply(data[,11:50,with=FALSE],1,which.max)]
    data[,11:50:=NULL]
    setnames(data,colnames(data)[1:11],c("Elevation","Aspect","Slope","Horizontal_Distance_To_Hydrology","Vertical_Distance_To_Hydrology","Horizontal_Distance_To_Roadways","Hillshade_9am","Hillshade_Noon","Hillshade_3pm","Horizontal_Distance_To_Fire_Points","Cover_Type"))
    data$Wilderness_Area<-factor(data$Wilderness_Area,levels=1:4,labels=c("Rawah Wilderness Area","Neota Wilderness Area","Comanche Peak Wilderness Area","Cache la Poudre Wilderness Area"))
    data$Soil_Type<-factor(data$Soil_Type)
    data$Cover_Type<-factor(data$Cover_Type,levels=1:7,labels=c("Spruce/Fir","Lodgepole Pine","Ponderosa Pine","Cottonwood/Willow","Aspen","Douglas-fir","Krummholz"))
    
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data) 
}
