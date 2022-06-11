### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-2022, ICAR-NBPGR.
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


#' Coefficient of uniformity of germination
#'
#' Compute the Coefficient of uniformity of germination (CUG).
#'
#' CUG is computed as follows
#' \insertCite{heydecker_seed_1972,bewley_seeds_1994}{germinationmetrics}.
#' \loadmathjax
#'
#' \mjsdeqn{CUG =
#' \frac{\sum_{i=1}^{k}N_{i}}{\sum_{i=1}^{k}(\overline{T}-T_{i})^{2}N_{i}}}
#'
#' Where, \mjseqn{\overline{T}} is the the mean germination time, \mjseqn{T_{i}}
#' is the time from the start of the experiment to the \mjseqn{i}th interval,
#' \mjseqn{N_{i}} is the number of seeds germinated in the \mjseqn{i}th time
#' interval (not the accumulated number, but the number corresponding to the
#' \mjseqn{i}th interval), and \mjseqn{k} is the total number of time intervals.
#'
#' @inheritParams MeanGermTime
#'
#' @return The value of the coefficient of uniformity of germination as
#'   \mjseqn{\mathrm{time^{-2}}}.
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @import mathjaxr
#' @export
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' CUGerm(germ.counts = x, intervals = int)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' CUGerm(germ.counts = y, intervals = int, partial = FALSE)
#'
#' @seealso \code{\link[germinationmetrics]{GermSynchrony}},
#'   \code{\link[germinationmetrics]{MeanGermTime}}
#'
CUGerm <- function(germ.counts, intervals, partial = TRUE) {

  MGT <- MeanGermTime(germ.counts, intervals, partial)

  CUG <- sum(germ.counts)/sum((((MGT - intervals)^2)*germ.counts))

  return(CUG)

}
