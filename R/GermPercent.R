### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-20, ICAR-NBPGR.
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
#' Compute the germination percentage or final germination percentage or
#' germinability.
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
#' @param germinated.seeds Number of germinated seeds
#' @param germ.counts Germination counts at each time interval. Can be partial
#'   or cumulative as specified in the argument \code{partial}.
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
#'
#' # From partial germination counts
#' GermPercent(germ.counts = x, total.seeds = 50)
#'
#' # From cumulative germination counts
#' GermPercent(germ.counts = y, total.seeds = 50, partial = FALSE)
#'
#' # From number of germinated seeds
#' GermPercent(germinated.seeds = 40, total.seeds = 50)
#'
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

    # Convert cumulative to partial
    if (!partial) {
      germ.counts <- c(germ.counts[1], diff(germ.counts))
    }
    germinated.seeds <- sum(germ.counts)
  }

  GP <- (germinated.seeds/total.seeds)*100
  return(GP)
}
