% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/createUSPS.R
\name{createUSPS}
\alias{createUSPS}
\title{Create USPS dataset from the SSL benchmarks}
\usage{
createUSPS(file = getfilepath("USPS.rds"), write = TRUE, read = TRUE)
}
\arguments{
\item{file}{character; path/filename to write data file to}

\item{write}{logical; should the dataset be written to disk for later use? (default: TRUE)}

\item{read}{logical; should we try to read the dataset from the specified location first? (default: TRUE)}
}
\description{
Task:
 formula(Class ~ .)
}
\details{
Cite: Chapelle
}

