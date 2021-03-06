\name{stepwiseqtlF}
\alias{stepwiseqtlF}
\title{Stepwise selection for multiple QTL in function valued trait data}
\usage{
stepwiseqtlF(cross, chr, pheno.cols, qtl, usec = c("slod", "mlod"), formula,
  max.qtl = 10, covar = NULL, method = c("hk", "imp"),
  incl.markers = TRUE, refine.locations = TRUE, additive.only = TRUE,
  penalties, keeptrace = FALSE, verbose = TRUE)
}
\arguments{
  \item{cross}{An object of class \code{"cross"}. See
  \code{\link[qtl]{read.cross}} for details.}

  \item{chr}{Optional vector indicating the chromosomes to
  consider in search for QTL.  This should be a vector of
  character strings referring to chromosomes by name;
  numeric values are converted to strings.  Refer to
  chromosomes with a preceding \code{"-"} to have all
  chromosomes but those considered.  A logical (TRUE/FALSE)
  vector may also be used.}

  \item{pheno.cols}{Columns in the phenotype matrix to be
  used as the phenotype.}

  \item{usec}{Which method to use (\code{"slod"} or
  \code{"mlod"})}

  \item{qtl}{Optional QTL object (of class \code{"qtl"}, as
  created by \code{\link[qtl]{makeqtl}}) to use as a
  starting point.}

  \item{formula}{Optional formula to define the QTL model
  to be used as a starting point.}

  \item{max.qtl}{Maximum number of QTL to which forward
  selection should proceed.}

  \item{covar}{Data frame of additive covariates.}

  \item{method}{Indicates whether to use multiple
  imputation or Haley-Knott regression.}

  \item{incl.markers}{If FALSE, do calculations only at
  points on an evenly spaced grid.}

  \item{refine.locations}{If TRUE, use
  \code{\link{refineqtlF}} to refine the QTL locations
  after each step of forward and backward selection.}

  \item{additive.only}{If TRUE, allow only additive QTL
  models; if FALSE, consider also pairwise interactions
  among QTL.}

  \item{penalties}{Vector of three values indicating the
  penalty on main effects and heavy and light penalties on
  interactions.  See the Details below. If missing, default
  values are used that are based on simulations of
  backcrosses and intercrosses with genomes modeled after
  that of the mouse.}

  \item{keeptrace}{If TRUE, keep information on the
  sequence of models visited through the course of forward
  and backward selection as an attribute to the output.}

  \item{verbose}{If TRUE, give feedback about progress.  If
  \code{verbose} is an integer > 1, even more information
  is printed.}
}
\value{
The output is a representation of the best model, as
measured by the penalized LOD score (see Details), among
all models visited.  This is QTL object (of class
\code{"qtl"}, as produced by \code{\link[qtl]{makeqtl}}),
with attributes \code{"formula"}, indicating the model
formula, and \code{"pLOD"} indicating the penalized LOD
score.

If \code{keeptrace=TRUE}, the output will contain an
attribute \code{"trace"} containing information on the best
model at each step of forward and backward elimination.
This is a list of objects of class \code{"compactqtl"},
which is similar to a QTL object (as produced by
\code{\link[qtl]{makeqtl}}) but containing just a vector of
chromosome IDs and positions for the QTL.  Each will also
have attributes \code{"formula"} (containing the model
formula) and \code{"pLOD"} (containing the penalized LOD
score.
}
\description{
Extension of the R/qtl function
\code{\link[qtl]{stepwiseqtl}}. Performs forward/backward
selection to identify a multiple QTL model for function
valued trait data, with model choice made via a penalized
LOD score, with separate penalties on main effects and
interactions.
}
\examples{
data(simspal)
\dontshow{simspal <- subset(simspal,chr=c(1,3,4), ind=1:50)}
# Genotype probabilities for H-K
simspal <- calc.genoprob(simspal, step=0)
phe <- 1:nphe(simspal)
\dontshow{phe <- 80:82}
qtlslod <- stepwiseqtlF(simspal, pheno.cols = phe, max.qtl = 4, usec = "slod",
                        method = "hk", penalties = c(2.36, 2.76, 2) )
}
\author{
Il-Youp Kwak, <email: ikwak2@stat.wisc.edu>
}
\references{
Manichaikul, A., Moon, J. Y., Sen, S, Yandell, B. S. and
Broman, K. W. (2009) A model selection approach for the
identification of quantitative trait loci in experimental
crosses, allowing epistasis. _Genetics_, *181*, 1077-1086.

Broman, K. W. and Speed, T. P. (2002) A model selection
approach for the identification of quantitative trait loci
in experimental crosses (with discussion). _J Roy Stat Soc
B_ *64*, 641-656, 731-775.

Haley, C. S. and Knott, S. A. (1992) A simple regression
method for mapping quantitative trait loci in line crosses
using flanking markers.  _Heredity_ *69*, 315-324.

Zeng, Z.-B., Kao, C.-H. and Basten, C. J. (1999) Estimating
the genetic architecture of quantitative traits.
_Genetical Research_, *74*, 279-289.
}
\seealso{
\code{\link{refineqtlF}}, \code{\link{addqtlF}}
}

