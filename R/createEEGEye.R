#' Create EEG Eye State dataset
#' 
#' From UCI: All data is from one continuous EEG measurement with the Emotiv EEG Neuroheadset. The duration of the measurement was 117 seconds. The eye state was detected via a camera during the EEG measurement and added later manually to the file after analysing the video frames. '1' indicates the eye-closed and '0' the eye-open state. All values are in chronological order with the first measured value at the top of the data.
#' 
#' Task: formula(eyeDetection ~ .)
#' 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/datasets/EEG+Eye+State}
#' @export
createEEGEye<-function(file="eegeye.rds",write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    require(foreign)
    data <- data.table(read.arff("http://archive.ics.uci.edu/ml/machine-learning-databases/00264/EEG%20Eye%20State.arff"))
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
