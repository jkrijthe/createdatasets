#' Create benchmark datasets
#'
#' This package allows one to download (if neccesary) and preprocess benchmark datasets from the UCI machine learning repository and other sources for the use in evaluating classification and regression methods.These functions can be helpful in setting up simulation studies that can be easily reproduced by others.
#' 
#' @docType package
#' @importFrom readr read_csv
#' @import data.table
#' @importFrom dplyr %>% bind_rows mutate
#' @importFrom utils download.file download.file read.csv read.delim read.table untar
#' @importFrom stats rnorm runif
#' @importFrom MASS mvrnorm
#' @importFrom Matrix sparseMatrix
#' @importFrom R.matlab readMat
#' @importFrom foreign read.arff
#' @name createdatasets
NULL