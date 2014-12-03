#' Create Yeast Protein Localization dataset
#' 
#' Task: multiclass: formula(Class ~ . -Name)
#' 
#' 1.  Sequence Name: Accession number for the SWISS-PROT database
#' 2.  mcg: McGeoch's method for signal sequence recognition.
#'   3.  gvh: von Heijne's method for signal sequence recognition.
#' 4.  alm: Score of the ALOM membrane spanning region prediction program.
#' 5.  mit: Score of discriminant analysis of the amino acid content of
#' the N-terminal region (20 residues long) of mitochondrial and 
#' non-mitochondrial proteins.
#' 6.  erl: Presence of "HDEL" substring (thought to act as a signal for
#'                                        retention in the endoplasmic reticulum lumen). #' Binary attribute.
#' 7.  pox: Peroxisomal targeting signal in the C-terminus.
#' 8.  vac: Score of discriminant analysis of the amino acid content of
#' vacuolar and extracellular proteins.
#' 9.  nuc: Score of discriminant analysis of nuclear localization signals
#' of nuclear and non-nuclear proteins.
#' 
#' 
#' CYT (cytosolic or cytoskeletal)                    463
#' NUC (nuclear)                                      429
#' MIT (mitochondrial)                                244
#' ME3 (membrane protein, no N-terminal signal)       163
#' ME2 (membrane protein, uncleaved signal)            51
#' ME1 (membrane protein, cleaved signal)              44
#' EXC (extracellular)                                 37
#' VAC (vacuolar)                                      30
#' POX (peroxisomal)                                   20
#' ERL (endoplasmic reticulum lumen) 
#' 
#' @references "A Knowledge Base for Predicting Protein Localization Sites inEukaryotic Cells", Kenta Nakai & Minoru Kanehisa, Genomics 14:897-911, 1992. 
#' 
#' @inheritParams createDiabetes
#' @return The dataset as a \code{\link[data.table]{data.table}}
#' @seealso \url{https://archive.ics.uci.edu/ml/machine-learning-databases/yeast/}
#' @export
createYeast<-function(file=getfilepath("yeast.rds"),write=TRUE,read=TRUE) {
  # Check if the user forced the recreation of the datasets or whether the datafile is missing on disk
  if (!read | !file.exists(file)) {
    data <- data.table(read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/yeast/yeast.data"))
    
    setnames(data,colnames(data),c("Name","mcg","gvh","alm","mit","erl","pox","vac","nuc","Class"))
    
    data$Name<-as.character(data$Name)
    #TODO: discrepency in the number of instances beloning to the EXC class 
    
    if (write) {
      saveRDS(data, file=file)
    }
  } else {
    data<-readRDS(file)
  }
  
  return(data)
}
