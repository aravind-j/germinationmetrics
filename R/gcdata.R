#' Germination count data
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
#' library(ggplot2)
#' library(reshape2)
#'
#' # Plot partial germination counts over time
#' #----------------------------------------------------------------------------
#' # Convert wide-from to long-form
#' gcdatamelt <- melt(gcdata[, !names(gcdata) %in% c("Total Seeds")],
#'                    id.vars = c("Genotype", "Rep"))
#'
#' ggplot(gcdatamelt, aes(x = variable, y = value,
#'                        group = interaction(Genotype, Rep),
#'                        colour = Genotype)) +
#'   geom_point(alpha = 0.7) +
#'   geom_line(alpha = 0.7) +
#'   ylab("Germination count (Partial)") +
#'   xlab("Intervals") +
#'   theme_bw()
#'
#' # Plot partial germination counts over time
#' #----------------------------------------------------------------------------
#'
#' # Convert wide-from to long-form
#' # Compute cumulative germination counts
#' gcdata2 <- gcdata
#' gcdata2[, !names(gcdata2) %in% c("Genotype", "Rep", "Total Seeds")] <-
#'   t(apply(gcdata2[, !names(gcdata2) %in% c("Genotype", "Rep", "Total Seeds")], 1, cumsum))
#'
#'
#' gcdatamelt2 <- melt(gcdata2[, !names(gcdata2) %in% c("Total Seeds")],
#'                     id.vars = c("Genotype", "Rep"))
#'
#' ggplot(gcdatamelt2, aes(x = variable, y = value,
#'                         group = interaction(Genotype, Rep),
#'                         colour = Genotype)) +
#'   geom_point(alpha = 0.7) +
#'   geom_line(alpha = 0.7) +
#'   ylab("Germination count (Cumulative)") +
#'   xlab("Intervals") +
#'   theme_bw()
#'
#' # Compute germination indices
#' #----------------------------------------------------------------------------
#'
#' counts.per.intervals <- c("Day1", "Day2", "Day3", "Day4", "Day5",
#'                           "Day6", "Day7", "Day8", "Day9", "Day10", "Day11",
#'                           "Day12", "Day13", "Day14")
#' germination.indices(gcdata, total.seeds.col = "Total Seeds",
#'                     counts.intervals.cols = counts.per.intervals,
#'                     intervals = 1:14, partial = TRUE, max.int = 5)
#'
"gcdata"
