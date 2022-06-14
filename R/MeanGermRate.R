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

#' Germination rate
#'
#' Compute the following metrics: \describe{ \item{\code{MeanGermRate}}{Mean
#' germination rate (\mjseqn{\overline{V}})
#' \insertCite{labouriau_germination_1976,labouriau_uma_1983,ranal_how_2006}{germinationmetrics}.}
#' \item{\code{VarGermRate}}{Variance of germination rate (\mjseqn{s_{V}^{2}})
#' \insertCite{labouriau_uma_1983,ranal_how_2006}{germinationmetrics}. }
#' \item{\code{SEGermRate}}{Standard error of germination rate
#' (\mjseqn{s_{\overline{V}}})
#' \insertCite{labouriau_uma_1983,ranal_how_2006}{germinationmetrics}. }
#' \item{\code{CVG}}{Coefficient of velocity/rate of germination or Kotowski's
#' coefficient of velocity (\mjseqn{CVG})
#' \insertCite{kotowski_temperature_1926,nichols_two_1968,labouriau_uma_1983,scott_review_1984,bewley_seeds_1994}{germinationmetrics}.
#' } \item{\code{GermRateRecip}}{Germination rate as reciprocal of median time
#' (\mjseqn{v_{50}})
#' \insertCite{went_experimental_1957,labouriau_uma_1983,ranal_how_2006}{germinationmetrics}.}
#' } \loadmathjax
#'
#' \code{MeanGermRate} computes the mean germination rate
#' (\mjseqn{\overline{V}}) according to the following formula
#' \insertCite{labouriau_germination_1976,labouriau_uma_1983,ranal_how_2006}{germinationmetrics}.
#'
#' \mjsdeqn{\overline{V} = \frac{\sum_{i=1}^{k}N_{i}}{\sum_{i=1}^{k}N_{i}T_{i}}}
#'
#' Where, \mjseqn{T_{i}} is the time from the start of the experiment to the
#' \mjseqn{i}th interval, \mjseqn{N_{i}} is the number of seeds germinated in
#' the \mjseqn{i}th time interval (not the accumulated number, but the number
#' corresponding to the \mjseqn{i}th interval), and \mjseqn{k} is the total
#' number of time intervals.
#'
#' It is the inverse of mean germination time (\mjseqn{\overline{T}}).
#'
#' \mjsdeqn{\overline{V} = \frac{1}{\overline{T}}}
#'
#' \code{VarGermRate} computes the variance of germination rate
#' (\mjseqn{s_{V}^{2}}) according to the following formula
#' \insertCite{labouriau_uma_1983,ranal_how_2006}{germinationmetrics}.
#'
#' \mjsdeqn{s_{V}^{2} = \overline{V}^{4} \times s_{T}^{2}}
#'
#' Where, \mjseqn{s_{T}^{2}} is the variance of germination time.
#'
#' \code{SEGermRate} computes the standard error of germination time
#' (\mjseqn{s_{\overline{V}}}) according to the following formula
#' \insertCite{labouriau_uma_1983,ranal_how_2006}{germinationmetrics}.
#'
#' \mjsdeqn{s_{\overline{V}} = \sqrt{\frac{s_{V}^{2}}{\sum_{i=1}^{k}N_{i}}}}
#'
#' Where, \mjseqn{N_{i}} is the number of seeds germinated in the \mjseqn{i}th
#' time interval (not the accumulated number, but the number corresponding to
#' the \mjseqn{i}th interval), and \mjseqn{k} is the total number of time
#' intervals.
#'
#' \code{CVG} computes the coefficient of velocity/rate of germination or
#' Kotowski's coefficient of velocity (\mjseqn{CVG}) according to the following
#' formula
#' \insertCite{kotowski_temperature_1926,nichols_two_1968,labouriau_uma_1983,scott_review_1984,bewley_seeds_1994}{germinationmetrics}.
#'
#' \mjsdeqn{CVG = \frac{\sum_{i=1}^{k}N_{i}}{\sum_{i=1}^{k}N_{i}T_{i}} \times
#' 100}
#'
#' \mjsdeqn{CVG = \overline{V} \times 100}
#'
#' Where, \mjseqn{T_{i}} is the time from the start of the experiment to the
#' \mjseqn{i}th interval, \mjseqn{N_{i}} is the number of seeds germinated in
#' the \mjseqn{i}th time interval (not the accumulated number, but the number
#' corresponding to the \mjseqn{i}th interval), and \mjseqn{k} is the total
#' number of time intervals.
#'
#' \code{GermRateRecip} computes the germination rate \mjseqn{v_{50}}) as the
#' reciprocal of the median germination time (\mjseqn{t_{50}})
#' \insertCite{went_experimental_1957,labouriau_uma_1983,ranal_how_2006}{germinationmetrics}
#' computed according to the methods of
#' \insertCite{coolbear_effect_1984;textual}{germinationmetrics} or
#' \insertCite{farooq_thermal_2005;textual}{germinationmetrics} as follows.
#'
#' \mjsdeqn{v_{50} = \frac{1}{t_{50}}}
#'
#' @inheritParams MeanGermTime
#' @param method The method for computing median germination time. Either
#'   \code{"coolbear"} or \code{"farooq"}.
#'
#' @return For \code{MeanGermRate}, the mean germination rate value as
#'   \mjseqn{\mathrm{time^{-1}}}.
#'
#'   For \code{VarGermTime}, the variance of germination rate value as
#'   \mjseqn{\mathrm{time^{-2}}}.
#'
#'   For \code{SEGermTime}, the standard error of germination rate as
#'   \mjseqn{\mathrm{time^{-1}}}.
#'
#'   For \code{CVG}, the value of Coefficient of of velocity/rate of germination
#'   or Kotowski's coefficient of velocity as \% \mjseqn{\mathrm{time^{-1}}}.
#'
#'   For \code{GermRateRecip}, the value of germination rate as
#'   \mjseqn{\mathrm{time^{-1}}}.
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @name MeanGermRate
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' MeanGermRate(germ.counts = x, intervals = int)
#' CVG(germ.counts = x, intervals = int)
#' VarGermRate(germ.counts = x, intervals = int)
#' SEGermRate(germ.counts = x, intervals = int)
#' GermRateRecip(germ.counts = x, intervals = int, method = "coolbear")
#' GermRateRecip(germ.counts = x, intervals = int, method = "farooq")
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' MeanGermRate(germ.counts = y, intervals = int, partial = FALSE)
#' CVG(germ.counts = y, intervals = int, partial = FALSE)
#' VarGermRate(germ.counts = y, intervals = int, partial = FALSE)
#' SEGermRate(germ.counts = y, intervals = int, partial = FALSE)
#' GermRateRecip(germ.counts = y, intervals = int,
#'               method = "coolbear", partial = FALSE)
#' GermRateRecip(germ.counts = y, intervals = int,
#'               method = "farooq", partial = FALSE)
#'
#' @seealso \code{\link[germinationmetrics]{MeanGermTime}},
#'   \code{\link[germinationmetrics]{t50}}


