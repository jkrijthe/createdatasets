cacheEnv <- new.env()

#' Set global data directory
#' @param directory directory path
#' @export
setdatadir <- function(directory) {
  assign("datadir", directory, envir=cacheEnv)
}

#' Get global data directory
#' @export
getdatadir <- function() {
  if (!exists("datadir", envir=cacheEnv)) {
    getwd()
  } else {
    get("datadir", envir=cacheEnv)
  }
}

#' Get full path by extending filename with the global data directory
#' @param filename Filename in the data directory
#' @export
getfilepath <- function(filename) {
  file.path(getdatadir(),filename)
}
