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

#' Germination Index
#'
#' Compute the Germination index according to
#' \insertCite{melvilleSeedGerminationEarly1980;textual}{germinationmetrics} and
#' its modification by
#' \insertCite{de_santana_alise_2004;textual}{germinationmetrics}
#' \insertCite{ranal_how_2006}{germinationmetrics}.
#'
#' Germination index (\ifelse{html}{\out{<i>GI</i>}}{\eqn{GI}}) is computed as
#' follows \insertCite{melvilleSeedGerminationEarly1980}{germinationmetrics}.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>GI =
#' &sum;<sup>k</sup><sub style="line-height: 1.8; margin-left: -1ex;">i=1</sub>
#' <sup>|(T<sub>k</sub> &minus; T<sub>i</sub>)N<sub>i</sub>|</sup> &frasl;
#' <sub>N<sub>t</sub></sub></em></p>}}{\deqn{GI = \sum_{i=1}^{k}\frac{\left |
#' \left ( T_{k} - T_{i} \right ) N_{i}\right |}{N_{t}}}}
#'
#' Where, \ifelse{html}{\out{<i>T<sub>i</sub></i>}}{\eqn{T_{i}}} is the time
#' from the start of the experiment to the
#' \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th interval (day for the example),
#' \ifelse{html}{\out{<i>N<sub>i</sub></i>}}{\eqn{N_{i}}} is the number of seeds
#' germinated in the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th time interval (not
#' the accumulated number, but the number corresponding to the
#' \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th interval),
#' \ifelse{html}{\out{<i>N<sub>t</sub></i>}}{\eqn{N_{t}}} is the total number of
#' seeds used in the test, and \ifelse{html}{\out{<i>k</i>}}{\eqn{k}} is the
#' total number of time intervals.
#'
#' A modified germination index
#' (\ifelse{html}{\out{<i>GI<sub>mod</sub></i>}}{\eqn{GI_{mod}}}) was proposed
#' by \insertCite{de_santana_alise_2004}{germinationmetrics} where total number
#' of seeds tested (\ifelse{html}{\out{<i>N<sub>t</sub></i>}}{\eqn{N{t}}}) is
#' replaced by the total number of germinated seeds
#' (\ifelse{html}{\out{<i>N<sub>g</sub></i>}}{\eqn{N{g}}}) in the expression of
#' \insertCite{melvilleSeedGerminationEarly1980;textual}{germinationmetrics} to
#' remove the effect of sample size
#' \insertCite{ranal_how_2006}{germinationmetrics}.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>GI =
#' &sum;<sup>k</sup><sub style="line-height: 1.8; margin-left: -1ex;">i=1</sub>
#' <sup>|(T<sub>k</sub> &minus; T<sub>i</sub>)N<sub>i</sub>|</sup> &frasl;
#' <sub>N<sub>g</sub></sub></em></p>}}{\deqn{GI_{mod} =
#' \sum_{i=1}^{k}\frac{\left | \left ( T_{k} - T_{i} \right ) N_{i}\right
#' |}{N_{g}}}}
#'
#' The term Germination index (\ifelse{html}{\out{<i>GI</i>}}{\eqn{GI}}) has
#' also been used to describe the mathematical expression for Speed of
#' germination (\code{\link[germinationmetrics]{GermSpeed}}) by
#' \insertCite{aosa_seed_1983;textual}{germinationmetrics}.
#'
#' @inheritParams MeanGermTime
#' @param modification The modification to be applied. Either \code{"none"} or
#'   \code{"santanaranal"}. Default is \code{"none"} (see \strong{Details}).
#' @param total.seeds Total number of seeds.
#'
#' @return The value of the Germination index.
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
#' GermIndex(germ.counts = x, intervals = int, total.seeds = 50)
#' GermIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'           modification = "none")
#' GermIndex(germ.counts = x, intervals = int, total.seeds = 50,
#'           modification = "santanaranal")
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' GermIndex(germ.counts = y, intervals = int, partial = FALSE,
#'           total.seeds = 50)
#' GermIndex(germ.counts = y, intervals = int, partial = FALSE,
#'           total.seeds = 50,
#'           modification = "none")
#' GermIndex(germ.counts = y, intervals = int, partial = FALSE,
#'           total.seeds = 50,
#'           modification = "santanaranal")
#'
#' @seealso \code{\link[germinationmetrics]{GermSpeed}}
#'
#' @rdname GermIndex
#' @export
GermIndex <- function(germ.counts, intervals, partial = TRUE,
                      total.seeds,
                      modification = c("none", "santanaranal")) {

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

  # Check modification
  modification <- match.arg(modification)

  Tk <- tail(intervals, n = 1)

  if (modification == "santanaranal") {
    GI <- sum(abs((Tk - intervals) * germ.counts)/sum(germ.counts))
  } else { # modification == "none"
    GI <- sum(abs((Tk - intervals) * germ.counts)/total.seeds)
  }

  return(GI)

}