#' @rdname MeanGermRate
#' @export
MeanGermRate <- function(germ.counts, intervals, partial = TRUE) {
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

  x <- germ.counts
  MGR <- sum(x)/sum(x*intervals)

  return(MGR)
}

#' @rdname MeanGermRate
#' @export
CVG <- function(germ.counts, intervals, partial = TRUE) {

  MGR <- MeanGermRate(germ.counts, intervals, partial)
  CVG <- MGR*100

  return(CVG)

}

#' @rdname MeanGermRate
#' @export
VarGermRate <- function(germ.counts, intervals, partial = TRUE) {

  MGR <- MeanGermRate(germ.counts, intervals, partial)
  VGT <- VarGermTime(germ.counts, intervals, partial)
  VGR <- (MGR^4)*VGT

  return(VGR)

}

#' @rdname MeanGermRate
#' @export
SEGermRate <- function(germ.counts, intervals, partial = TRUE) {

  VGR <- VarGermRate(germ.counts, intervals, partial)
  SEGR <- sqrt(VGR/sum(germ.counts))

  return(SEGR)

}

#' @rdname MeanGermRate
#' @export
GermRateRecip <- function(germ.counts, intervals, partial = TRUE,
                          method = c("coolbear", "farooq")) {

  # Check method argument
  method <-  match.arg(method)

  warn <- NULL
  withCallingHandlers(t50 <- t50(germ.counts, intervals, partial, method),
           warning = function(w) {
             warn <<- w
             invokeRestart("muffleWarning")})

  if (!is.null(warn)) {
    warning(gsub("t50", "GermRateRecip", warn$message))
  }

  GR <- 1/t50

  return(GR)


}
