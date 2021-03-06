% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/createAnnealing.R
\name{createAnnealing}
\alias{createAnnealing}
\title{Create Steel Annealing dataset}
\usage{
createAnnealing(file = getfilepath("annealing.rds"), write = TRUE,
  read = TRUE)
}
\arguments{
\item{file}{character; path/filename to write data file to}

\item{write}{logical; should the dataset be written to disk for later use? (default: TRUE)}

\item{read}{logical; should we try to read the dataset from the specified location first? (default: TRUE)}
}
\value{
The dataset as a \code{\link[data.table]{data.table}}
}
\description{
\emph{Task:} First 798 training, last 100 testing. Classification formula(Class~.)
}
\details{
\emph{From UCI:} "Explanation: I suspect this was left by Ross Quinlan in 1987 at the 4th Machine Learning Workshop.  I'd have to check with Jeff Schlimmer to double check this."
}
\seealso{
\url{https://archive.ics.uci.edu/ml/datasets/Annealing}
}

