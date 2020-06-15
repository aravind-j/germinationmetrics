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

#' Timson's index
#'
#' Compute George's index
#' \insertCite{george_influence_1961,tucker_estimating_1965,nichols_two_1968,chopraEffectSoilTemperature1980}{germinationmetrics},
#' Timson's index or Timson's germination velocity index
#' \insertCite{grose_laboratory_1958,timson_new_1965,lyonRapidMethodDetermining1966,chaudharyEffectTemperatureAssociated1970,negmEffectsEthyleneCarbon1978,brown_representing_1988,baskin_seeds_1998}{germinationmetrics}
#' and it's modifications by Labouriau
#' \insertCite{ranal_how_2006}{germinationmetrics} and
#' \insertCite{khan_effect_1984}{germinationmetrics}. \loadmathjax
#'
#' Timson's index \insertCite{timson_new_1965}{germinationmetrics} is computed
#' as follows
#' \insertCite{grose_laboratory_1958,brown_representing_1988,baskin_seeds_1998}{germinationmetrics}.
#'
#' \mjsdeqn{\Sigma k = \sum_{i=1}^{k}G_{i}}
#'
#' Where, \mjseqn{G_{i}} is the cumulative germination percentage in time
#' interval \mjseqn{i} and \mjseqn{k} is the total number of time intervals.
#'
#' For example ten summation (\mjseqn{\Sigma 10}) is expressed as follows.
#'
#' \mjsdeqn{\Sigma 10 = G_{1}+G_{2}+\cdots+G_{10}}
#'
#' Where \mjseqn{G_{1},G_{2},\cdots G_{10}} are the cumulative germination
#' percentage at day 1, 2, 3, \mjseqn{\cdots}, 10 respectively.
#'
#' Similarly \mjseqn{\Sigma 5} or \mjseqn{\Sigma 20} can be estimated. For
#' \mjseqn{\Sigma 10}, the value can range from 0 (no germination) to 1,000
#' (100\% germination after 24 hours).
#'
#' It is the progressive total of cumulative germination percentage recorded at
#' specific intervals for a set period of time.  It combines onset, rate and
#' total percentage of germination and estimates the area under the cumulative
#' germination percentage curve. It is same as the indices for area under time
#' course curve of germination described by
#' \insertCite{lyonRapidMethodDetermining1966;textual}{germinationmetrics} as
#' well as
#' \insertCite{negmEffectsEthyleneCarbon1978;textual}{germinationmetrics}. It is
#' also described as Emergence Rate Index (\mjseqn{ERI}) by
#' \insertCite{chaudharyEffectTemperatureAssociated1970;textual}{germinationmetrics}.
#'
#' \insertCite{goodchild_method_1971;textual}{germinationmetrics}, described the
#' same in terms of partial germination percentage as follows.
#'
#' \mjsdeqn{\Sigma k = \sum_{i=1}^{k}g_{i}(k-j)}
#'
#' Where, \mjseqn{g_{i}} is the germination (not cumulative, but partial
#' germination) in time interval \mjseqn{i} (\mjseqn{i} varying from \mjseqn{0}
#' to \mjseqn{k}), \mjseqn{k} is the total number of time intervals, and
#' \mjseqn{j = i - 1}.
#'
#' Timson's index is equivalent to the Germination Energy Index \mjseqn{GEI}
#' proposed by \insertCite{grose_laboratory_1958;textual}{germinationmetrics}.
#'
#' As Timson's index is useful for comparison only when samples have similar
#' germinabilities or final germination percentage, the following modification
#' was suggested by Labouriau \insertCite{ranal_how_2006}{germinationmetrics}.
#'
#' \mjsdeqn{\Sigma k_{mod} = \frac{\Sigma k}{\sum_{i=1}^{k}g_{i}}}
#'
#' Here Timson's index (\mjseqn{\Sigma k}) is divided by the sum of partial
#' germination percentages.
#'
#' Similarly another modification was proposed by
#' \insertCite{khan_effect_1984}{germinationmetrics}, where Timson's index
#' (\mjseqn{\Sigma k}) is divided by the total time period of germination
#' (\mjseqn{T_{k}}).
#'
#' \mjsdeqn{\Sigma k_{mod} = \frac{\Sigma k}{T_{k}}}
#'
#' Timson's index is similar to the Germination Rate (\mjseqn{GR}) proposed by
#' \insertCite{george_influence_1961;textual}{germinationmetrics} as follows
#' \insertCite{tucker_estimating_1965,nichols_two_1968}{germinationmetrics}.
#'
#' \mjsdeqn{GR = \sum_{i=1}^{k}N_{i}K_{i}}
#'
#' Where \mjseqn{N_{i}} is the number of seeds germinated by \mjseqn{i}th
#' interval, \mjseqn{K_{i}} is the number of intervals(e.g. days) until the end
#' of the test, and \mjseqn{k} is the total number of time intervals.
#'
#' This index uses number of seeds germinated instead of germination percentage.
#' It is also described as Emergence Rate Index (\mjseqn{ERI}) by
#' \insertCite{chopraEffectSoilTemperature1980;textual}{germinationmetrics}.
#'
#' So germination rate (\mjseqn{GR}) can also be described in terms of partial
#' (\mjseqn{N_{i}}) and cumulative (\mjseqn{\sum_{j=1}^{i}N_{j}}) number of
#' seeds germinated in each time interval (\mjseqn{i}) as follows.
#'
#' \mjsdeqn{GR = \sum_{i=1}^{k}\sum_{j=1}^{i}N_{j}}
#'
#' \mjsdeqn{GR = \sum_{i=1}^{k}N_{i}(k-j)}
#'
#' @inheritParams MeanGermTime
#' @param total.seeds Total number of seeds.
#' @param max The maximum interval value up to which Timson's index/George's
#'   germination rate is to be computed.
#' @param modification The modification to be applied. Either \code{"none"},
#'   \code{"labouriau"} or \code{"khanungar"}. Default is \code{"none"} (see
#'   \strong{Details}).
#'
#' @return For \code{TimsonsIndex} The value of Timson's index.
#'
#'   For \code{GermRateGeorge} The value of George's germination rate.
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @name TimsonsIndex
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' # Wihout max specified
#' TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50)
#' TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'              modification = "none")
#' TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'              modification = "labouriau")
#' TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'              modification = "khanungar")
#' GermRateGeorge(germ.counts = x, intervals = int)
#'
#' # With max specified
#' TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50, max = 10)
#' TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'              max = 10, modification = "none")
#' TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'              max = 10, modification = "labouriau")
#' TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'              max = 10, modification = "khanungar")
#' GermRateGeorge(germ.counts = x, intervals = int, max = 10)
#' GermRateGeorge(germ.counts = x, intervals = int, max = 14)
#'
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' # Wihout max specified
#' TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
#'              total.seeds = 50)
#' TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
#'              total.seeds = 50,
#'              modification = "none")
#' TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
#'              total.seeds = 50,
#'              modification = "labouriau")
#' TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
#'              total.seeds = 50,
#'              modification = "khanungar")
#' GermRateGeorge(germ.counts = y, intervals = int, partial = FALSE,)
#'
#' # With max specified
#' TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
#'              total.seeds = 50, max = 10)
#' TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
#'              total.seeds = 50,
#'              max = 10, modification = "none")
#' TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
#'              total.seeds = 50,
#'              max = 10, modification = "labouriau")
#' TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
#'              total.seeds = 50,
#'              max = 10, modification = "khanungar")
#' GermRateGeorge(germ.counts = y, intervals = int, partial = FALSE,
#'                max = 10)
#' GermRateGeorge(germ.counts = y, intervals = int, partial = FALSE,
#'                max = 14)

