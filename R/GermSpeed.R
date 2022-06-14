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

#' Speed of germination
#'
#' Compute the following metrics: \describe{ \item{\code{GermSpeed}}{Speed of
#' germination or Germination rate index or Index of velocity of germination or
#' Germination index or Emergence rate index
#' \insertCite{throneberry_relation_1955,maguire_speed_1962,allan_seedling_1962,kendrick_photocontrol_1969,bouton_germination_1976,erbachTillageContinuousCorn1982,aosa_seed_1983,khandakar_jute_1983,hsu_planting_1986,bradbeer_seed_1988,wardle_allelopathic_1991}{germinationmetrics}.
#' } \item{\code{GermSpeedAccumulated}}{Speed of accumulated germination
#' \insertCite{bradbeer_seed_1988,wardle_allelopathic_1991,haugland_experiments_1996,de_santana_alise_2004}{germinationmetrics}.
#' } \item{\code{GermSpeedCorrected}}{Corrected speed of germination or
#' Corrected germination rate index
#' \insertCite{evetts_germination_1972}{germinationmetrics}.} } \loadmathjax
#'
#' \code{GermSpeed} computes the speed of germination according to the following
#' formula
#' \insertCite{throneberry_relation_1955,maguire_speed_1962,allan_seedling_1962,kendrick_photocontrol_1969,bouton_germination_1976,erbachTillageContinuousCorn1982,aosa_seed_1983,khandakar_jute_1983,hsu_planting_1986,bradbeer_seed_1988,wardle_allelopathic_1991}{germinationmetrics}.
#'
#' \mjsdeqn{S = \frac{N_{1}}{T_{1}} + \frac{N_{2}}{T_{2}} + \frac{N_{3}}{T_{3}}
#' + \cdots + \frac{N_{k}}{T_{k}}}
#'
#' Where, \mjseqn{N_{1}}, \mjseqn{N_{2}}, \mjseqn{N_{3}}, \mjseqn{\cdots},
#' \mjseqn{N_{k}} are the number of germinated seeds observed at time (days or
#' hours) \mjseqn{T_{1}}, \mjseqn{T_{2}}, \mjseqn{T_{3}}, \mjseqn{\cdots},
#' \mjseqn{T_{k}} after sowing (Not accumulated/cumulative number, but the
#' number of seeds that germinated at the specific time) and \mjseqn{k} is the
#' total number of time intervals.
#'
#' It is the same as Emergence Rate Index (\mjseqn{ERI}) described by
#' \insertCite{allan_seedling_1962;textual}{germinationmetrics},
#' \insertCite{erbachTillageContinuousCorn1982;textual}{germinationmetrics} and
#' \insertCite{hsu_planting_1986;textual}{germinationmetrics} as well as
#' Germination Index (\mjseqn{GI}) according to
#' \insertCite{aosa_seed_1983;textual}{germinationmetrics}.
#'
#' The formula can also be described as follows.
#'
#' \mjsdeqn{S = \sum_{i=1}^{k}\frac{N_{i}}{T_{i}}}
#'
#' Where, \mjseqn{T_{i}} is the time from the start of the experiment to the
#' \mjseqn{i}th interval, \mjseqn{N_{i}} is the number of seeds germinated in
#' the \mjseqn{i}th time interval (not the accumulated number, but the number
#' corresponding to the \mjseqn{i}th interval), and \mjseqn{k} is the total
#' number of time intervals.
#'
#' \code{GermSpeedAccumulated} computes the speed of accumulated germination as
#' follows
#' \insertCite{bradbeer_seed_1988,wardle_allelopathic_1991,haugland_experiments_1996,de_santana_alise_2004}{germinationmetrics}.
#'
#' \mjsdeqn{S_{accumulated} = \frac{N_{1}}{T_{1}} + \frac{N_{1} + N_{2}}{T_{2}}
#' + \frac{N_{1} + N_{2} + N_{3}}{T_{3}} + \cdots +\frac{N_{1} + N_{2} + \cdots
#' + N_{k}}{T_{k}}}
#'
#' Where, \mjseqn{N_{1}}, \mjseqn{N_{2}}, \mjseqn{N_{3}}, \mjseqn{\cdots},
#' \mjseqn{N_{k}} are the number of germinated seeds observed at time (days or
#' hours) \mjseqn{T_{1}}, \mjseqn{T_{2}}, \mjseqn{T_{3}}, \mjseqn{\cdots},
#' \mjseqn{T_{k}} after sowing (Not accumulated/cumulative number, but the
#' number of seeds that germinated at the specific time), and \mjseqn{k} is the
#' total number of time intervals.
#'
#' The formula can also be described as follows.
#'
#' \mjsdeqn{S_{accumulated} = \sum_{i=1}^{k}\frac{\sum_{j=1}^{i}N_{j}}{T_{i}}}
#'
#' Where, \mjseqn{T_{i}} is the time from the start of the experiment to the
#' \mjseqn{i}th interval, \mjseqn{\sum_{j=1}^{i}N_{j}} is the
#' cumuative/accumulated number of seeds germinated in the \mjseqn{i}th time
#' interval, and \mjseqn{k} is the total number of time intervals.
#'
#' Speed of germination expresses the rate of germination in terms of the total
#' number of seeds that germinate in a time interval. Higher values indicate
#' greater and faster germination. This is useful for comparisons only when
#' samples or treatments possess similar germinabilities. This is overcome by
#' either using the corrected speed of germination or by using germination
#' percentages instead of counts for computing speed.
#'
#' \code{GermSpeedCorrected} computes the corrected speed of germination as
#' follows \insertCite{evetts_germination_1972}{germinationmetrics}.
#'
#' \mjsdeqn{S_{corrected} = \frac{S}{FGP}}
#'
#' Where, \mjseqn{S} is the germination speed (either standard or accumulated as
#' specified by the argument  \code{method = "normal"} or \code{method =
#' "accumulated"} respectively) computed with germination percentage instead of
#' counts and \mjseqn{FGP} is the final germination percentage or germinability.
#'
#' With \code{percent = TRUE}, germination percentage is used instead of counts
#' for computation in \code{GermSpeed} and \code{GermSpeedAccumulated}. In case
#' of \code{GermSpeedCorrected}, germination percentage is always used for the
#' numerator.
#'
#' @inheritParams MeanGermTime
#' @param percent logical. If \code{TRUE}, germination percentage is used
#'   instead of counts for computation. Default is \code{FALSE}.
#' @param total.seeds Total number of seeds. Mandatory for computation when
#'   \code{percent = TRUE}.
#' @param method The method for computing germination speed in
#'   \code{GermSpeedCorrected}. Either \code{"normal"} (\code{GermSpeed}) or
#'   \code{"accumulated"} (\code{GermSpeedAccumulated}).
#'
#' @return For \code{GermSpeed}, the value of germination speed as
#'   \mjseqn{\mathrm{count \, time^{-1}}} or \% \mjseqn{\mathrm{time^{-1}}}.
#'
#'   For \code{GermSpeedAccumulated}, the value of accumulated germination speed
#'   as \mjseqn{\mathrm{count \, time^{-1}}} or \% \mjseqn{\mathrm{time^{-1}}}.
#'
#'   For \code{GermSpeedCorrected}, the corrected speed of germination as
#'   \mjseqn{\mathrm{time^{-1}}}.
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @name GermSpeed
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' GermSpeed(germ.counts = x, intervals = int)
#' GermSpeedAccumulated(germ.counts = x, intervals = int)
#' GermSpeedCorrected(germ.counts = x, intervals = int, total.seeds = 50,
#'                    method = "normal")
#' GermSpeedCorrected(germ.counts = x, intervals = int, total.seeds = 50,
#'                    method = "accumulated")
#'
#' # From partial germination counts (with percentages instead of counts)
#' #----------------------------------------------------------------------------
#' GermSpeed(germ.counts = x, intervals = int,
#'           percent = TRUE, total.seeds = 50)
#' GermSpeedAccumulated(germ.counts = x, intervals = int,
#'                      percent = TRUE, total.seeds = 50)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' GermSpeed(germ.counts = y, intervals = int, partial = FALSE)
#' GermSpeedAccumulated(germ.counts = y, intervals = int, partial = FALSE)
#' GermSpeedCorrected(germ.counts = y, intervals = int,
#'                    partial = FALSE, total.seeds = 50, method = "normal")
#' GermSpeedCorrected(germ.counts = y, intervals = int,
#'                    partial = FALSE, total.seeds = 50, method = "accumulated")
#'
#' # From cumulative germination counts (with percentages instead of counts)
#' #----------------------------------------------------------------------------
#' GermSpeed(germ.counts = y, intervals = int, partial = FALSE,
#'           percent = TRUE, total.seeds = 50)
#' GermSpeedAccumulated(germ.counts = y, intervals = int, partial = FALSE,
#'                      percent = TRUE, total.seeds = 50)

