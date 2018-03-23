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


#'Peak value and germination value
#'
#'Compute the peak value (Czabator, 1962) and germination value (Czabator, 1962;
#'Djavanshir and Pourbeik, 1976).
#'
#'Peak value (\ifelse{html}{\out{<i>PV</i>}}{\eqn{PV}}) is the maximum quotient obtained by dividing successive
#'cumulative germination values by the relevant incubation time (Czabator,
#'1962). It represents the mean daily germination of the most vigorous component
#'of the seed lot, and is a mathematical expression of the break, or shoulder,
#'of a typical sigmoid  germination curve (Djavanshir and Pourbeik, 1976).
#'
#'For daily germination counts, germination value (\ifelse{html}{\out{<i>GV</i>}}{\eqn{GV}}) is computed as
#'follows (Czabator, 1962).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em>GV = PV &times;
#'MDG</em></p>}}{\deqn{GV = PV \times MDG}}
#'
#'Where, \ifelse{html}{\out{<i>PV</i>}}{\eqn{PV}} is the peak value and \ifelse{html}{\out{<i>MDG</i>}}{\eqn{MDG}} is the mean daily germination
#'percentage.
#'
#'\ifelse{html}{\out{<i>GV</i>}}{\eqn{GV}} can also be computed for other time intervals of successive
#'germination counts, by replacing \ifelse{html}{\out{<i>MDG</i>}}{\eqn{MDG}} with the mean germination
#'percentage per unit time (\ifelse{html}{\out{<em><span
#'style="text-decoration:overline">GP</span></em>}}{\eqn{\overline{GP}}}).
#'
#'A new estimation of germination value was given by Djavanshir and Pourbeik
#'(1976) as follows:
#'
#'\ifelse{html}{\out{<p style="text-align: center;">GV = [<sup>&sum;DGS</sup>
#'&frasl; <sub>N</sub>] &times; GP &times; k</p>}}{\deqn{GV = \frac{\sum DGS}{N}
#'\times GP \times k}}
#'
#'Where, \ifelse{html}{\out{<i>DGS</i>}}{\eqn{DGS}} is the daily germination speed computed by dividing
#'cumulative germination percentage by the number of days since the beginning of
#'the test, \ifelse{html}{\out{<i>N</i>}}{\eqn{N}} is the frequency or number of DGS calculated during the
#'test, \eqn{GP} is the germination percentage expressed over 100 and \ifelse{html}{\out{<i>k</i>}}{\eqn{k}} is
#'a constant. The value of \ifelse{html}{\out{<i>k</i>}}{\eqn{k}} is decided on the basis of average daily
#'speed of germination (\ifelse{html}{\out{<em><sup>&sum;DGS</sup> &frasl;
#'<sub>N</sub></em>}}{\eqn{\frac{\sum DGS}{N}}}). If it is less than 10, then
#'\ifelse{html}{\out{<i>k</i>}}{\eqn{k}} value of 10 can be used and if it is more than 10, then value of 7 or
#'8 can be used for \ifelse{html}{\out{<i>k</i>}}{\eqn{k}}.
#'
#'@inheritParams MeanGermTime
#'@param total.seeds Total number of seeds.
#'@param method The method for computing germination value. Either
#'  \code{"czabator"} or \code{"dp"}.
#'@param k Constant (See \strong{Details}). Default is 10.
#'
#'@return A list with the following components:  \item{Germination Value}{The
#'  germination value} \item{Calculations}{The data frame of calculations.}
#'  \item{testend}{The end of test value (Only for method \code{dp}).}
#'
#'@references
#'
#'\insertRef{czabator_germination_1962}{germinationmetrics}
#'
#'\insertRef{khamassi_optimal_2013}{germinationmetrics}
#'
#'@name GermValue
#'
#' @examples
#'
#'x <- c(0, 0, 34, 40, 21, 10, 4, 5, 3, 5, 8, 7, 7, 6, 6, 4, 0, 2, 0, 2)
#'y <- c(0, 0, 34, 74, 95, 105, 109, 114, 117, 122, 130, 137, 144, 150,
#'       156, 160, 160, 162, 162, 164)
#'int <- 1:length(x)
#'total.seeds = 200
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' PeakValue(germ.counts = x, intervals = int, total.seeds = 200)
#' GermValue(germ.counts = x, intervals = int, total.seeds = 200,
#'           method = "czabator")
#' GermValue(germ.counts = x, intervals = int, total.seeds = 200,
#'           method = "dp", k = 10)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' PeakValue(germ.counts = y, interval = int, total.seeds = 200,
#'           partial = FALSE)
#' GermValue(germ.counts = y, intervals = int, total.seeds = 200,
#'           partial = FALSE, method = "czabator")
#' GermValue(germ.counts = y, intervals = int, total.seeds = 200,
#'           partial = FALSE, method = "dp", k = 10)
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
                              method = c("czabator", "dp"), k = 10) {
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

  # Fetch only data from start of germination
  startindex <- min(which(df$germ.counts != 0))
  df <- df[startindex:nrow(df),]

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