#' @rdname TimsonsIndex
#' @export
TimsonsIndex <- function(germ.counts, intervals, partial = TRUE,
                        total.seeds, max,
                        modification = c("none", "labouriau", "khanungar")) {

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

  # Convert cumulative to partial
  if (!partial) {
    germ.counts <- c(germ.counts[1], diff(germ.counts))
  }

  # Set max
  if (missing(max)) {
    max <- intervals[length(germ.counts)]
  }

  # Check if argument max is of type numeric with unit length
  if (!is.numeric(max) || length(max) != 1) {
    stop("'max' should be a logical vector of length 1.")
  }

  # Check max argument is present in intervals
  if (!(max %in% intervals)) {
    stop("'max' is not present in 'intervals'.")
  }

  # Check modification
  modification <- match.arg(modification)


  maxgc <- which(intervals == max)
  x <- germ.counts[1:maxgc]
  cgp <- cumsum(x)/total.seeds * 100
  pgp <- x/total.seeds * 100

  # interval <- unique(diff(intervals))

  #GI <- sum(cumsum(x))

  TI <- sum(cgp)
  # TI <- sum(pgp*(max - (intervals[1:maxgc] - interval)))
  TI <- sum(pgp*(length(intervals[1:maxgc]) -
                   (seq_along(intervals[1:maxgc]) - 1)))


  if (modification == "labouriau") {
    TI <- TI/sum(pgp)
  }

  if (modification == "khanungar") {
    TI <- TI/max(intervals)
  }

  return(TI)
}

#' @rdname TimsonsIndex
#' @export
GermRateGeorge <- function(germ.counts, intervals, partial = TRUE, max) {


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

  # Set max
  if (missing(max)) {
    max <- intervals[length(germ.counts)]
  }

  # Check if argument max is of type numeric with unit length
  if (!is.numeric(max) || length(max) != 1) {
    stop("'max' should be a logical vector of length 1.")
  }

  # Check max argument is present in intervals
  if (!(max %in% intervals)) {
    stop("'max' is not present in 'intervals'.")
  }

  maxgc <- which(intervals == max)
  x <- germ.counts[1:maxgc]

  GR <- sum(cumsum(x))
  GR <- sum(x*(length(intervals[1:maxgc]) -
                 (seq_along(intervals[1:maxgc]) - 1)))

  return(GR)
}

