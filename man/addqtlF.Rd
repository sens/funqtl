\name{addqtlF}
\alias{addqtlF}
\title{Search for Multiple QTL model}
\usage{
addqtlF(cross, pheno.cols, ...)
}
\arguments{
  \item{cross}{An object of class \code{"cross"}. See
  \code{\link[qtl]{read.cross}} for details.}

  \item{pheno.cols}{Columns in the phenotype matrix to be
  used as the phenotype.}

  \item{\dots}{Passed to the R/qtl function
  \code{\link[qtl]{addqtl}}.}
}
\value{
An object of class \code{"scanone"}, as produced by the
R/qtl function \code{\link[qtl]{scanone}}. LOD scores are
relative to the base model (with any terms that include the
new QTL omitted).
}
\description{
Scan for an additional QTL for function valued trait data
set. Modified version of addqtl function in qtl package.
}
\examples{
data(simspal)
\dontshow{simspal <- subset(simspal, chr=c(1,4), ind=1:50)}

qtl1 <- makeqtl(simspal, chr = 4, 27.8, what="prob")

phe <- 1:nphe(simspal)
\dontshow{phe <- seq(1, nphe(simspal), by=60)}
added <- addqtlF(simspal, qtl =  qtl1, pheno.cols =phe, method="hk")
max(added)
plot(added)
}
\author{
Il-Youp Kwak, <email: ikwak2@stat.wisc.edu>
}
\references{
Haley, C. S. and Knott, S. A. (1992) A simple regression
method for mapping quantitative trait loci in line crosses
using flanking markers. _Heredity_ *69*, 315-324.
}
\seealso{
\code{\link[qtl]{addqtl}}, \code{\link[qtl]{scanone}},
\code{\link{scanoneF}}, \code{\link[qtl]{makeqtl}}
}
\keyword{models}

