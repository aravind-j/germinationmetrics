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

#' Emergence Rate Index or Germination Rate Index
#'
#' Compute the Emergence rate index or Germination rate index according to
#' \itemize{ \item
#' \insertCite{shmueliEmergenceEarlyGrowth1971;textual}{germinationmetrics} and
#' it's modification by
#' \insertCite{de_santana_alise_2004;textual}{germinationmetrics}
#' \insertCite{ranal_how_2006}{germinationmetrics}; \item
#' \insertCite{bilbroSoilCrustsCotton1982;textual}{germinationmetrics}; and
#' \item
#' \insertCite{fakoredeRelationSeedlingVigor1980;textual}{germinationmetrics},
#' \insertCite{fakoredeVariabilitySeedlingVigour1981;textual}{germinationmetrics},
#' and
#' \insertCite{fakoredeHeteroticEffectsAssociation1983;textual}{germinationmetrics}.}
#'
#' @section Details: Several germination indices are referred to as Emergence
#'   rate Index (\ifelse{html}{\out{<i>ERI</i>}}{\eqn{ERI}}).
#'
#'   \subsection{\insertCite{shmueliEmergenceEarlyGrowth1971;textual}{germinationmetrics}}{
#'    It is estimated as follows.
#'
#'   \ifelse{html}{\out{<p style="text-align: center;"><em>ERI =
#'   &sum;<sup>k-1</sup><sub style="line-height: 1.8; margin-left:
#'   -3ex;">i=i<sub>0</sub></sub> N<sub>i</sub>(k-i)</em></p>}}{\deqn{ERI =
#'   \sum_{i=i_{0}}^{k-1}N_{i}(k-i)}}
#'
#'   Where, \ifelse{html}{\out{<i>N<sub>i</sub></i>}}{\eqn{N_{i}}} is the number
#'   of seeds germinated in the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th time
#'   interval (not the accumulated number, but the number corresponding to the
#'   \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th interval),
#'   \ifelse{html}{\out{<i>i<sub>0</sub></i>}}{\eqn{i_{0}}} is the time interval
#'   when emergence/germination started, and
#'   \ifelse{html}{\out{<i>k</i>}}{\eqn{k}} is the total number of time
#'   intervals.
#'
#'   A modification for the same was suggested by
#'   \insertCite{de_santana_alise_2004;textual}{germinationmetrics}
#'   \insertCite{ranal_how_2006}{germinationmetrics} and is estimated by
#'   dividing Emergence rate index (\ifelse{html}{\out{<i>ERI</i>}}{\eqn{ERI}})
#'   by total number of emerged seedlings (or germinated seeds) as follows.
#'
#'   \ifelse{html}{\out{<p style="text-align: center;"><em>ERI<sub>mod</sub> =
#'   <sup>&sum;<sup>k-1</sup><sub style="line-height: 1.8; margin-left:
#'   -3ex;">i=i<sub>0</sub></sub> N<sub>i</sub>(k-i)</sup> &frasl;
#'   <sub>N<sub>g</sub></sub> = <sup>ERI</sup> &frasl;
#'   <sub>N<sub>g</sub></sub></em></p>}}{\deqn{ERI_{mod} =
#'   \frac{\sum_{i=i_{0}}^{k-1}N_{i}(k-i)}{N_{g}} = \frac{ERI}{N_{g}}}}
#'
#'   Where, \ifelse{html}{\out{<i>N<sub>g</sub></i>}}{\eqn{N_{g}}} is the total
#'   number of germinated seeds at the end of the test,
#'   \ifelse{html}{\out{<i>N<sub>i</sub></i>}}{\eqn{N_{i}}} is the number of
#'   seeds germinated in the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th time
#'   interval (not the accumulated number, but the number corresponding to the
#'   \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th interval),
#'   \ifelse{html}{\out{<i>i<sub>0</sub></i>}}{\eqn{i_{0}}} is the time interval
#'   when emergence/germination started, and
#'   \ifelse{html}{\out{<i>k</i>}}{\eqn{k}} is the total number of time
#'   intervals. }
#'
#'   \subsection{\insertCite{bilbroSoilCrustsCotton1982;textual}{germinationmetrics}}{
#'    It is the estimated as follows.
#'
#'   \ifelse{html}{\out{<p style="text-align: center;"><em>ERI =
#'   <sup>&sum;<sup>k</sup><sub style="line-height: 1.8; margin-left:
#'   -1ex;">i=1</sub>N<sub>i</sub></sup> &frasl; <sub><span
#'   style="text-decoration:overline">T</span></sub> = <sup>N<sub>g</sub></sup>
#'   &frasl; <sub><span
#'   style="text-decoration:overline">T</span></sub></em></p>}}{\deqn{ERI =
#'   \frac{\sum_{i=1}^{k}N_{i}}{\overline{T}} = \frac{N_{g}}{\overline{T}}}}
#'
#'   Where, \ifelse{html}{\out{<i>N<sub>g</sub></i>}}{\eqn{N_{g}}} is the total
#'   number of germinated seeds at the end of the test,
#'   \ifelse{html}{\out{<i>N<sub>i</sub></i>}}{\eqn{N_{i}}} is the number of
#'   seeds germinated in the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th time
#'   interval (not the accumulated number, but the number corresponding to the
#'   \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th interval), and
#'   \ifelse{html}{\out{<em><span
#'   style="text-decoration:overline">T</span></em>}}{\eqn{\overline{T}}} is the
#'   mean germination time or mean emergence time. }
#'
#'   \subsection{\insertCite{fakoredeRelationSeedlingVigor1980,fakoredeVariabilitySeedlingVigour1981,fakoredeHeteroticEffectsAssociation1983;textual}{germinationmetrics}}{
#'    It is estimated as follows.
#'
#'   \ifelse{html}{\out{<p style="text-align: center;"><em>ERI = <sup><span
#'   style="text-decoration: overline;">T</span></sup> &frasl; <sub>(FGP &frasl;
#'   100)</sub></em></p>}}{\deqn{ERI = \frac{\overline{T}}{FGP/100}}}
#'
#'   Where, \ifelse{html}{\out{<em><span
#'   style="text-decoration:overline">T</span></em>}}{\eqn{\overline{T}}} is the
#'   Mean germination time and \ifelse{html}{\out{<i>FGP</i>}}{\eqn{FGP}} is the
#'   final germination time. }
#'
#'   \subsection{Others}{ Apart from the above the above, the name Emergence
#'   rate index (\ifelse{html}{\out{<i>ERI</i>}}{\eqn{ERI}}) has also been used
#'   to for the mathematical expressions for Speed of germination
#'   (\code{\link[germinationmetrics]{GermSpeed}})
#'   \insertCite{allan_seedling_1962,erbachTillageContinuousCorn1982}{germinationmetrics},
#'    Timson's index (\code{\link[germinationmetrics]{TimsonsIndex}})
#'   \insertCite{chaudharyEffectTemperatureAssociated1970}{germinationmetrics},
#'   and George's index
#'   (\code{\link[germinationmetrics:TimsonsIndex]{GermRateGeorge}})
#'   \insertCite{chopraEffectSoilTemperature1980}{germinationmetrics}. }
#'
#' @inheritParams MeanGermTime
#' @param method The method to be used. Either \code{"melville"},
#'   \code{"melvillesantanaranal"}, \code{"bilbrowanjura"} or \code{"fakorede"}.
#'   Default is \code{"melville"} (see \strong{Details}).
#' @param total.seeds Total number of seeds.
#'
#' @return The value of the Emergence rate index.
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
#' EmergenceRateIndex(germ.counts = x, intervals = int)
#' EmergenceRateIndex(germ.counts = x, intervals = int,
#'                    method = "melville")
#' EmergenceRateIndex(germ.counts = x, intervals = int,
#'                    method = "melvillesantanaranal")
#' EmergenceRateIndex(germ.counts = x, intervals = int,
#'                    method = "bilbrowanjura")
#' EmergenceRateIndex(germ.counts = x, intervals = int,
#'                    total.seeds = 50, method = "fakorede")
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,)
#' EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
#'                    method = "melville")
#' EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
#'                    method = "melvillesantanaranal")
#' EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
#'                    method = "bilbrowanjura")
#' EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
#'                    total.seeds = 50, method = "fakorede")
#'
#' @seealso \code{\link[germinationmetrics]{GermSpeed}},
#'   \code{\link[germinationmetrics]{TimsonsIndex}},
#'   \code{\link[germinationmetrics:TimsonsIndex]{GermRateGeorge}}
#'
#' @rdname EmergenceRateIndex
#' @export
EmergenceRateIndex <- function(germ.counts, intervals, partial = TRUE,
                               total.seeds = NULL,
                               method = c("melville",
                                          "melvillesantanaranal",
                                          "bilbrowanjura",
                                          "fakorede")) {

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

  # Check method
  method <- match.arg(method)

  if (method == "fakorede") {
    # Check if argument total.seeds is of type numeric with unit length
    if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
      stop("'total.seeds' should be a numeric vector of length 1.")
    }
  }

  if (method == "melville") {
    startindex <- min(which(germ.counts != 0))
    Ni <- germ.counts[startindex:(length(germ.counts) - 1)]
    kminusi <- (length(germ.counts) - seq_along(intervals))
    kminusi <- kminusi[startindex:(length(germ.counts) - 1)]
    ERI <- sum(Ni * kminusi)
  }

  if (method == "melvillesantanaranal") {
    startindex <- min(which(germ.counts != 0))
    Ni <- germ.counts[startindex:(length(germ.counts) - 1)]
    kminusi <- (length(germ.counts) - seq_along(intervals))
    kminusi <- kminusi[startindex:(length(germ.counts) - 1)]
    ERI <- sum(Ni * kminusi)/sum(germ.counts)
  }

  if (method == "bilbrowanjura") {
    MGT <- MeanGermTime(germ.counts = germ.counts, intervals = intervals)
    ERI <- sum(germ.counts)/MGT
  }

  if (method == "fakorede") {
    MGT <- MeanGermTime(germ.counts = germ.counts, intervals = intervals)
    FGP <- GermPercent(germ.counts = germ.counts, total.seeds = total.seeds)
    ERI <- MGT/(FGP/100)
  }

  return(ERI)
}
