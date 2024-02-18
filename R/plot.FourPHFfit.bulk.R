### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-2023, ICAR-NBPGR.
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

#' Plot the multiple four-parameter hill function fitted cumulative germination
#' curves from a \code{FourPHFfit.bulk} object
#'
#' \code{plot.FourPHFfit} plots multiple four-parameter hill function fitted
#' cumulative germination curves (FPHF curves) or  the rate of germination
#' curves (RoG curves) from a \code{FourPHFfit.bulk} object as an object of
#' class \code{ggplot}. Further, either one of the parameters such as time
#' required for 50\% of total seeds to germinate
#' (\mjseqn{\textrm{t}_{\textrm{50}_\textrm{Total}}}), time required for 50\% of
#' viable/germinated seeds to germinate
#' (\mjseqn{\textrm{t}_{\textrm{50}_\textrm{Germ}}}), Time at Maximum
#' Germination Rate (TMGR), Mean Germination Time (MGT), or uniformity value
#' (\mjseqn{\textrm{U}_{\textrm{t}_{\textrm{max}}-\textrm{t}_{\textrm{min}}}})
#' can also be annotated in the plot as specified in the \code{annotate}
#' argument. \loadmathjax
#'
#' @param x An data frame object of class \code{FourPHFfit.bulk} obtained as
#'   output from the \code{\link[germinationmetrics]{FourPHFfit.bulk}} function.
#' @param rog If \code{TRUE}, plots the Rate of Germination curves (RoG) instead
#'   of the Four-Parameter Hill Function fitted cumulative germination curves
#'   (FPHF). Default is \code{FALSE}.
#' @param annotate The parameter to be annotated in the plot. Either
#'   \code{"t50.total"} (\mjseqn{\textrm{t}_{\textrm{50}_\textrm{Total}}}),
#'   \code{"t50.germ"} (\mjseqn{\textrm{t}_{\textrm{50}_\textrm{Germ}}}),
#'   \code{"tmgr"} (TMGR), \code{"mgt"} (MGT), or \code{"uniformity"}
#'   (\mjseqn{\textrm{U}_{\textrm{t}_{\textrm{max}}-\textrm{t}_{\textrm{min}}}}).
#'    All the parameters are annotated as vertical lines, except for
#'   (\mjseqn{\textrm{U}_{\textrm{t}_{\textrm{max}}-\textrm{t}_{\textrm{min}}}}),
#'    which is annotated as horizontal lines.
#' @param limits logical. If \code{TRUE}, set the limits of y axis (germination
#'   percentage) between 0 and 100 in the germination curve plot. If
#'   \code{FALSE}, limits are set according to the data. Default is \code{TRUE}.
#' @param group.col The names of the column in data frame \code{x} according to
#'   which grouping has to be done.
#' @param show.points logical. If \code{TRUE}, shows the original data points
#'   (only for the FPHF curve). Default is \code{TRUE}.
#' @param \dots Default plot arguments.
#'
#' @return The plot of the cumulative germination curve as an object of class
#'   \code{ggplot}.
#'
#' @seealso \code{\link[germinationmetrics]{FourPHFfit.bulk}}
#'
#' @import ggplot2
#' @importFrom plyr mutate
#' @importFrom plyr round_any
#' @method plot FourPHFfit.bulk
#' @export
#'
#' @examples
#' \donttest{
#' data(gcdata)
#'
#' counts.per.intervals <- c("Day01", "Day02", "Day03", "Day04", "Day05",
#'                           "Day06", "Day07", "Day08", "Day09", "Day10",
#'                           "Day11", "Day12", "Day13", "Day14")
#'
#' fits <- FourPHFfit.bulk(gcdata, total.seeds.col = "Total Seeds",
#'                     counts.intervals.cols = counts.per.intervals,
#'                     intervals = 1:14, partial = TRUE,
#'                     fix.y0 = TRUE, fix.a = TRUE, xp = c(10, 60),
#'                     tmax = 20, tries = 3, umax = 90, umin = 10)
#'
#' # Plot FPHF curves
#' plot(fits, group.col = "Genotype")
#'
#' # Plot ROG curves
#' plot(fits, rog = TRUE, group.col = "Genotype")
#'
#' # Plot FPHF curves with points
#' plot(fits, group.col = "Genotype", show.points = TRUE)
#'
#' # Plot FPHF curves with annotations
#' plot(fits, group.col = "Genotype", annotate = "t50.total")
#' plot(fits, group.col = "Genotype", annotate = "t50.germ")
#' plot(fits, group.col = "Genotype", annotate = "tmgr")
#' plot(fits, group.col = "Genotype", annotate = "mgt")
#' plot(fits, group.col = "Genotype", annotate = "uniformity")
#'
#' # Plot ROG curves with annotations
#' plot(fits, rog = TRUE, group.col = "Genotype", annotate = "t50.total")
#' plot(fits, rog = TRUE, group.col = "Genotype", annotate = "t50.germ")
#' plot(fits, rog = TRUE, group.col = "Genotype", annotate = "tmgr")
#' plot(fits, rog = TRUE, group.col = "Genotype", annotate = "mgt")
#' plot(fits, rog = TRUE, group.col = "Genotype", annotate = "uniformity")
#'
#'
#'
#' # Change colour of curves using ggplot2 options
#' library(ggplot2)
#' curvesplot <- plot(fits, group.col = "Genotype")
#'
#' # 'Dark2' palette from RColorBrewer
#' curvesplot + scale_colour_brewer(palette = "Dark2")
#'
#' # Manual colours
#' curvesplot +
#'   scale_colour_manual(values = c("Coral", "Brown", "Blue",
#'                                  "Aquamarine", "Red"))
#' }
#'

