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

#' Speed of germination
#'
#' Compute the following metrics: \describe{ \item{\code{GermSpeed}}{Speed of
#' germination or Germination rate index or Index of velocity of germination or
#' Germination index
#' \insertCite{kendrick_photocontrol_1969,aosa_seed_1983}{germinationmetrics} }
#' \item{\code{GermSpeedAccumulated}}{Speed of accumulated germination
#' \insertCite{bradbeer_seed_1988,wardle_allelopathic_1991,haugland_experiments_1996,de_santana_alise_2004}{germinationmetrics}
#' } \item{\code{GermSpeedCorrected}}{Corrected speed of germination or
#' Corrected germination rate index
#' \insertCite{evetts_germination_1972}{germinationmetrics}} }
#'
#' \code{GermSpeed} computes the speed of germination according to the following
#' formula
#' \insertCite{throneberry_relation_1955,maguire_speed_1962,kendrick_photocontrol_1969,aosa_seed_1983,khandakar_jute_1983,bradbeer_seed_1988,wardle_allelopathic_1991}{germinationmetrics}.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><i>S =
#' <sup>N<sub>1</sub></sup>&frasl;<sub>T<sub>1</sub></sub>+<sup>N<sub>2</sub></sup>&frasl;<sub>T<sub>2</sub></sub>+<sup>N<sub>3</sub></sup>&frasl;<sub>T<sub>3</sub></sub>+
#' &hellip;+<sup>N<sub>n</sub></sup>&frasl;<sub>T<sub>n</sub></sub></i></p>}}{\deqn{S
#' = \frac{N_{1}}{T_{1}} + \frac{N_{2}}{T_{2}} + \frac{N_{3}}{T_{3}} + \cdots +
#' \frac{N_{n}}{T_{n}}}}
#'
#' Where, \ifelse{html}{\out{N<sub>1</sub>}}{\eqn{N_{1}}},
#' \ifelse{html}{\out{N<sub>2</sub>}}{\eqn{N_{2}}},
#' \ifelse{html}{\out{N<sub>3</sub>}}{\eqn{N_{3}}},
#' \ifelse{html}{\out{&hellip;}}{\eqn{\cdots}},
#' \ifelse{html}{\out{N<sub>n</sub>}}{\eqn{N_{n}}} are the number of germinated
#' seeds observed at time (days or hours)
#' \ifelse{html}{\out{T<sub>1</sub>}}{\eqn{T_{1}}},
#' \ifelse{html}{\out{T<sub>2</sub>}}{\eqn{T_{2}}},
#' \ifelse{html}{\out{T<sub>3</sub>}}{\eqn{T_{3}}},
#' \ifelse{html}{\out{&hellip;}}{\eqn{\cdots}},
#' \ifelse{html}{\out{T<sub>n</sub>}}{\eqn{T_{n}}} after sowing. (Not
#' accumulated/cumulative number, but the number of seeds that germinated at the
#' specific time).
#'
#' Speed of germination expresses the rate of germination in terms of the total
#' number of seeds that germinate in a time interval. Higher values indicate
#' greater and faster germination. This is useful for comparisons only when
#' samples or treatments possess similar germinabilities. This is overcome by
#' using the corrected speed of germination.
#'
#' \code{GermSpeedCorrected} computes the corrected speed of germination as
#' follows \insertCite{evetts_germination_1972}{germinationmetrics}.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><i>S<sub>corrected</sub> =
#' <sup>S</sup>&frasl;<sub>FGP</sub></i><p>}}{\deqn{S_{corrected} =
#' \frac{S}{FGP} }}
#'
#' Where, \ifelse{html}{\out{<i>FGP</i>}}{\eqn{FGP}} is the final germination
#' percentage or germinability.
#'
#' \code{GermSpeedAccumulated} computes the speed of accumulated germination as
#' follows
#' \insertCite{bradbeer_seed_1988,wardle_allelopathic_1991,haugland_experiments_1996,de_santana_alise_2004}{germinationmetrics}.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><i>S =
#' <sup>N<sub>1</sub></sup>&frasl;<sub>T<sub>1</sub></sub> +
#' <sup>[N<sub>1</sub>+N<sub>2</sub>]</sup>&frasl;<sub>T<sub>2</sub></sub> +
#' <sup>[N<sub>1</sub>+N<sub>2</sub>+N<sub>3</sub>]</sup>&frasl;<sub>T<sub>3</sub></sub>
#' + &hellip;+ <sup>[N<sub>1</sub>+N<sub>2</sub>+
#' &hellip;+N<sub>n</sub>]</sup>&frasl;<sub>T<sub>n</sub></sub></i></p>}}{\deqn{S_{accumulated}
#' = \frac{N_{1}}{T_{1}} + \frac{N_{1} + N_{2}}{T_{2}} + \frac{N_{1} + N_{2} +
#' N_{3}}{T_{3}} + \cdots +\frac{N_{1} + N_{2} + \cdots + N_{n}}{T_{n}}}}
#'
#' Where, \ifelse{html}{\out{N<sub>1</sub>}}{\eqn{N_{1}}},
#' \ifelse{html}{\out{N<sub>2</sub>}}{\eqn{N_{2}}},
#' \ifelse{html}{\out{N<sub>3</sub>}}{\eqn{N_{3}}},
#' \ifelse{html}{\out{&hellip;}}{\eqn{\cdots}},
#' \ifelse{html}{\out{N<sub>n</sub>}}{\eqn{N_{n}}} are the number of germinated
#' seeds observed at time (days or hours)
#' \ifelse{html}{\out{T<sub>1</sub>}}{\eqn{T_{1}}},
#' \ifelse{html}{\out{T<sub>2</sub>}}{\eqn{T_{2}}},
#' \ifelse{html}{\out{T<sub>3</sub>}}{\eqn{T_{3}}},
#' \ifelse{html}{\out{&hellip;}}{\eqn{\cdots}},
#' \ifelse{html}{\out{T<sub>n</sub>}}{\eqn{T_{n}}} after sowing. (Not
#' accumulated/cumulative number, but the number of seeds that germinated at the
#' specific time).
#'
#' @inheritParams MeanGermTime
#' @param total.seeds Total number of seeds.
#'
#' @return For \code{GermSpeed}, the value of germination speed as \%
#'   \ifelse{html}{\out{time<sup>-1</sup>}}{\eqn{\mathrm{time^{-1}}}}.
#'
#'   For \code{GermSpeedAccumulated}, the value of accumulated germination speed
#'   as \% \ifelse{html}{\out{time<sup>-1</sup>}}{\eqn{\mathrm{time^{-1}}}}.
#'
#'   For \code{GermSpeedCorrected}, the corrected speed of germination.
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
#' GermSpeedCorrected(germ.counts = x, intervals = int, total.seeds = 50)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' GermSpeed(germ.counts = y, intervals = int, partial = FALSE)
#' GermSpeedAccumulated(germ.counts = y, intervals = int, partial = FALSE)
#' GermSpeedCorrected(germ.counts = y, intervals = int,
#'                    partial = FALSE, total.seeds = 50)

#' @rdname GermSpeed
#' @export
#GerminationIndexAOSA
GermSpeed <- function(germ.counts, intervals, partial = TRUE) {
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

  x <- germ.counts
  speed <- sum(x/intervals)
  return(speed)
}

#' @rdname GermSpeed
#' @export
GermSpeedAccumulated <- function(germ.counts, intervals, partial = TRUE) {
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

  x <- germ.counts
  aspeed <- sum(cumsum(x)/intervals)
  return(aspeed)
}

#' @rdname GermSpeed
#' @export
GermSpeedCorrected <- function(germ.counts, intervals, partial = TRUE,
                               total.seeds) {
  # Check if argument total.seeds is of type numeric with unit length
  if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
    stop("'total.seeds' should be a numeric vector of length 1.")
  }

  speed <- GermSpeed(germ.counts, intervals, partial)
  gp <- GermPercent(germ.counts = germ.counts, total.seeds = 50)
  cspeed <- speed/gp

  return(cspeed)
}
