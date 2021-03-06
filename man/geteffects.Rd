\name{geteffects}
\alias{geteffects}
\title{Estimate QTL effects}
\usage{
geteffects(cross, pheno.cols)
}
\arguments{
  \item{cross}{An object of class 'cross'. See 'read.cross'
  for details.}

  \item{pheno.cols}{phenotype columns to be used}
}
\value{
A matrix of coefficients. (i,j)th item is a coefficient of
jth position as a qtl of ith observation.
}
\description{
Estimate QTL effect at each genomic position for each of
multiple phenotypes.
}
\examples{
data(simspal)
simspal <- calc.genoprob(simspal)
phe <- 1:nphe(simspal)
\dontshow{phe <- seq(1, nphe(simspal), by=60)}
eff <- geteffects(simspal, pheno.cols=phe)
}
\author{
Karl W Broman, Il-Youp Kwak, <email: ikwak2@stat.wisc.edu>
}
\seealso{
\code{\link{plotlod}}
}
\keyword{models}

