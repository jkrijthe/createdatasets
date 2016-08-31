#' Create Accelerometer Activity Recognition dataset
#' 
#' From UCI: Uncalibrated Accelerometer Data are collected from 15 participantes performing 7 activities. The dataset provides challenges for identification and authentication of people using motion patterns. The dataset collects data from a wearable accelerometer mounted on the chest. Sampling frequency of the accelerometer: 52 Hz. Accelerometer Data are Uncalibrated. Number of Participants: 15. Number of Activities: 7 
#' 
#' Task:  formula(Activity ~ . -Sequence - Participant)
#' 
#' @references Casale, P. Pujol, O. and Radeva, P. 'Personalization and user verification in wearable systems using biometric walking patterns' Personal and Ubiquitous Computing, 16(5), 563-580, 2012 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/Activity+Recognition+from+Single+Chest-Mounted+Accelerometer}
#' @export
createAccelerometerActivity<-function(file=getfilepath("accelerometeractivity.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    tmp <- tempfile()
    data <- download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00287/Activity%20Recognition%20from%20Single%20Chest-Mounted%20Accelerometer.zip",tmp)
    data2<-rbindlist(lapply(1:15, function(i) {
      data.table(read.csv(unz(tmp, paste0("Activity Recognition from Single Chest-Mounted Accelerometer/",i,".csv")),sep=",",na.strings="unknown",header=FALSE,col.names=c("Sequence","x","y","z","Activity")),Participant=i)
    }))
    
    data<-bind_rows(lapply(1:15, function(i) {
      read_csv(unz(tmp, paste0("Activity Recognition from Single Chest-Mounted Accelerometer/",i,".csv")),na="unknown",col_names=c("Sequence","x","y","z","Activity")) %>% mutate(Participant=i)
    }))
                  
    data$Activity<-factor(data$Activity,levels=1:7,labels=c("Working at Computer"," Standing Up, Walking and Going updown stairs","Standing","Walking","Going UpDown Stairs","Walking and Talking with Someone", "Talking while Standing"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
