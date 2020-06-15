### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-18, ICAR-NBPGR.
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


#' Mean germination percentage and number of seeds per time interval
#'
#' Compute the following metrics:\describe{ \item{\code{MeanGermPercent}}{
#' Mean/average germination percentage per unit time (\mjseqn{\overline{GP}})
#' \insertCite{czabator_germination_1962}{germinationmetrics}. }
#' \item{\code{MeanGermNumber}}{Number of seeds germinated per unit time
#' (\mjseqn{\overline{N}})
#' \insertCite{khamassi_optimal_2013}{germinationmetrics}.}} \loadmathjax
#'
#' Mean germination percentage per unit time (\mjseqn{\overline{GP}}) is
#' computed as follows
#' \insertCite{czabator_germination_1962}{germinationmetrics}.
#'
#' \mjsdeqn{\overline{GP} = \frac{GP}{T_{k}}}
#'
#' Where, \mjseqn{GP} is the final germination percentage, \mjseqn{T_{k}} is the
#' time at the \mjseqn{k}th time interval, and \mjseqn{k} is the total number of
#' time intervals required for final germination.
#'
#' Mean number of seeds germinated per unit time (\mjseqn{\overline{N}}) is
#' computed as follows \insertCite{khamassi_optimal_2013}{germinationmetrics}.
#'
#' \mjsdeqn{\overline{N} = \frac{N_{g}}{T_{k}}}
#'
#' Where, \mjseqn{N_{g}} is the number of germinated seeds at the end of the
#' germination test, \mjseqn{T_{k}} is the time at the \mjseqn{k}th time
#' interval, and \mjseqn{k} is the total number of time intervals required for
#' final germination.
#'
#' @inheritParams GermPercent
#' @inheritParams MeanGermTime
#'
#' @return The value of mean germination percentage or mean number of seeds per
#'   time interval.
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @name MeanGermPercent
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' MeanGermPercent(germ.counts = x, total.seeds = 50, intervals = int)
#' MeanGermNumber(germ.counts = x, intervals = int)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' MeanGermPercent(germ.counts = y, total.seeds = 50, intervals = int, partial = FALSE)
#' MeanGermNumber(germ.counts = y, intervals = int, partial = FALSE)
#'
#' # From number of germinated seeds
#' #----------------------------------------------------------------------------
#' MeanGermPercent(germinated.seeds = 40, total.seeds = 50, intervals = int)
#'
#' @seealso \code{\link[germinationmetrics]{GermPercent}}

#' @rdname MeanGermPercent
#' @export
MeanGermPercent <- function(germinated.seeds, germ.counts, total.seeds, intervals,
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

    # Convert cumulative to partial
    if (!partial) {
      germ.counts <- c(germ.counts[1], diff(germ.counts))
    }
    germinated.seeds <- sum(germ.counts)
  }

  GP <- (germinated.seeds/total.seeds)*100

  # Check if argument intervals is of type numeric
  if (!is.numeric(intervals)) {
    stop("'intervals' should be a numeric vector.")
  }

  # Check if intervals are uniform
  idiff <- diff(intervals)
  if (!all(abs(idiff - idiff[[1]]) < .Machine$double.eps ^ 0.5)) {
    warning("'intervals' are not uniform.")
  }

  MGP <- GP/intervals[length(intervals)]

  return(MGP)
}


#' @rdname MeanGermPercent
#' @export
MeanGermNumber <- function(germ.counts, intervals, partial = TRUE) {
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

  # Convert cumulative to partial
  if (!partial) {
    germ.counts <- c(germ.counts[1], diff(germ.counts))
  }

  MGN <- sum(germ.counts)/intervals[length(intervals)]

  return(MGN)
}

