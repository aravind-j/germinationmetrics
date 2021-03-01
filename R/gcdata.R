### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-21, ICAR-NBPGR.
#
# germinationmetrics is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# germinationmetrics is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# A copy of the GNU General Public License is available at
# https://www.r-project.org/Licenses/

#' Germination count data
#'
#' An example germination count dataset. It includes germination count data over
#' 14 days from five genotypes (G1 to G5) in three replications
#'
#' @format A data frame with 17 columns: \describe{ \item{Genotype}{The
#'   genotype.} \item{Rep}{Replication.} \item{Day01}{Number of seeds that
#'   germinated (germination counts) on Day 1.} \item{Day02}{Number of seeds
#'   that germinated (germination counts) on Day 2.} \item{Day03}{Number of
#'   seeds that germinated (germination counts) on Day 3.} \item{Day04}{Number
#'   of seeds that germinated (germination counts) on Day 4.}
#'   \item{Day05}{Number of seeds that germinated (germination counts) on Day
#'   5.} \item{Day06}{Number of seeds that germinated (germination counts) on
#'   Day 6.} \item{Day07}{Number of seeds that germinated (germination counts)
#'   on Day 7.} \item{Day08}{Number of seeds that germinated (germination
#'   counts) on Day 8.} \item{Day09}{Number of seeds that germinated
#'   (germination counts) on Day 9.} \item{Day10}{Number of seeds that
#'   germinated (germination counts) on Day 10.} \item{Day11}{Number of seeds
#'   that germinated (germination counts) on Day 11.} \item{Day12}{Number of
#'   seeds that germinated (germination counts) on Day 12.} \item{Day13}{Number
#'   of seeds that germinated (germination counts) on Day 13.}
#'   \item{Day14}{Number of seeds that germinated (germination counts) on Day
#'   14.} \item{Total Seeds}{Total number of seeds tested.} }
#'
#' @examples
#'
#' \donttest{
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
#' counts.per.intervals <- c("Day01", "Day02", "Day03", "Day04", "Day05",
#'                           "Day06", "Day07", "Day08", "Day09", "Day10",
#'                           "Day11", "Day12", "Day13", "Day14")
#' germination.indices(gcdata, total.seeds.col = "Total Seeds",
#'                     counts.intervals.cols = counts.per.intervals,
#'                     intervals = 1:14, partial = TRUE, max.int = 5)
#' }
#'
"gcdata"
