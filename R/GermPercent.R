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

#' Germination percentage
#'
#' Compute the following metrics: \describe{ \item{\code{GermPercent}}{
#' Germination percentage or Final germination percentage or Germinability
#' \insertCite{ista_chapter_2015}{germinationmetrics}.}
#' \item{\code{PeakGermPercent}}{Peak germination percentage
#' \insertCite{vallance_studies_1950,roh_maturity_2004}{germinationmetrics}.} }
#'
#' Germination percentage is computed as follows
#' \insertCite{ista_chapter_2015}{germinationmetrics}. \loadmathjax
#'
#' \mjsdeqn{GP = \frac{N_{g}}{N_{t}} \times 100}
#'
#' Where, \mjseqn{N_{g}} is the number of germinated seeds and \mjseqn{N_{t}} is
#' the total number of seeds.
#'
#' The value of \mjseqn{N_{g}} can be either specified using the argument
#' \code{germinated.seeds} or is computed from the \code{germ.counts} argument.
#'
#' Peak germination percentage is computed as follows
#' \insertCite{vallance_studies_1950,roh_maturity_2004}{germinationmetrics}.
#'
#' \mjsdeqn{PGP = \frac{N_{max}}{N_{t}} \times 100}
#'
#' Where, \mjseqn{N_{max}} is the maximum number of seeds germinated per
#' interval.
#'
#' @param germinated.seeds Number of germinated seeds
#' @param germ.counts Germination counts at each time interval. Can be partial
#'   or cumulative as specified in the argument \code{partial}.
#' @param intervals The time intervals.
#' @param total.seeds Total number of seeds.
#' @param partial logical. If \code{TRUE}, \code{germ.counts} is considered as
#'   partial and if \code{FALSE}, it is considered as cumulative. Default is
#'   \code{TRUE}.
#'
#' @return The germination percentage (\%) value.
#' @export
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' z <- c(0, 0, 0, 0, 11, 11, 9, 7, 1, 0, 1, 0, 0, 0)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' GermPercent(germ.counts = x, total.seeds = 50)
#' PeakGermPercent(germ.counts = x, intervals = int, total.seeds = 50)
#' # For multiple peak germination times
#' PeakGermPercent(germ.counts = z, intervals = int, total.seeds = 50)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' GermPercent(germ.counts = y, total.seeds = 50, partial = FALSE)
#' PeakGermPercent(germ.counts = y, intervals = int, total.seeds = 50,
#'                 partial = FALSE)
#' # For multiple peak germination times
#' PeakGermPercent(germ.counts = cumsum(z), intervals = int, total.seeds = 50,
#'                 partial = FALSE)
#'
#' # From number of germinated seeds
#' #----------------------------------------------------------------------------
#' GermPercent(germinated.seeds = 40, total.seeds = 50)
#'


#' @rdname GermPercent
#' @export
GermPercent <- function(germinated.seeds, germ.counts, total.seeds,
                        partial = TRUE) {
  gcheck <- c(missing(germinated.seeds), missing(germ.counts))

  # Check if both germinated.seeds and germ.counts are provided
  if (identical(gcheck, c(FALSE, FALSE))) {
    stop("Provide only either one of the two arguments\n'germinated.seeds' or 'germ.counts' and not both")
  }

  # Check if argument total.seeds is of type numeric with unit length
  if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
    stop("'total.seeds' should be a numeric vector of length 1.")
  }

  if (!missing(germinated.seeds)) { # When germinated.seeds is provided
    # Check if argument germinated.seeds is of type numeric with unit length
    if (!is.numeric(germinated.seeds) || length(germinated.seeds) != 1) {
      stop("'germinated.seeds' should be a numeric vector of length 1.")
    }
  } else {# When germ.counts is provided

    # Check if argument germ.counts is of type numeric
    if (!is.numeric(germ.counts)) {
      stop("'germ.counts' should be a numeric vector.")
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
    germinated.seeds <- sum(germ.counts)
  }

  GP <- (germinated.seeds/total.seeds)*100
  return(GP)
}

#' @rdname GermPercent
#' @export
PeakGermPercent <- function(germ.counts, intervals, total.seeds,
                            partial = TRUE) {
  # Check if argument germ.counts is of type numeric
  if (!is.numeric(germ.counts)) {
    stop("'germ.counts' should be a numeric vector.")
  }

  # Check if argument intervals is of type numeric
  if (!is.numeric(intervals)) {
    stop("'intervals' should be a numeric vector.")
  }

  # Check if germ.counts and intervals are of equal length
  if (length(germ.counts) != length(intervals)) {
    stop("'germ.counts' and 'intervals' lengths differ.")
  }

  # Check if argument total.seeds is of type numeric with unit length
  if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
    stop("'total.seeds' should be a numeric vector of length 1.")
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

  x <- germ.counts
  PGT <- intervals[which(x %in% max(x))]

  if (length(PGT) > 1) {
    warning("Multiple peak germination times exist.")
  }

  PGP <- (germ.counts[PGT[1]]/total.seeds)*100
  return(PGP)
}
