cacheEnv <- new.env()

#' Set global data directory
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
#' @export
getfilepath <- function(filename) {
  file.path(getdatadir(),filename)
}
