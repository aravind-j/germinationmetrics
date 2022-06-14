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

#' Peak value and germination value
#'
#' Compute the Peak value (\mjseqn{PV}) or Emergence Energy (\mjseqn{EE})
#' \insertCite{czabator_germination_1962,bonner_ideal_1967}{germinationmetrics}
#' and Germination value (\mjseqn{GV})
#' \insertCite{czabator_germination_1962,djavanshir_germination_1976,brown_representing_1988}{germinationmetrics}.
#' \loadmathjax
#'
#' Peak value (\mjseqn{PV}) is the maximum quotient obtained by dividing
#' successive cumulative germination values by the relevant incubation time
#' \insertCite{czabator_germination_1962}{germinationmetrics}.
#'
#' \mjsdeqn{PV = \max\left ( \frac{G_{1}}{T_{1}},\frac{G_{2}}{T_{2}},\cdots
#' \frac{G_{k}}{T_{k}} \right )}
#'
#' Where, \mjseqn{T_{i}} is the time from the start of the experiment to the
#' \mjseqn{i}th interval, \mjseqn{G_{i}} is the cumulative germination
#' percentage in the \mjseqn{i}th time interval, and \mjseqn{k} is the total
#' number of time intervals.
#'
#' It represents the mean daily germination of the most vigorous component of
#' the seed lot, and is a mathematical expression of the break, or shoulder, of
#' a typical sigmoid  germination curve
#' \insertCite{djavanshir_germination_1976}{germinationmetrics}. It is the
#' accumulated number of seeds germinated at the point on the germination curve
#' at which the rate of germination starts to decrease. It is also described as
#' Emergence energy \insertCite{bonner_ideal_1967}{germinationmetrics}.
#'
#' For daily germination counts, germination value (\mjseqn{GV}) is computed as
#' follows \insertCite{czabator_germination_1962}{germinationmetrics} (Specified
#' by the argument \code{method = "czabator"}).
#'
#' \mjsdeqn{GV = PV \times MDG}
#'
#' Where, \mjseqn{PV} is the peak value, and \mjseqn{MDG} is the mean daily
#' germination percentage from the onset of germination.
#'
#' Germination value (\mjseqn{GV}) can also be computed for other time intervals
#' of successive germination counts, by replacing \mjseqn{MDG} with the mean
#' germination percentage per unit time (\mjseqn{\overline{GP}}).
#'
#' A new estimation of germination value was given by
#' \insertCite{djavanshir_germination_1976;textual}{germinationmetrics} as
#' follows (Specified by the argument \code{method = "dp"}).
#'
#' \mjsdeqn{GV = \frac{\sum DGS}{N} \times GP \times c}
#'
#' Where, \mjseqn{DGS} is the daily germination speed computed by dividing
#' cumulative germination percentage by the number of days since the onset of
#' germination, \mjseqn{N} is the frequency or number of DGS calculated during
#' the test, \mjseqn{GP} is the germination percentage expressed over 100, and
#' \mjseqn{c} is a constant. The value of \mjseqn{c} is decided on the basis of
#' average daily speed of germination (\mjseqn{\frac{\sum DGS}{N}}). If it is
#' less than 10, then \mjseqn{c} value of 10 can be used and if it is more than
#' 10, then value of 7 or 8 can be used for \mjseqn{c}.
#'
#' For both methods of computing \mjseqn{GV}, only the duration from the onset
#' of germination is considered by default. Alternatively, modified \mjseqn{GV}
#' (\mjseqn{GV_{mod}}), where the entire duration from the beginning of the test
#' is considered can be obtained by using the argument \code{from.onset = FALSE}
#' \insertCite{brown_representing_1988}{germinationmetrics}.
#'
#' @inheritParams MeanGermTime
#' @param total.seeds Total number of seeds.
#' @param method The method for computing germination value. Either
#'   \code{"czabator"} or \code{"dp"}.
#' @param from.onset logical. If \code{TRUE}, duration is considered only from
#'   the onset of germination. If \code{FALSE}, full duration of germination
#'   test is considered. Default is \code{TRUE}.
#' @param k Constant (See \strong{Details}). Default is 10.
#'
#' @return A list with the following components:  \item{Germination Value}{The
#'   germination value.} \item{Calculations}{The data frame of calculations.}
#'   \item{testend}{The end of test value (Only for method \code{dp}).}
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @name GermValue
#'
#' @examples
#'
#' x <- c(0, 0, 34, 40, 21, 10, 4, 5, 3, 5, 8, 7, 7, 6, 6, 4, 0, 2, 0, 2)
#' y <- c(0, 0, 34, 74, 95, 105, 109, 114, 117, 122, 130, 137, 144, 150,
#'       156, 160, 160, 162, 162, 164)
#' int <- 1:length(x)
#' total.seeds = 200
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' PeakValue(germ.counts = x, intervals = int, total.seeds = 200)
#' GermValue(germ.counts = x, intervals = int, total.seeds = 200,
#'           method = "czabator")
#' GermValue(germ.counts = x, intervals = int, total.seeds = 200,
#'           method = "dp", k = 10)
#' GermValue(germ.counts = x, intervals = int, total.seeds = 200,
#'           method = "czabator", from.onset = FALSE)
#' GermValue(germ.counts = x, intervals = int, total.seeds = 200,
#'           method = "dp", k = 10, from.onset = FALSE)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' PeakValue(germ.counts = y, interval = int, total.seeds = 200,
#'           partial = FALSE)
#' GermValue(germ.counts = y, intervals = int, total.seeds = 200,
#'           partial = FALSE, method = "czabator")
#' GermValue(germ.counts = y, intervals = int, total.seeds = 200,
#'           partial = FALSE, method = "dp", k = 10)
#' GermValue(germ.counts = y, intervals = int, total.seeds = 200,
#'           partial = FALSE, method = "czabator", from.onset = FALSE)
#' GermValue(germ.counts = y, intervals = int, total.seeds = 200,
#'           partial = FALSE, method = "dp", k = 10, from.onset = FALSE)
#'

