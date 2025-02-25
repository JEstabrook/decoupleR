% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/statistic-wsum.R
\name{run_wsum}
\alias{run_wsum}
\title{Weighted Sum (WSUM)}
\usage{
run_wsum(
  mat,
  network,
  .source = .data$source,
  .target = .data$target,
  .mor = .data$mor,
  .likelihood = .data$likelihood,
  times = 100,
  seed = 42,
  sparse = TRUE,
  randomize_type = "rows"
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

\item{.mor}{Column with edge mode of regulation (i.e. mor).}

\item{.likelihood}{Column with edge likelihood.}

\item{times}{How many permutations to do?}

\item{seed}{A single value, interpreted as an integer, or NULL for random
number generation.}

\item{sparse}{Should the matrices used for the calculation be sparse?}

\item{randomize_type}{How to randomize the expression matrix.}
}
\value{
A long format tibble of the enrichment scores for each source
across the samples. Resulting tibble contains the following columns:
\enumerate{
\item \code{statistic}: Indicates which method is associated with which score.
\item \code{source}: Source nodes of \code{network}.
\item \code{condition}: Condition representing each column of \code{mat}.
\item \code{score}: Regulatory activity (enrichment score).
\item \code{p_value}: p-value for the score of the method.
}
}
\description{
Calculates regulatory activities by computing the WSUM
}
\details{
Infers activity score for each regulator by weighting the molecular readouts
of its targets by their mode of regulations and likelihoods. In addition, it
runs permutations to calculate empirical p-values, providing normalized
(z-score) and corrected activity (estimate * -log10(p-value)) scores. This is
represented in the \code{statistic} column which will contain three values for
each call to \code{run_wsum()}; \strong{wsum}, \strong{norm_wsum} and \strong{corr_wsum}.
}
\examples{
inputs_dir <- system.file("testdata", "inputs", package = "decoupleR")

mat <- readRDS(file.path(inputs_dir, "input-expr_matrix.rds"))
network <- readRDS(file.path(inputs_dir, "input-dorothea_genesets.rds"))

run_wsum(mat, network, .source='tf')
}
\seealso{
Other decoupleR statistics: 
\code{\link{decouple}()},
\code{\link{run_aucell}()},
\code{\link{run_enrich}()},
\code{\link{run_fgsea}()},
\code{\link{run_gsva}()},
\code{\link{run_mdt}()},
\code{\link{run_mlm}()},
\code{\link{run_ora}()},
\code{\link{run_udt}()},
\code{\link{run_ulm}()},
\code{\link{run_viper}()},
\code{\link{run_wmean}()}
}
\concept{decoupleR statistics}
