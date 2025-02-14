% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/statistic-fgsea.R
\name{run_fgsea}
\alias{run_fgsea}
\title{Fast Gene Set Enrichment Analysis (FGSEA)}
\usage{
run_fgsea(
  mat,
  network,
  .source = .data$source,
  .target = .data$target,
  times = 100,
  nproc = 4,
  seed = 42,
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

\item{times}{How many permutations to do?}

\item{nproc}{Number of cores to use for computation.}

\item{seed}{A single value, interpreted as an integer, or NULL.}

\item{...}{
  Arguments passed on to \code{\link[fgsea:fgseaMultilevel]{fgsea::fgseaMultilevel}}
  \describe{
    \item{\code{sampleSize}}{The size of a random set of genes which in turn has size = pathwaySize}
    \item{\code{minSize}}{Minimal size of a gene set to test. All pathways below the threshold are excluded.}
    \item{\code{maxSize}}{Maximal size of a gene set to test. All pathways above the threshold are excluded.}
    \item{\code{eps}}{This parameter sets the boundary for calculating the p value.}
    \item{\code{scoreType}}{This parameter defines the GSEA score type. Possible options are ("std", "pos", "neg")}
    \item{\code{gseaParam}}{GSEA parameter value, all gene-level statis are raised to the power of `gseaParam`
before calculation of GSEA enrichment scores.}
    \item{\code{BPPARAM}}{Parallelization parameter used in bplapply.
Can be used to specify cluster to run. If not initialized explicitly or
by setting `nproc` default value `bpparam()` is used.}
    \item{\code{absEps}}{deprecated, use `eps` parameter instead}
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
Calculates regulatory activities using FGSEA.
}
\details{
This function is a wrapper for the method \code{fgsea::fgsea}.
}
\examples{
inputs_dir <- system.file("testdata", "inputs", package = "decoupleR")

mat <- readRDS(file.path(inputs_dir, "input-expr_matrix.rds"))
network <- readRDS(file.path(inputs_dir, "input-dorothea_genesets.rds"))

run_fgsea(mat, network, .source='tf', nproc=1)
}
\seealso{
Other decoupleR statistics: 
\code{\link{decouple}()},
\code{\link{run_aucell}()},
\code{\link{run_enrich}()},
\code{\link{run_gsva}()},
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