#' @rdname GermValue
#' @export
PeakValue <- function(germ.counts, intervals, total.seeds, partial = TRUE) {
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

  # Check if argument total.seeds is of type numeric with unit length
  if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
    stop("'total.seeds' should be a numeric vector of length 1.")
  }

  x <- germ.counts
  csx <- cumsum(x)
  csxp <- (csx/total.seeds) * 100
  DGS <- csxp/intervals
  PV <- max(DGS)
  return(PV)
}

#' @rdname GermValue
#' @export
GermValue <- function(germ.counts, intervals, total.seeds, partial = TRUE,
                      method = c("czabator", "dp"), from.onset = TRUE, k = 10) {
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
    partial <- TRUE
  }

  # Check if argument total.seeds is of type numeric with unit length
  if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
    stop("'total.seeds' should be a numeric vector of length 1.")
  }

  # Check argument method
  method <- match.arg(method)

  # Check if argument k is of type numeric with unit length
  if (!is.numeric(k) || length(k) != 1) {
    stop("'k' should be a numeric vector of length 1.")
  }

  df <- data.frame(germ.counts, intervals)

  if (from.onset) {
    # Fetch only data from start of germination
    startindex <- min(which(df$germ.counts != 0))
    df <- df[startindex:nrow(df), ]
  }

  x <- df$germ.counts
  csx <- cumsum(x)
  csxp <- (csx/total.seeds) * 100
  DGS <-  csxp/df$intervals

  if (method == "czabator") {
    PV <- PeakValue(germ.counts, intervals, total.seeds, partial)
    MDG <-  MeanGermPercent(germ.counts = germ.counts, intervals = intervals,
                            total.seeds = total.seeds, partial = partial)

    GV <- MDG*PV

    Calculations <- data.frame(df, Cumulative.germ.counts = csx,
                              Cumulative.germ.percent = csxp,
                              DGS)
    #Calculations$GV <- Calculations$DGS*PV
    output <- list(`Germination Value` = GV, Calculations)
  }

  if (method == "dp") {
    N <- seq_along(DGS)
    SumDGSbyN <- cumsum(DGS)/N

    GVdp <- SumDGSbyN*(csxp/100)*k

    Calculations <- data.frame(df, Cumulative.germ.counts = csx,
                              Cumulative.germ.percent = csxp,
                              DGS, `SumDGSbyN` = SumDGSbyN,
                              GV = GVdp)
    output <- list(`Germination Value` = max(GVdp), Calculations,
                   testend = Calculations[Calculations$GV ==  max(GVdp),]$intervals)
  }

  return(output)
}
