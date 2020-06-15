### This file is part of 'germinationmetrics' package for R.

# # Copyright (C) 2017-18, ICAR-NBPGR.
#
# germinationmetrics is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 2 of the License, or (at your option) any
# later version.
#
# germinationmetrics is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# A copy of the GNU General Public License is available at
# https://www.r-project.org/Licenses/

#' Synchrony and uncertainty of germination
#'
#' Compute the following metrics:\describe{ \item{\code{GermSynchrony}}{
#' Synchrony of germination (\mjseqn{Z} index)
#' \insertCite{primack_longevity_1985,ranal_how_2006}{germinationmetrics}. }
#' \item{\code{GermUncertainty}}{Synchronization index (\mjseqn{\overline{E}})
#' or Uncertainty of the germination process (\mjseqn{U}) or Informational
#' entropy (\mjseqn{H})
#' \insertCite{shannon_mathematical_1948,labouriau_germination_1976,labouriau_uma_1983}{germinationmetrics}.}
#' } \loadmathjax
#'
#' \code{GermSynchrony} computes the value of synchrony of germination
#' (\mjseqn{Z} index) as follows
#' \insertCite{primack_longevity_1985,ranal_how_2006}{germinationmetrics}.
#'
#' \mjsdeqn{Z=\frac{\sum_{i=1}^{k}C_{N_{i},2}}{C_{\Sigma N_{i},2}}}
#'
#' Where, \mjseqn{C_{N_{i},2}} is the partial combination of the two germinated
#' seeds from among \mjseqn{N_{i}}, the number of seeds germinated on the
#' \mjseqn{i}th time interval (estimated as
#' \mjseqn{C_{N_{i},2}=\frac{N_{i}(N_{i}-1)}{2}}), and \mjseqn{C_{\Sigma
#' N_{i},2}} is the partial combination of the two germinated seeds from among
#' the total number of seeds germinated at the final count, assuming that all
#' seeds that germinated did so simultaneously.
#'
#' \code{GermUncertainty} computes the value of synchronization index
#' (\mjseqn{\overline{E}}) or uncertainty of the germination process
#' (\mjseqn{U}) or informational entropy (\mjseqn{H}) as follows
#' \insertCite{shannon_mathematical_1948,labouriau_germination_1976,labouriau_uma_1983}{germinationmetrics}.
#'
#' \mjsdeqn{\overline{E} = -\sum_{i=1}^{k}f_{i}\log_{2}f_{i}}
#'
#' Where, \mjseqn{f_{i}} is the relative frequency of germination (estimated as
#' \mjseqn{f_{i}=\frac{N_{i}}{\sum_{i=1}^{k}N_{i}}}), \mjseqn{N_{i}} is the
#' number of seeds germinated on the \mjseqn{i}th time interval, and \mjseqn{k}
#' is the total number of time intervals.
#'
#' @inheritParams MeanGermTime
#'
#' @return For \code{GermUncertainty}, the value of uncertainty of germination
#'   process.
#'
#'   For \code{GermSynchrony}, the value of synchrony of germination.
#'
#' @name GermSynchrony
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
#' GermSynchrony(germ.counts = x, intervals = int)
#' GermUncertainty(germ.counts = x, intervals = int)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' GermSynchrony(germ.counts = y, intervals = int, partial = FALSE)
#' GermUncertainty(germ.counts = y, intervals = int, partial = FALSE)
#'
#' @seealso \code{\link[germinationmetrics]{CUGerm}}


#' @rdname GermSynchrony
#' @export
GermSynchrony <- function(germ.counts, intervals, partial = TRUE) {
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

  Z <- sum(x*(x - 1)/2)/(sum(x)*(sum(x) - 1)/2)

  return(Z)
}

#' @rdname GermSynchrony
#' @export
GermUncertainty <- function(germ.counts, intervals, partial = TRUE) {
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

  relfreq <- x/sum(x)

  GU <- -sum(relfreq*log2(relfreq), na.rm = TRUE)

  return(GU)
}