plot.FourPHFfit.bulk <- function(x, rog = FALSE,
                                 annotate = c("none", "t50.total", "t50.germ",
                                              "tmgr", "mgt", "uniformity"),
                                 limits = TRUE, group.col,
                                 show.points = FALSE, ...){

  if (is.null(annotate)) {
    annotate == "none"
  }

  # checks
  annotate <- match.arg(annotate)

  # Check if group.col column present in x
  if (!(group.col %in% colnames(x))) {
    stop(paste('Column ', group.col,
               ' specified as the grouping column is not present in "x".',
               sep = ""))
  }

  if (annotate == "mgt") {
    acol <- "MGT"
  }
  if (annotate == "t50.total") {
    acol <- "t50.total"
  }
  if (annotate == "t50.germ") {
    acol <- "t50.Germinated"
  }
  if (annotate == "tmgr") {
    acol <- "TMGR"
  }
  if (annotate == "uniformity") {
    acol <- colnames(x)[grepl("Uniformity_", colnames(x))]
  }

  partial <- attributes(x)$arguments$partial
  intervals <- attributes(x)$arguments$intervals
  total.seeds.col <- attributes(x)$arguments$total.seeds.col
  counts.intervals.cols <- attributes(x)$arguments$counts.intervals.cols


  if (partial) {
    maxg <- max(rowSums(x[, counts.intervals.cols]))
  } else {
    maxg <- max(apply((x[, counts.intervals.cols]), 1, max))
  }

  # labels and unifromity positions
  if (limits == TRUE) {
    ypos <-  90
    ypos2 <-  80
  } else {
    ypos <-  plyr::round_any(maxg, 10, floor)
    ypos2 <- plyr::round_any(maxg, 10, floor)
  }

  # # Merge grouping columns
  # if (length(group.col) > 1) {
  #   x[, group.col] <- apply(x[, group.col, drop = F], MARGIN = 1,
  #                     FUN = function(i) paste(i, collapse = ""))
  # }

  x$curve <- 1:nrow(x)

  df <- x[, c(counts.intervals.cols,
              total.seeds.col, group.col, "curve")]
  coefs <- x[, c("a", "b", "c", "y0", group.col, "curve")]
  # coefs$curve <- 1:nrow(coefs)

  if (rog == FALSE) { # Plot FPHF curve
    # Calculate curves
    dfcurve <- merge(coefs, data.frame(intervals = seq(min(intervals),
                                                       max(intervals),
                                                       by = 0.1)))
    dfcurve[, c("a", "b", "c", "y0")] <-
      sapply(dfcurve[, c("a", "b", "c", "y0")], as.numeric)
    dfcurve <- plyr::mutate(dfcurve, csgp = FourPHF(intervals, a,
                                                    log(b, base = exp(1)),
                                                    c, y0))

    # Plot
    Gplot <- ggplot(data = dfcurve, aes(x = intervals, y = csgp,
                                        group = curve)) +
      geom_line(aes(colour = .data[[group.col]])) +
      labs(x = "Time", y = "Germination (%)") +
      theme_bw()

    if (show.points) {
      # Fetch cumulative germination data
      if (partial) {
        dfcsgp <- df
        dfcsgp[, counts.intervals.cols] <-
          t(apply(dfcsgp[, counts.intervals.cols],
                  1, cumsum))
        dfcsgp <- reshape2::melt(dfcsgp, id.vars = c(group.col,
                                                     total.seeds.col, "curve"),
                                 measure.vars = counts.intervals.cols,
                                 variable.name = "intervals")
        dfcsgp$csgp <- dfcsgp$value /
          dfcsgp[, total.seeds.col] * 100

        levels(dfcsgp$intervals) <- intervals
        dfcsgp$intervals <- as.numeric(as.character(dfcsgp$intervals))
      } else{
        dfcsgp <- reshape2::melt(df, id.vars = c(group.col,
                                                 total.seeds.col, "curve"),
                                 measure.vars = counts.intervals.cols,
                                 variable.name = "intervals")
        dfcsgp$csgp <- dfcsgp$value /
          dfcsgp[, total.seeds.col] * 100

        levels(dfcsgp$intervals) <- intervals
        dfcsgp$intervals <- as.numeric(as.character(dfcsgp$intervals))
      }

      dfcurve$curve <- as.factor(dfcurve$curve)
      dfcsgp$curve <- as.factor(dfcsgp$curve)

      dfcsgp$sel <- TRUE
      dfcurve$sel <- FALSE
      dfcurve2 <- dplyr::bind_rows(list(dfcurve, dfcsgp))

      # dfcurve2$sel <- as.factor(dfcurve2$sel)

      # Gplot <- Gplot +
      #   # geom_point(data = dfcsgp, aes_string(x = "intervals", y = "csgp",
      #   #                                      colour = group.col),
      #   #            alpha = 0.5, inherit.aes = FALSE)
      #   geom_point(data = dfcsgp, aes(x = intervals, y = csgp,
      #                                 colour = .data[[group.col]]),
      #              alpha = 0.5, inherit.aes = FALSE)
      Gplot <-
        ggplot(data = dfcurve2, aes(x = intervals, y = csgp,
                                    group = curve)) +
        geom_line2(mapping = aes(show.points = sel, colour = .data[[group.col]]),
                   include.points = FALSE) +
        labs(x = "Time", y = "Germination (%)") +
        theme_bw()
    }

  } else { # Plot ROG curve
    # Calculate curves
    dfcurve <- merge(coefs, data.frame(intervals = seq(min(intervals),
                                                       max(intervals),
                                                       by = 0.1)))
    dfcurve[, c("a", "b", "c", "y0")] <-
      sapply(dfcurve[, c("a", "b", "c", "y0")], as.numeric)
    dfcurve <- plyr::mutate(dfcurve, gp = RateofGerm(intervals, a, b, c))

    Gplot <- ggplot(data = dfcurve, aes(x = intervals, y = gp, group = curve)) +
      geom_line(aes(colour = .data[[group.col]])) +
      # geom_point(data = dfgp, aes_string(x = "intervals",
      #            y = "gp", colour = group.col),
      #            alpha = 0.5, inherit.aes = FALSE) +
      labs(x = "Time", y = "Germination (%)") +
      theme_bw()
  }

  if (annotate != "none") {
    dfannotate <- x[, c(group.col, acol)]
    dfannotate[, acol] <- sapply(dfannotate[, acol], as.numeric)

    if (annotate != "uniformity") {
      Gplot <- Gplot +
        geom_vline(data = dfannotate,
                   aes(xintercept = .data[[acol]], colour = .data[[group.col]]),
                   linetype = "dashed")
    } else {
      Gplot <- Gplot +
        geom_errorbar(data = dfannotate,
                      aes(xmin = .data[[acol[1]]], xmax = .data[[acol[2]]],
                          y = ypos2, colour = .data[[group.col]], width = 10),
                      inherit.aes = FALSE,
                      position = position_dodge(5))
    }

  }

  # plot limits
  if (limits == TRUE) {
    Gplot <- Gplot + coord_cartesian(xlim = c(0, max(intervals)),
                                     ylim = c(0, 100))
  }

  Gplot <- Gplot +
    theme(axis.text = element_text(colour = "black"))

  return(Gplot)

}
