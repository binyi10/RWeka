\name{read.arff}
\alias{read.arff}
\alias{read.arff.R}
\title{Read Data from ARFF Files}
\description{
  Reads data from Weka Attribute-Relation File Format (\acronym{ARFF})
  files. 
}
\usage{
read.arff(file)
}
\arguments{
  \item{file}{a character string with the name of the \acronym{ARFF}
    file to read from, or a \code{\link{connection}} which will be
    opened if necessary, and if so closed at the end of the function
    call.}
}
\value{
  A data frame containing the data from the \acronym{ARFF} file.
}
\references{
  Attribute-Relation File Format
  \url{https://weka.wikispaces.com/ARFF}
}
\seealso{
  \code{\link{write.arff}}
}
\examples{
read.arff(system.file("arff", "contact-lenses.arff",
                      package = "RWeka"))
}
\keyword{file}
\keyword{connection}
