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

#' Germination Index
#'
#' Compute the Germination index according to
#' \insertCite{melville_seed_1980;textual}{germinationmetrics} and
#' its modification by
#' \insertCite{de_santana_alise_2004;textual}{germinationmetrics}
#' \insertCite{ranal_how_2006}{germinationmetrics}. \loadmathjax
#'
#' Germination index (\mjseqn{GI}) is computed as follows
#' \insertCite{melville_seed_1980}{germinationmetrics}.
#'
#' \mjsdeqn{GI = \sum_{i=1}^{k}\frac{\left | \left ( T_{k} - T_{i} \right )
#' N_{i}\right |}{N_{t}}}
#'
#' Where, \mjseqn{T_{i}} is the time from the start of the experiment to the
#' \mjseqn{i}th interval (day for the example), \mjseqn{N_{i}} is the number of
#' seeds germinated in the \mjseqn{i}th time interval (not the accumulated
#' number, but the number corresponding to the \mjseqn{i}th interval),
#' \mjseqn{N_{t}} is the total number of seeds used in the test, and \mjseqn{k}
#' is the total number of time intervals.
#'
#' A modified germination index (\mjseqn{GI_{mod}}) was proposed by
#' \insertCite{de_santana_alise_2004}{germinationmetrics} where total number of
#' seeds tested (\mjseqn{N_{t}}) is replaced by the total number of germinated
#' seeds (\mjseqn{N_{g}}) in the expression of
#' \insertCite{melville_seed_1980;textual}{germinationmetrics} to
#' remove the effect of sample size
#' \insertCite{ranal_how_2006}{germinationmetrics}. It is computed as follows
#' (Specified by the argument \code{modification = "santanaranal"}).
#'
#' \mjsdeqn{GI_{mod} = \sum_{i=1}^{k}\frac{\left | \left ( T_{k} - T_{i} \right
#' ) N_{i}\right |}{N_{g}}}
#'
#' The term Germination index (\mjseqn{GI}) has also been used to describe the
#' mathematical expression for Speed of germination
#' (\code{\link[germinationmetrics]{GermSpeed}}) by
#' \insertCite{aosa_seed_1983;textual}{germinationmetrics}.
#'
#' @inheritParams MeanGermTime
#' @param modification The modification to be applied. Either \code{"none"} or
#'   \code{"santanaranal"}. Default is \code{"none"} (see \strong{Details}).
#' @param total.seeds Total number of seeds.
#'
#' @return The value of the Germination index in the same unit of time as
#'   specified in the argument \code{intervals}.
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' GermIndex(germ.counts = x, intervals = int, total.seeds = 50)
#' GermIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'           modification = "none")
#' GermIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'           modification = "santanaranal")
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' GermIndex(germ.counts = y, intervals = int, partial = FALSE,
#'           total.seeds = 50)
#' GermIndex(germ.counts = y, intervals = int, partial = FALSE,
#'           total.seeds = 50,
#'           modification = "none")
#' GermIndex(germ.counts = y, intervals = int, partial = FALSE,
#'           total.seeds = 50,
#'           modification = "santanaranal")
#'
#' @seealso \code{\link[germinationmetrics]{GermSpeed}}
#'
#' @importFrom utils tail
#'
#' @rdname GermIndex
#' @export
GermIndex <- function(germ.counts, intervals, partial = TRUE,
                      total.seeds,
                      modification = c("none", "santanaranal")) {

  # Check if argument total.seeds is of type numeric with unit length
  if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
    stop("'total.seeds' should be a numeric vector of length 1.")
  }

  # Check if argument germ.counts is of type numeric
  if (!is.numeric(germ.counts)) {
    stop("'germ.counts' should be a numeric vector.")
  }

  # Check if argument intervals is of type numeric
  if (!is.numeric(intervals)) {
    stop("'intervals' should be a numeric vector.")
  }

  # Check if intervals are uniform
  idiff <- diff(intervals)
  if (!all(abs(idiff - idiff[[1]]) < .Machine$double.eps ^ 0.5)) {
    warning("'intervals' are not uniform.")
  }

  # Check if germ.counts and intervals are of equal length
  if (length(germ.counts) != length(intervals)) {
    stop("'germ.counts' and 'intervals' lengths differ.")
  }

  # Check if argument partial is of type logical with unit length
  if (!is.logical(partial) || length(partial) != 1) {
    stop("'partial' should be a logical vector of length 1.")
  }

  # Check if data is cumulative
  if (!partial) {
    if(is.unsorted(germ.counts)) {
      stop("'germ.counts' is not cumulative.")
    }
  }

  # Convert cumulative to partial
  if (!partial) {
    germ.counts <- c(germ.counts[1], diff(germ.counts))
  }

  # Check modification
  modification <- match.arg(modification)

  Tk <- tail(intervals, n = 1)

  if (modification == "santanaranal") {
    GI <- sum(abs((Tk - intervals) * germ.counts)/sum(germ.counts))
  } else { # modification == "none"
    GI <- sum(abs((Tk - intervals) * germ.counts)/total.seeds)
  }

  return(GI)

}

