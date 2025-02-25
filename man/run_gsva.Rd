% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/statistic-gsva.R
\name{run_gsva}
\alias{run_gsva}
\title{Gene Set Variation Analysis (GSVA)}
\usage{
run_gsva(
  mat,
  network,
  .source = .data$source,
  .target = .data$target,
  verbose = FALSE,
  method = "gsva",
  ...
)
}
\arguments{
\item{mat}{Matrix to evaluate (e.g. expression matrix).
Target nodes in rows and conditions in columns.
\code{rownames(mat)} must have at least one intersection with the elements
in \code{network} \code{.target} column.}

\item{network}{Tibble or dataframe with edges and it's associated metadata.}

\item{.source}{Column with source nodes.}

\item{.target}{Column with target nodes.}

\item{verbose}{Gives information about each calculation step. Default: FALSE.}

\item{method}{Method to employ in the estimation of gene-set enrichment.
scores per sample. By default this is set to gsva (Hänzelmann et al, 2013).}

\item{...}{
  Arguments passed on to \code{\link[GSVA:gsva]{GSVA::gsva}}
  \describe{
    \item{\code{}}{}
  }}
}
\value{
A long format tibble of the enrichment scores for each source
across the samples. Resulting tibble contains the following columns:
\enumerate{
\item \code{statistic}: Indicates which method is associated with which score.
\item \code{source}: Source nodes of \code{network}.
\item \code{condition}: Condition representing each column of \code{mat}.
\item \code{score}: Regulatory activity (enrichment score).
}
}
\description{
Calculates regulatory activities using GSVA.
}
\details{
This function is a wrapper for the method \code{\link[GSVA:gsva]{GSVA::gsva()}}.
}
\examples{
inputs_dir <- system.file("testdata", "inputs", package = "decoupleR")

mat <- readRDS(file.path(inputs_dir, "input-expr_matrix.rds"))
network <- readRDS(file.path(inputs_dir, "input-dorothea_genesets.rds"))

run_gsva(mat, network, .source='tf', verbose = FALSE)
}
\seealso{
Other decoupleR statistics: 
\code{\link{decouple}()},
\code{\link{run_aucell}()},
\code{\link{run_enrich}()},
\code{\link{run_fgsea}()},
\code{\link{run_mdt}()},
\code{\link{run_mlm}()},
\code{\link{run_ora}()},
\code{\link{run_udt}()},
\code{\link{run_ulm}()},
\code{\link{run_viper}()},
\code{\link{run_wmean}()},
\code{\link{run_wsum}()}
}
\concept{decoupleR statistics}
