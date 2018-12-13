#' Germination Count Data
#'
#' An example germination count dataset. It includes germination count data over
#' 14 days from five genotypes (G1 to G5) in three replications
#'
#' @format A data frame with 17 columns: \describe{ \item{Genotype}{The
#'   genotype.} \item{Rep}{Replication.} \item{Day1 to Day14}{Number of seeds
#'   that germinated (germination counts) on a particular day.} \item{Total
#'   Seeds}{Total number of seeds tested.} }
#'
#' @examples
#'
#' data(gcdata)
#'
#' counts.per.intervals <- c("Day1", "Day2", "Day3", "Day4", "Day5",
#'                           "Day6", "Day7", "Day8", "Day9", "Day10", "Day11",
#'                           "Day12", "Day13", "Day14")
#' germination.indices(gcdata, total.seeds.col = "Total Seeds",
#'                     counts.intervals.cols = counts.per.intervals,
#'                     intervals = 1:14, partial = TRUE, max.int = 5)
#'
"gcdata"