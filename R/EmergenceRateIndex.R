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
#' \loadmathjax
#'
#' @section Details: Several germination indices are referred to as Emergence
#'   rate Index (\mjseqn{ERI}).
#'
#'   \subsection{\insertCite{shmueliEmergenceEarlyGrowth1971;textual}{germinationmetrics}}{
#'    With argument \code{method} specified as \code{"shmueligoldberg"}
#'   \mjseqn{ERI} is estimated as follows.
#'
#'   \mjsdeqn{ERI = \sum_{i=i_{0}}^{k-1}N_{i}(k-i)}
#'
#'   Where, \mjseqn{N_{i}} is the number of seeds germinated in the \mjseqn{i}th
#'   time interval (not the accumulated number, but the number corresponding to
#'   the \mjseqn{i}th interval), \mjseqn{i_{0}} is the time interval when
#'   emergence/germination started, and \mjseqn{k} is the total number of time
#'   intervals.
#'
#'   A modification for the same was suggested by
#'   \insertCite{de_santana_alise_2004;textual}{germinationmetrics}
#'   \insertCite{ranal_how_2006}{germinationmetrics} and is estimated by
#'   dividing Emergence rate index (\mjseqn{ERI}) by total number of emerged
#'   seedlings (or germinated seeds) as follows with argument \code{method}
#'   specified as \code{"sgsantanaranal"}).
#'
#'   \mjsdeqn{ERI_{mod} = \frac{\sum_{i=i_{0}}^{k-1}N_{i}(k-i)}{N_{g}} =
#'   \frac{ERI}{N_{g}}}
#'
#'   Where, \mjseqn{N_{g}} is the total number of germinated seeds at the end of
#'   the test, \mjseqn{N_{i}} is the number of seeds germinated in the
#'   \mjseqn{i}th time interval (not the accumulated number, but the number
#'   corresponding to the \mjseqn{i}th interval), \mjseqn{i_{0}} is the time
#'   interval when emergence/germination started, and \mjseqn{k} is the total
#'   number of time intervals. }
#'
#'   \subsection{\insertCite{bilbroSoilCrustsCotton1982;textual}{germinationmetrics}}{
#'    With argument \code{method} specified as \code{"bilbrowanjura"}
#'   \mjseqn{ERI} is the estimated as follows.
#'
#'   \mjsdeqn{ERI = \frac{\sum_{i=1}^{k}N_{i}}{\overline{T}} =
#'   \frac{N_{g}}{\overline{T}}}
#'
#'   Where, \mjseqn{N_{g}} is the total number of germinated seeds at the end of
#'   the test, \mjseqn{N_{i}} is the number of seeds germinated in the
#'   \mjseqn{i}th time interval (not the accumulated number, but the number
#'   corresponding to the \mjseqn{i}th interval), and \mjseqn{\overline{T}} is
#'   the mean germination time or mean emergence time. }
#'
#'   \subsection{\insertCite{fakoredeRelationSeedlingVigor1980,fakoredeVariabilitySeedlingVigour1981,fakoredeHeteroticEffectsAssociation1983;textual}{germinationmetrics}}{
#'    With argument \code{method} specified as \code{"fakorede"} \mjseqn{ERI} is
#'   the estimated as follows.
#'
#'   \mjsdeqn{ERI = \frac{\overline{T}}{FGP/100}}
#'
#'   Where, \mjseqn{\overline{T}} is the Mean germination time and \mjseqn{FGP}
#'   is the final germination time. }
#'
#'   \subsection{Others}{ Apart from the above the above, the name Emergence
#'   rate index (\mjseqn{ERI}) has also been used to for the mathematical
#'   expressions for Speed of germination
#'   (\code{\link[germinationmetrics]{GermSpeed}})
#'   \insertCite{allan_seedling_1962,erbachTillageContinuousCorn1982}{germinationmetrics},
#'    Timson's index (\code{\link[germinationmetrics]{TimsonsIndex}})
#'   \insertCite{chaudharyEffectTemperatureAssociated1970}{germinationmetrics},
#'   and George's index
#'   (\code{\link[germinationmetrics:TimsonsIndex]{GermRateGeorge}})
#'   \insertCite{chopraEffectSoilTemperature1980}{germinationmetrics}. }
#'
#' @inheritParams MeanGermTime
#' @param method The method to be used. Either \code{"shmueligoldberg"},
#'   \code{"sgsantanaranal"}, \code{"bilbrowanjura"} or \code{"fakorede"}.
#'   Default is \code{"shmueligoldberg"} (see \strong{Details}).
#' @param total.seeds Total number of seeds.
#'
#' @return The value of the Emergence rate index with the units according to
#'   \code{method} as follows.
#'
#'   \item{\code{shmueligoldberg}}{\mjseqn{\mathrm{count}}}
#'   \item{\code{sgsantanaranal}}{\mjseqn{\mathrm{no \, unit}}}
#'   \item{\code{bilbrowanjura}}{\mjseqn{\mathrm{count} \, time^{-1}}}
#'   \item{\code{fakorede}}{\mjseqn{time \, \mathrm{count}^{-1}}}
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
#'                    method = "shmueligoldberg")
#' EmergenceRateIndex(germ.counts = x, intervals = int,
#'                    method = "sgsantanaranal")
#' EmergenceRateIndex(germ.counts = x, intervals = int,
#'                    method = "bilbrowanjura")
#' EmergenceRateIndex(germ.counts = x, intervals = int,
#'                    total.seeds = 50, method = "fakorede")
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,)
#' EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
#'                    method = "shmueligoldberg")
#' EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
#'                    method = "sgsantanaranal")
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
                               method = c("shmueligoldberg",
                                          "sgsantanaranal",
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

  # Warning for depreciated method choices
  if (length(method) == 1 && method == "melville") {
    method <- "shmueligoldberg"
    warning('Argument `method = "melville"` is depreciated as of 0.1.6\n',
            'Please use `method = "shmueligoldberg"` instead.')
  }

  if (length(method) == 1 && method == "melvillesantanaranal") {
    method <- "sgsantanaranal"
    warning('Argument `method = "melvillesantanaranal"` is depreciated as of 0.1.6\n',
            'Please use `method = "sgsantanaranal"` instead.')
  }

  # Check method
  method <- match.arg(method)

  if (method == "fakorede") {
    # Check if argument total.seeds is of type numeric with unit length
    if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
      stop("'total.seeds' should be a numeric vector of length 1.")
    }
  }

  if (method == "shmueligoldberg") {
    startindex <- min(which(germ.counts != 0))
    Ni <- germ.counts[startindex:(length(germ.counts) - 1)]
    kminusi <- (length(germ.counts) - seq_along(intervals))
    kminusi <- kminusi[startindex:(length(germ.counts) - 1)]
    ERI <- sum(Ni * kminusi)
  }

  if (method == "sgsantanaranal") {
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
