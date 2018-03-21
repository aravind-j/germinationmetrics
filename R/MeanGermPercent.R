### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017, ICAR-NBPGR.
#
# germinationmetrics is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# germinationmetrics is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  https://www.r-project.org/Licenses/


#'Mean germination percentage and number of seeds per time interval
#'
#'Compute the following metrics:\itemize{ \item Mean/average germination
#'percentage per unit time (\ifelse{html}{\out{<em><span
#'style="text-decoration:overline">GP</span></em>}}{\eqn{\overline{GP}}}) \item
#'Number of seeds germinated per unit time (\ifelse{html}{\out{<em><span
#'style="text-decoration: overline">N</span></em>}}{\eqn{\overline{N}}})}.
#'
#'Mean germination percentage per unit time (\ifelse{html}{\out{<em><span
#'style="text-decoration:overline">GP</span></em>}}{\eqn{\overline{GP}}}) is
#'computed as follows (Czabator, 1962).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em><span
#'style="text-decoration: overline;">GP</span> = <sup>GP</sup> &frasl;
#'<sub>T<sub>n</sub></sub></em></p>}}{\deqn{\overline{G} = \frac{GP}{T_{n}}}{MGP
#'= GP/Tf}}
#'
#'Where, \ifelse{html}{\out{<i>GP</i>}}{\eqn{GP}} is the final germination percentage and
#'\ifelse{html}{\out{<em>T<sub>n</sub></em>}}{\eqn{T_{n}}} is the total number
#'of intervals(e.g. days) required for final germination.
#'
#'Mean number of seeds germinated per unit time (\ifelse{html}{\out{<em><span
#'style="text-decoration: overline">N</span></em>}}{\eqn{\overline{N}}}) is
#'computed as follows (Khamassi et al., 2013).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em><span
#'style="text-decoration: overline;">N</span> = <sup>N<sub>g</sub></sup> &frasl;
#'<sub>T<sub>n</sub></sub></em></p>}}{\deqn{\overline{N} = \frac{N_{g}}{T_{n}}}}
#'
#'Where, \ifelse{html}{\out{<em>N<sub>g</sub></em>}}{\eqn{N_{g}}} is the number
#'of germinated seeds and
#'\ifelse{html}{\out{<em>T<sub>n</sub></em>}}{\eqn{T_{n}}} is the total number
#'of intervals (e.g. days) required for final germination.
#'
#'@inheritParams GermPercent
#'@inheritParams MeanGermTime
#'
#'@return The value of mean germination percentage or mean number of seeds per
#'  time interval.
#'
#'@references
#'
#'\insertRef{czabator_germination_1962}{germinationmetrics}
#'
#'\insertRef{djavanshir_germination_1976}{germinationmetrics}
#'
#'@name MeanGermPercent
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
  if (length(unique(diff(intervals))) != 1) {
    stop("'intervals' are not uniform.")
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
  if (length(unique(diff(intervals))) != 1) {
    stop("'intervals' are not uniform.")
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

