\name{refineqtlM}
\alias{refineqtlM}
\title{Refine the positions of QTL for function valued trait}
\usage{
refineqtlM(cross, Y, qtl, formula, verbose = TRUE, maxit = 10,
  incl.markers = TRUE, keeplodprofile = TRUE, method = c("hk", "f", "sl",
  "ml"), pheno.cols)
}
\arguments{
  \item{cross}{An object of class \code{"cross"}. See
  \code{\link[qtl]{read.cross}} for details.}

  \item{Y}{Matrix of phenotypes}

  \item{qtl}{A QTL object, as produced by
  \code{\link[qtl]{makeqtl}}, containing the positions of
  the QTL.}

  \item{formula}{An object of class \code{"formula"}
  indicating the model to be fitted.  (It can also be the
  character string representation of a formula.) QTLs are
  indicated as 'Q1', 'Q2', etc.  Covariates are indicated
  by their names in \code{covar}.}

  \item{verbose}{If TRUE, give feedback about progress.  If
  \code{verbose} is an integer > 1, further messages from
  \code{\link[qtl]{scanqtl}} are also displayed.}

  \item{maxit}{Maximum number of iterations.}

  \item{incl.markers}{If FALSE, do calculations only at
  points on an evenly spaced grid.}

  \item{keeplodprofile}{If TRUE, keep the LOD profiles from
  the last iteration as attributes to the output.}

  \item{method}{Indicates whether to use \code{"hk"},
  \code{"f"}, \code{"sl"}, \code{"ml"} criteria}

  \item{pheno.cols}{Columns in the phenotype matrix to be
  used as the phenotype.}
}
\value{
An object of class \code{"qtl"}, with QTL placed in their
new positions.
}
\description{
Extended version of the R/qtl function
\code{\link[qtl]{refineqtl}} for function-valued traits.
Iteratively scan the positions for QTL in the context of a
multiple QTL model, to try to identify the positions that
maximize \code{"hk"} and \code{"f"} criteria, for a fixed
QTL model.
}
\details{
This is an extended version of 'refineqtl' of 'qtl'
package. For a multiple qtl model, this refines each qtl
position to move for a better position that fits "hk" or
"f" criteria given other qtl positions fixed. Do this
process iteratively to find a refined version of multiple
QTL.
}
\examples{
cat("An example needs to be added.\\n")
}
\author{
Il-Youp Kwak, <email: ikwak2@stat.wisc.edu>
}
\seealso{
\code{\link[qtl]{refineqtl}}, \code{\link{refineqtlM}}
}

