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

#' Germination time
#'
#' Compute the following metrics:\describe{ \item{\code{MeanGermTime}}{Mean
#' germination time (\mjseqn{\overline{T}}) or Mean length of incubation time
#' \insertCite{edmond_effects_1958,czabator_germination_1962,mockColdToleranceAdapted1972,ellis_improved_1980,labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}.}
#' \item{\code{VarGermTime}}{Variance of germination time (\mjseqn{s_{T}^{2}})
#' \insertCite{labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}.}
#' \item{\code{SEGermTime}}{Standard error of germination time
#' (\mjseqn{s_{\overline{T}}})
#' \insertCite{labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}.}
#' \item{\code{CVGermTime}}{Coefficient of variation of the germination time
#' (\mjseqn{CV_{T}})
#' \insertCite{gomes_curso_1960,ranal_how_2006}{germinationmetrics}.} }
#' \loadmathjax
#'
#' \code{MeanGermTime} computes the mean germination time according to the
#' following formula
#' \insertCite{edmond_effects_1958,czabator_germination_1962,smith_germinating_1964,ellis_improved_1980,labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}.
#'
#' \mjsdeqn{\overline{T} = \frac{\sum_{i=1}^{k}N_{i}T_{i}}{\sum_{i=1}^{k}N_{i}}}
#'
#' Where, \mjseqn{T_{i}} is the time from the start of the experiment to the
#' \mjseqn{i}th interval, \mjseqn{N_{i}} is the number of seeds germinated in
#' the \mjseqn{i}th time interval (not the accumulated number, but the number
#' corresponding to the \mjseqn{i}th interval), and \mjseqn{k} is the total
#' number of time intervals.
#'
#' It is the same as Sprouting Index (\mjseqn{SI}) or Emergence Index
#' (\mjseqn{EI}) described by
#' \insertCite{smith_germinating_1964;textual}{germinationmetrics} and
#' \insertCite{mockColdToleranceAdapted1972;textual}{germinationmetrics} as well
#' as Germination Resistance (\mjseqn{GR}) described by
#' \insertCite{gordon_observations_1969,gordon_germination_1971;textual}{germinationmetrics}.
#'
#' It is the inverse of mean germination rate (\mjseqn{\overline{V}}).
#'
#' \mjsdeqn{\overline{T} = \frac{1}{\overline{V}}}
#'
#' It indicates the average length of time required for maximum germination of a
#' seed lot. Lower the \mjseqn{\overline{T}}, faster the sample has germinated
#' and reflects seed vigor.
#'
#' \code{VarGermTime} computes the variance of germination time according to the
#' following formula
#' \insertCite{labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}.
#'
#' \mjsdeqn{s_{T}^{2} =
#' \frac{\sum_{i=1}^{k}N_{i}(T_{i}-\overline{T})^{2}}{\sum_{i=1}^{k}N_{i}-1}}
#'
#' Where, \mjseqn{T_{i}} is the time from the start of the experiment to the
#' \mjseqn{i}th interval, \mjseqn{N_{i}} is the number of seeds germinated in
#' the \mjseqn{i}th time interval (not the accumulated number, but the number
#' corresponding to the \mjseqn{i}th interval), and \mjseqn{k} is the total
#' number of time intervals.
#'
#' \code{SEGermTime} computes the standard error of germination time
#' (\mjseqn{s_{\overline{T}}}) according to the following formula
#' \insertCite{labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}.
#'
#' \mjsdeqn{s_{\overline{T}} = \sqrt{\frac{s_{T}^{2}}{\sum_{i=1}^{k}N_{i}}}}
#'
#' Where, \mjseqn{N_{i}} is the number of seeds germinated in the \mjseqn{i}th
#' time interval (not the accumulated number, but the number corresponding to
#' the \mjseqn{i}th interval), and \mjseqn{k} is the total number of time
#' intervals.
#'
#' It signifies the accuracy of the calculation of the mean germination time.
#'
#' \code{CVGermTime} computes the coefficient of variation of germination time
#' (\mjseqn{CV_{T}}) according to the following formula
#' \insertCite{gomes_curso_1960,ranal_how_2006}{germinationmetrics}.
#'
#' \mjsdeqn{CV_{T} = \frac{\sqrt{s_{T}^{2}}}{\overline{T}}}
#'
#' This indicates the uniformity of germination and permits comparisons
#' irrespective of the magnitude of mean germination time
#' (\mjseqn{\overline{T}}).
#'
#' @param germ.counts Germination counts at each time interval. Can be partial
#'   or cumulative as specified in the argument \code{partial}.
#' @param intervals The time intervals.
#' @param partial logical. If \code{TRUE}, \code{germ.counts} is considered as
#'   partial and if \code{FALSE}, it is considered as cumulative. Default is
#'   \code{TRUE}.
#'
#' @return For \code{MeanGermTime}, the mean germination time value in the same
#'   unit of time as specified in the argument \code{intervals}.
#'
#'   For \code{VarGermTime}, the variance of germination time value as
#'   \mjseqn{\mathrm{time^{2}}}.
#'
#'   For \code{SEGermTime}, the standard error of germination time in the same
#'   unit of time specified in the argument \code{intervals}.
#'
#'   For \code{CVGermTime}, the value of coefficient of variation of the
#'   germination time.
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @name MeanGermTime
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' MeanGermTime(germ.counts = x, intervals = int)
#' VarGermTime(germ.counts = x, intervals = int)
#' SEGermTime(germ.counts = x, intervals = int)
#' CVGermTime(germ.counts = x, intervals = int)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' MeanGermTime(germ.counts = y, intervals = int, partial = FALSE)
#' VarGermTime(germ.counts = y, intervals = int, partial = FALSE)
#' SEGermTime(germ.counts = y, intervals = int, partial = FALSE)
#' CVGermTime(germ.counts = y, intervals = int, partial = FALSE)
#'
#' @seealso \code{\link[germinationmetrics]{MeanGermRate}}

#' @rdname MeanGermTime
#' @export
MeanGermTime <- function(germ.counts, intervals, partial = TRUE) {
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
  MGT <- sum(x*intervals)/sum(x)

  return(MGT)
}


#' @rdname MeanGermTime
#' @export
VarGermTime <- function(germ.counts, intervals, partial = TRUE) {

  MGT <- MeanGermTime(germ.counts, intervals, partial)
  intervalsdiff <- (intervals - MGT)^2
  VGT <- sum(germ.counts*intervalsdiff)/(sum(germ.counts) - 1)

  return(VGT)
}

#' @rdname MeanGermTime
#' @export
SEGermTime <- function(germ.counts, intervals, partial = TRUE) {

  VGT <- VarGermTime(germ.counts, intervals, partial)
  SEGT <- sqrt(VGT/sum(germ.counts))

  return(SEGT)
}

#' @rdname MeanGermTime
#' @export
CVGermTime <- function(germ.counts, intervals, partial = TRUE) {

  MGT <- MeanGermTime(germ.counts, intervals, partial)
  VGT <- VarGermTime(germ.counts, intervals, partial)
  CVGT <- sqrt(VGT)/MGT

  return(CVGT)
}

