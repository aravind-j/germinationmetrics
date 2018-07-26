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

#' Time for first, last and peak germination
#'
#' Compute the following metrics: \describe{ \item{\code{FirstGermTime}}{Time of
#' first germination or Germination time lag
#' (\ifelse{html}{\out{<i>t<sub>0</sub></i>}}{\eqn{t_{0}}}) (Edwards, 1932;
#' Czabator, 1962; Goloff and Bazzaz, 1975; Labouriau, 1983; Ranal, 1999;
#' Quintanilla et al., 2000).} \item{\code{LastGermTime}}{Time of last germination
#' (\ifelse{html}{\out{<i>t<sub>g</sub></i>}}{\eqn{t_{g}}}) (Edwards, 1932;
#' Labouriau, 1983; Ranal and de Santana, 2006).} \item{\code{PeakGermTime}}{Time
#' spread of germination (Al-Mudaris, 1998; Kader, 2005).}
#' \item{\code{TimeSpreadGerm}}{Peak time of germination or Modal time of
#' germination (Ranal and de Santana, 2006).} }
#'
#' Time of first germination indicates time of germination of the faster seeds in
#' a seedlot.
#'
#' Lower value of time of first germination indicates faster initiation of
#' germination and lower value of time of last germination indicates faster
#' termination of germination.
#'
#' Time spread of germination (\ifelse{html}{\out{<i>t<sub>g</sub> &minus;
#' t<sub>0</sub></i>}}{\eqn{t_{g}-t_{0}}}) indicates difference between faster
#' and slower germinating members of a sample.
#'
#' Peak time of germination is the time in which highest frequency of germinated
#' seeds are observed. Multiple peak times of germination are possible and if
#' detected are indicated by a warning message.
#'
#' @inheritParams MeanGermTime
#' @return For \code{FirstGermTime}, the time of first germination value in the
#' same unit of time as specified in the argument \code{intervals}.
#'
#' For \code{LastGermTime}, the time of last germination value in the same unit
#' of time as specified in the argument \code{intervals}.
#'
#' For \code{TimeSpreadGerm}, the time spread of germination value in the same
#' unit of time as specified in the argument \code{intervals}.
#'
#' For \code{PeakGermTime}, the time(s) of peak germination value(s) as a
#' numeric vector in the same unit of time as specified in the argument
#' \code{intervals}.
#'
#' @importFrom Rdpack reprompt
#'
#' @references
#'
#' \insertRef{edwards_temperature_1932}{germinationmetrics}
#'
#' \insertRef{czabator_germination_1962}{germinationmetrics}
#'
#' \insertRef{goloff_germination_1975}{germinationmetrics}
#'
#' \insertRef{labouriau_germinacao_1983}{germinationmetrics}
#'
#' \insertRef{al-mudaris_notes_1998}{germinationmetrics}
#'
#' \insertRef{ranal_effects_1999}{germinationmetrics}
#'
#' \insertRef{quintanilla_effect_2000}{germinationmetrics}
#'
#' \insertRef{kader_comparison_2005}{germinationmetrics}
#'
#' \insertRef{ranal_how_2006}{germinationmetrics}
#'
#'
#' @name FirstGermTime
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' z <- c(0, 0, 0, 0, 11, 11, 9, 7, 1, 0, 1, 0, 0, 0)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' FirstGermTime(germ.counts = x, intervals = int)
#' LastGermTime(germ.counts = x, intervals = int)
#' TimeSpreadGerm(germ.counts = x, intervals = int)
#' PeakGermTime(germ.counts = x, intervals = int)
#' # For multiple peak germination times
#' PeakGermTime(germ.counts = z, intervals = int)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' FirstGermTime(germ.counts = y, intervals = int, partial = FALSE)
#' LastGermTime(germ.counts = y, intervals = int, partial = FALSE)
#' TimeSpreadGerm(germ.counts = y, intervals = int, partial = FALSE)
#' PeakGermTime(germ.counts = y, intervals = int, partial = FALSE)
#' # For multiple peak germination time
#' PeakGermTime(germ.counts = cumsum(z), intervals = int, partial = FALSE)
#'


#' @rdname FirstGermTime
#' @export
FirstGermTime <- function(germ.counts, intervals, partial = TRUE) {
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

  df <- data.frame(germ.counts, intervals)

  FGT <- min(which(df$germ.counts != 0))

  return(FGT)
}

#' @rdname FirstGermTime
#' @export
LastGermTime <-  function(germ.counts, intervals, partial = TRUE) {
  # Check if argument germ.counts is of type numeric
  if (!is.numeric(germ.counts)) {
    stop("'germ.counts' should be a numeric vector.")
  }

  # Check if argument intervals is of type numeric
  if (!is.numeric(intervals)) {
    stop("'intervals' should be a numeric vector.")
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

  df <- data.frame(germ.counts, intervals)

  LGT <- max(which(df$germ.counts != 0))

  return(LGT)
}

#' @rdname FirstGermTime
#' @export
PeakGermTime <- function(germ.counts, intervals, partial = TRUE) {
  # Check if argument germ.counts is of type numeric
  if (!is.numeric(germ.counts)) {
    stop("'germ.counts' should be a numeric vector.")
  }

  # Check if argument intervals is of type numeric
  if (!is.numeric(intervals)) {
    stop("'intervals' should be a numeric vector.")
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
  PGT <- intervals[which(x %in% max(x))]

  if (length(PGT) > 1) {
    warning("Multiple peak germination times exist.")
  }

  return(PGT)
}

#' @rdname FirstGermTime
#' @export
TimeSpreadGerm <-  function(germ.counts, intervals, partial = TRUE) {

  FGT <- FirstGermTime(germ.counts, intervals, partial)
  LGT <- LastGermTime(germ.counts, intervals, partial)

  TSG <- LGT - FGT

  return(TSG)
}
