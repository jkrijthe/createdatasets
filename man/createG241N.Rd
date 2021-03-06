% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/createG241N.R
\name{createG241N}
\alias{createG241N}
\title{Create G241C dataset from the SSL benchmarks}
\usage{
createG241N(file = getfilepath("g241n.rds"), write = TRUE, read = TRUE)
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
\seealso{
\url{http://olivier.chapelle.cc/ssl-book/benchmarks.html}
}

