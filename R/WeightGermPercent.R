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

#' Weighted germination percentage
#'
#' Compute the Weighted germination percentage
#' \mjseqn{WGP} or Weighted germination index
#' \mjseqn{WGI}
#' \insertCite{reddy_effect_1978,reddy_effect_1985}{germinationmetrics}. \loadmathjax
#'
#'
#' Weighted germination percentage was calculated by giving maximum weight to
#' the seeds that germinate first and decreasing weight to the seeds that
#' germinate subsequently. It is computed as follows
#' \insertCite{reddy_effect_1978,reddy_effect_1985}{germinationmetrics}.
#'
#' \mjsdeqn{WGP =
#' \frac{\sum_{i=1}^{k}(k-i+1)N_{i}}{k \times N} \times 100}
#'
#' Where, \mjseqn{N_{i}}  is the  number
#' of seeds that germinated in the time interval
#' \mjseqn{i} (not cumulative, but partial count),
#' \mjseqn{N} is the total number of seeds tested,
#' and \mjseqn{k} is the  total number of time
#' intervals.
#'
#' @inheritParams MeanGermTime
#' @param total.seeds Total number of seeds tested.
#'
#' @return The weighted germination percentage (\%) value.
#' @export
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
#' WeightGermPercent(germ.counts = x, total.seeds = 50, intervals = int)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' WeightGermPercent(germ.counts = y, total.seeds = 50, intervals = int,
#'                   partial = FALSE)
#'
#'
WeightGermPercent <- function(germ.counts, total.seeds, intervals,
                              partial = TRUE) {
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

  invtimes <- rev(seq_along(intervals))

  WGP <- (sum(invtimes * germ.counts) / (max(invtimes) * total.seeds)) * 100
  return(WGP)
}