#' @rdname GermSpeed
#' @export
#GerminationIndexAOSA
GermSpeed <- function(germ.counts, intervals, partial = TRUE,
                      percent = FALSE, total.seeds = NULL) {
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

  # Check if argument percent is of type logical with unit length
  if (!is.logical(percent) || length(percent) != 1) {
    stop("'percent' should be a logical vector of length 1.")
  }

  if (percent) {
    # Check if argument total.seeds is of type numeric with unit length
    if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
      stop("'total.seeds' should be a numeric vector of length 1.")
    }
  x <- (x / total.seeds) * 100
  }

  speed <- sum(x/intervals)
  return(speed)
}

#' @rdname GermSpeed
#' @export
GermSpeedAccumulated <- function(germ.counts, intervals, partial = TRUE,
                                 percent = FALSE, total.seeds = NULL) {
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

  # Check if argument percent is of type logical with unit length
  if (!is.logical(percent) || length(percent) != 1) {
    stop("'percent' should be a logical vector of length 1.")
  }

  if (percent) {
    # Check if argument total.seeds is of type numeric with unit length
    if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
      stop("'total.seeds' should be a numeric vector of length 1.")
    }
    x <- (x / total.seeds) * 100
  }

  aspeed <- sum(cumsum(x)/intervals)
  return(aspeed)
}

#' @rdname GermSpeed
#' @export
GermSpeedCorrected <- function(germ.counts, intervals, partial = TRUE,
                               total.seeds,
                               method = c("normal", "accumulated")) {
  # Check if argument total.seeds is of type numeric with unit length
  if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
    stop("'total.seeds' should be a numeric vector of length 1.")
  }

  # Check method
  method <- match.arg(method)

  if (method == "normal") {
    speed <- GermSpeed(germ.counts, intervals, partial,
                       total.seeds = total.seeds, percent = TRUE)
  }

  if (method == "accumulated") {
    speed <- GermSpeedAccumulated(germ.counts, intervals, partial,
                                  total.seeds = total.seeds, percent = TRUE)
  }

  gp <- GermPercent(germ.counts = germ.counts, total.seeds = total.seeds,
                    partial = partial)
  cspeed <- speed/gp

  return(cspeed)
}
