### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-18, ICAR-NBPGR.
#
# germinationmetrics is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
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

#' Germination Indices
#'
#' Compute germination indices from a data frame of germination counts recorded
#' at specific time intervals for multiple samples in batch.
#'
#' @param data A data frame with the germination count data. It should possess
#'   columns with \itemize{ \item Partial or cumulative germination counts per
#'   time interval (to be indicated by the argument \code{counts.intervals.cols}
#'   and \item Total number of seeds tested (to be indicated by the argument
#'   \code{total.seeds.col}). }
#' @param total.seeds.col The name of the column in \code{data} with the total
#'   number of seeds tested.
#' @param counts.intervals.cols The names of columns in \code{data} with the
#'   germination counts (partial or cumulative, as indicated by the argument
#'   \code{partial}) per time interval (indicated by the argument
#'   \code{intervals}).
#' @param intervals The time intervals at which germination counts (in the
#'   columns specified in argument \code{counts.intervals.cols})  were recorded.
#' @param partial logical. If \code{TRUE}, germination counts in
#'   \code{counts.intervals.cols} is considered as partial and if \code{FALSE},
#'   it is considered as cumulative. Default is \code{TRUE}.
#' @param FirstGermTime logical. If \code{TRUE}, the Time of first germination
#'   or Germination time lag
#'   (\ifelse{html}{\out{<i>t<sub>0</sub></i>}}{\eqn{t_{0}}})
#'   \insertCite{edwards_temperature_1932,czabator_germination_1962,goloff_germination_1975,labouriau_germinacao_1983,ranal_effects_1999,quintanilla_effect_2000}{germinationmetrics}
#'    is computed. Default is \code{TRUE}.
#' @param LastGermTime logical. If \code{TRUE}, the Time of last germination
#'   (\ifelse{html}{\out{<i>t<sub>g</sub></i>}}{\eqn{t_{g}}})
#'   \insertCite{edwards_temperature_1932,labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}.
#'    is computed. Default is \code{TRUE}.
#' @param TimeSpreadGerm logical. If \code{TRUE}, the Time spread of germination
#'   \insertCite{al-mudaris_notes_1998,kader_comparison_2005}{germinationmetrics}
#'    or Germination distribution
#'   \insertCite{schrader_seed_2000}{germinationmetrics}. is computed. Default
#'   is \code{TRUE}.
#' @param PeakGermTime logical. If \code{TRUE}, the Peak time of germination or
#'   Modal time of germination \insertCite{ranal_how_2006}{germinationmetrics}
#'   is computed. Default is \code{TRUE}.
#' @param t50 logical. If \code{TRUE}, the Median germination time
#'   (\ifelse{html}{\out{<em>t<sub>50</sub></em>}}{\eqn{t_{50}}})
#'   \insertCite{coolbear_effect_1984,farooq_thermal_2005}{germinationmetrics}
#'   is computed. Default is \code{TRUE}.
#' @param MeanGermTime logical. If \code{TRUE}, the Mean germination time
#'   (\ifelse{html}{\out{<em><span
#'   style="text-decoration:overline">T</span></em>}}{\eqn{\overline{T}}}) or
#'   Mean length of incubation time
#'   \insertCite{edmond_effects_1958,czabator_germination_1962,ellis_improved_1980,labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}.
#'    or Sprouting index (\ifelse{html}{\out{<i>SI</i>}}{\eqn{SI}})
#'   \insertCite{smith_germinating_1964}{germinationmetrics} or Germination
#'   Resistance (\ifelse{html}{\out{<i>GR</i>}}{\eqn{GR}})
#'   \insertCite{gordon_observations_1969,gordon_germination_1971;textual}{germinationmetrics}
#'    is computed. Default is \code{TRUE}.
#' @param VarGermTime logical. If \code{TRUE}, the Variance of germination time
#'   (\ifelse{html}{\out{<em>s<sup>2</sup><sub style="line-height: 1.8;
#'   margin-left: -1ex;">T</sub></em>}}{\eqn{s_{T}^{2}}})
#'   \insertCite{labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}
#'   is computed. Default is \code{TRUE}.
#' @param SEGermTime logical. If \code{TRUE}, the Standard error of germination
#'   time (\ifelse{html}{\out{<em>s<sub><span
#'   style="text-decoration:overline">T</span></sub></em>}}{\eqn{s_{\overline{T}}}})
#'    \insertCite{labouriau_germinacao_1983,ranal_how_2006}{germinationmetrics}.
#'   is computed. Default is \code{TRUE}.
#' @param CVGermTime logical. If \code{TRUE}, the Coefficient of variation of
#'   the germination time
#'   (\ifelse{html}{\out{<i>CV<sub>T</sub></i>}}{\eqn{CV_{T}}})
#'   \insertCite{ranal_how_2006}{germinationmetrics} is computed. Default is
#'   \code{TRUE}.
#' @param MeanGermRate logical. If \code{TRUE}, the Mean germination rate
#'   (\ifelse{html}{\out{<em><span
#'   style="text-decoration:overline">V</span></em>}}{\eqn{\overline{V}}})
#'   \insertCite{labouriau_germination_1976,labouriau_uma_1983,ranal_how_2006}{germinationmetrics}.
#'    is computed. Default is \code{TRUE}.
#' @param VarGermRate logical. If \code{TRUE}, the Variance of germination rate
#'   (\ifelse{html}{\out{<em>s<sup>2</sup><sub style="line-height: 1.8;
#'   margin-left: -1ex;">V</sub></em>}}{\eqn{s_{V}^{2}}})
#'   \insertCite{labouriau_uma_1983,ranal_how_2006}{germinationmetrics} is
#'   computed. Default is \code{TRUE}.
#' @param SEGermRate logical. If \code{TRUE}, the Standard error of germination
#'   rate (\ifelse{html}{\out{<em>s<sub><span
#'   style="text-decoration:overline">V</span></sub></em>}}{\eqn{s_{\overline{V}}}})
#'    \insertCite{labouriau_uma_1983,ranal_how_2006}{germinationmetrics} is
#'   computed. Default is \code{TRUE}.
#' @param CVG logical. If \code{TRUE}, the Coefficient of velocity/rate of
#'   germination or Kotowski's coefficient of velocity
#'   (\ifelse{html}{\out{<i>CVG</i>}}{\ifelse{html}{\out{<i>CVG</i>}}{\eqn{CVG}}})
#'
#'
#'   \insertCite{kotowski_temperature_1926,nichols_two_1968,labouriau_uma_1983,scott_review_1984,bewley_seeds_1994}{germinationmetrics}.
#'    is computed. Default is \code{TRUE}.
#' @param GermRateRecip logical. If \code{TRUE}, the Germination rate as
#'   reciprocal of median time
#'   (\ifelse{html}{\out{<i>v<sub>50</sub></i>}}{\eqn{v_{50}}})
#'   \insertCite{went_experimental_1957,labouriau_uma_1983,ranal_how_2006}{germinationmetrics}
#'    is computed.
#' @param GermSpeed logical. If \code{TRUE}, the Speed of germination or
#'   Germination rate index or Index of velocity of germination or Germination
#'   index or Emergence rate index
#'   \insertCite{throneberry_relation_1955,maguire_speed_1962,allan_seedling_1962,kendrick_photocontrol_1969,bouton_germination_1976,aosa_seed_1983,khandakar_jute_1983,bradbeer_seed_1988,wardle_allelopathic_1991}{germinationmetrics}
#'    considering both counts and percentages is computed.
#' @param GermSpeedAccumulated logical. If \code{TRUE}, the Speed of accumulated
#'   germination
#'   \insertCite{bradbeer_seed_1988,wardle_allelopathic_1991,haugland_experiments_1996,de_santana_alise_2004}{germinationmetrics}
#'    considering both counts and percentages is computed.
#' @param GermSpeedCorrected logical. If \code{TRUE}, the Corrected speed of
#'   germination or Corrected germination rate index and the Corrected speed of
#'   accumulated germination
#'   \insertCite{evetts_germination_1972}{germinationmetrics} is computed.
#' @param WeightGermPercent logical. If \code{TRUE}, the Weighted germination
#'   percentage \ifelse{html}{\out{<i>WGP</i>}}{\eqn{WGP}} or Weighted
#'   germination index \ifelse{html}{\out{<i>WGI</i>}}{\eqn{WGI}}
#'   \insertCite{reddy_effect_1978,reddy_effect_1985}{germinationmetrics} is
#'   computed.
#' @param MeanGermPercent logical. If \code{TRUE}, the Mean/average germination
#'   percentage per unit time (\ifelse{html}{\out{<em><span
#'   style="text-decoration:overline">GP</span></em>}}{\eqn{\overline{GP}}})
#'   \insertCite{czabator_germination_1962}{germinationmetrics} is computed.
#' @param MeanGermNumber logical. If \code{TRUE}, the Number of seeds germinated
#'   per unit time (\ifelse{html}{\out{<em><span style="text-decoration:
#'   overline">N</span></em>}}{\eqn{\overline{N}}})
#'   \insertCite{khamassi_optimal_2013}{germinationmetrics} is computed.
#' @param TimsonsIndex logical. If \code{TRUE}, the Timson's index or Timson's
#'   germination velocity index
#'   \insertCite{grose_laboratory_1958,timson_new_1965,brown_representing_1988,baskin_seeds_1998}{germinationmetrics}
#'    and it's modifications by Labouriau
#'   \insertCite{ranal_how_2006}{germinationmetrics} and
#'   \insertCite{khan_effect_1984}{germinationmetrics} is computed.
#' @param GermRateGeorge logical. If \code{TRUE}, the George's index
#'   \insertCite{george_influence_1961;textual}{germinationmetrics} is computed.
#' @param max.int The maximum interval value up to which Timson's index/George's
#'   germination rate is to be computed.
#' @param GermIndex logical. If \code{TRUE}, the Germination index according to
#'   \insertCite{melvilleSeedGerminationEarly1980;textual}{germinationmetrics}
#'   and its modification by
#'   \insertCite{de_santana_alise_2004;textual}{germinationmetrics}
#'   \insertCite{ranal_how_2006}{germinationmetrics} are computed.
#' @param EmergenceRateIndex logical. If \code{TRUE}, the Emergence rate index or
#'   Germination rate index are computed according to \itemize{ \item
#'   \insertCite{shmueliEmergenceEarlyGrowth1971;textual}{germinationmetrics}
#'   and it's modification by
#'   \insertCite{de_santana_alise_2004;textual}{germinationmetrics}
#'   \insertCite{ranal_how_2006}{germinationmetrics}; \item
#'   \insertCite{bilbroSoilCrustsCotton1982;textual}{germinationmetrics}; and
#'   \item
#'   \insertCite{fakoredeRelationSeedlingVigor1980;textual}{germinationmetrics},
#'   \insertCite{fakoredeVariabilitySeedlingVigour1981;textual}{germinationmetrics},
#'    and
#'   \insertCite{fakoredeHeteroticEffectsAssociation1983;textual}{germinationmetrics}.}
#' @param PeakValue logical. If \code{TRUE}, the Peak value
#'   (\ifelse{html}{\out{<i>PV</i>}}{\eqn{PV}}) or Emergence Energy
#'   (\ifelse{html}{\out{<i>EE</i>}}{\eqn{EE}})
#'   \insertCite{czabator_germination_1962,bonner_ideal_1967}{germinationmetrics}
#'    is computed.
#' @param GermValue logical. If \code{TRUE}, the Germination value
#'   \insertCite{czabator_germination_1962,djavanshir_germination_1976}{germinationmetrics}
#'    and its modification considering duration from start of test instead of
#'   from onset of germination
#'   \insertCite{brown_representing_1988}{germinationmetrics} is computed.
#' @param gv.k The k Constant for computation of germination value. Default is
#'   10.
#' @param CUGerm logical. If \code{TRUE}, the Coefficient of uniformity of
#'   germination (CUG)
#'   \insertCite{heydecker_seed_1972,bewley_seeds_1994}{germinationmetrics} is
#'   computed.
#' @param GermSynchrony logical. If \code{TRUE}, the Synchrony of germination
#'   (\ifelse{html}{\out{<i>Z</i>}}{\eqn{Z}} index)
#'   \insertCite{primack_longevity_1985,ranal_how_2006}{germinationmetrics} is
#'   computed.
#' @param GermUncertainty logical. If \code{TRUE}, the Synchronization index
#'   (\ifelse{html}{\out{<em><span style="text-decoration:
#'   overline">E</span></em>}}{\eqn{\overline{E}}}) or Uncertainty of the
#'   germination process (\ifelse{html}{\out{<i>U</i>}}{\eqn{U}}) or
#'   Informational entropy (\ifelse{html}{\out{<i>H</i>}}{\eqn{H}})
#'   \insertCite{shannon_mathematical_1948,labouriau_germination_1976,labouriau_uma_1983}{germinationmetrics}
#'    is computed.
#'
#' @return A data frame with the original data along with the various
#'   single-value germination indices specified in the function arguments.
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
#' data(gcdata)
#'
#' counts.per.intervals <- c("Day01", "Day02", "Day03", "Day04", "Day05",
#'                           "Day06", "Day07", "Day08", "Day09", "Day10",
#'                           "Day11", "Day12", "Day13", "Day14")
#' germination.indices(gcdata, total.seeds.col = "Total Seeds",
#'                     counts.intervals.cols = counts.per.intervals,
#'                     intervals = 1:14, partial = TRUE, max.int = 5)
#'
#' @seealso This function is a wrapper around the different functions for
#'   computation of single-value germination indices in
#'   \href{https://cran.r-project.org/package=germinationmetrics}{germinationmetrics}
#'    (\code{\link[germinationmetrics]{FirstGermTime}},
#'   \code{\link[germinationmetrics:FirstGermTime]{LastGermTime}},
#'   \code{\link[germinationmetrics:FirstGermTime]{PeakGermTime}},
#'   \code{\link[germinationmetrics:FirstGermTime]{TimeSpreadGerm}},
#'   \code{\link[germinationmetrics]{t50}},
#'   \code{\link[germinationmetrics]{MeanGermTime}},
#'   \code{\link[germinationmetrics:MeanGermTime]{VarGermTime}},
#'   \code{\link[germinationmetrics:MeanGermTime]{SEGermTime}},
#'   \code{\link[germinationmetrics:MeanGermTime]{CVGermTime}},
#'   \code{\link[germinationmetrics]{MeanGermRate}},
#'   \code{\link[germinationmetrics:MeanGermRate]{CVG}},
#'   \code{\link[germinationmetrics:MeanGermRate]{VarGermRate}},
#'   \code{\link[germinationmetrics:MeanGermRate]{SEGermRate}},
#'   \code{\link[germinationmetrics:MeanGermRate]{GermRateRecip}},
#'   \code{\link[germinationmetrics]{GermSpeed}},
#'   \code{\link[germinationmetrics:GermSpeed]{GermSpeedAccumulated}},
#'   \code{\link[germinationmetrics:GermSpeed]{GermSpeedCorrected}},
#'   \code{\link[germinationmetrics]{WeightGermPercent}},
#'   \code{\link[germinationmetrics]{MeanGermPercent}},
#'   \code{\link[germinationmetrics:GermSpeed]{MeanGermPercent}},
#'   \code{\link[germinationmetrics]{TimsonsIndex}},
#'   \code{\link[germinationmetrics:TimsonsIndex]{GermRateGeorge}},
#'   \code{\link[germinationmetrics]{GermIndex}},
#'   \code{\link[germinationmetrics]{EmergenceRateIndex}},
#'   \code{\link[germinationmetrics]{GermValue}},
#'   \code{\link[germinationmetrics:GermValue]{PeakValue}},
#'   \code{\link[germinationmetrics]{CUGerm}},
#'   \code{\link[germinationmetrics]{GermSynchrony}},
#'   \code{\link[germinationmetrics:GermSynchrony]{GermUncertainty}})
#'
#' @import data.table
#' @export
germination.indices <- function(data, total.seeds.col, counts.intervals.cols,
                                intervals, partial = TRUE,
                                FirstGermTime = TRUE, LastGermTime = TRUE,
                                PeakGermTime = TRUE, TimeSpreadGerm = TRUE,
                                t50 = TRUE, MeanGermTime = TRUE,
                                VarGermTime = TRUE, SEGermTime = TRUE,
                                CVGermTime = TRUE, MeanGermRate = TRUE,
                                CVG = TRUE, VarGermRate = TRUE,
                                SEGermRate = TRUE, GermRateRecip = TRUE,
                                GermSpeed = TRUE, GermSpeedAccumulated = TRUE,
                                GermSpeedCorrected = TRUE,
                                WeightGermPercent = TRUE,
                                MeanGermPercent = TRUE, MeanGermNumber = TRUE,
                                TimsonsIndex = TRUE, GermRateGeorge = TRUE,
                                max.int, GermIndex = TRUE,
                                EmergenceRateIndex = TRUE, PeakValue = TRUE,
                                GermValue = TRUE, gv.k = 10,
                                CUGerm = TRUE, GermSynchrony = TRUE,
                                GermUncertainty = TRUE) {
  # Check if data.frame
  if (!is.data.frame(data)) {
    stop('"data" should be a data frame object.')
  }

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame.')
    data <- as.data.frame(data)
  }

  # Check if total.seeds.col column present in data
  if (!(total.seeds.col %in% colnames(data))) {
    stop(paste('Column ', total.seeds.col,
               ' specified as the total seeds column is not present in "data".',
               sep = ""))
  }

  # Check if intervals.cols columns present in data
  if (FALSE %in% (counts.intervals.cols %in% colnames(data))) {
    stop(paste('The following column(s) specified as germination count per interval are not present in "data":\n',
               paste(counts.intervals.cols[!(counts.intervals.cols %in% colnames(data))], collapse = ", "),
               sep = ""))
  }

  # Check if argument intervals is of type numeric
  if (!is.numeric(intervals)) {
    stop("'intervals' should be a numeric vector.")
  }

  # Check if intervals and counts.intervals.cols are of equal length
  if (length(intervals) != length(counts.intervals.cols)) {
    stop('"intervals" and "counts.intervals.cols" are not of equal length.')
  }

  # Check if intervals are uniform
  idiff <- diff(intervals)
  if (!all(abs(idiff - idiff[[1]]) < .Machine$double.eps ^ 0.5)) {
    warning("'intervals' are not uniform.")
  }

  # Check if total.seeds.col is of type numeric
  if (!is.numeric(data[, total.seeds.col])) {
    stop('"total.seeds.col" is not of type numeric.')
  }

  # Check if total.seeds.col is of type integer
  if (!isTRUE(all.equal(data[, total.seeds.col],
                        as.integer(data[, total.seeds.col])))) {
    warning('"total.seeds.col" possesses non-integer data.')
  }

  # Check for missing values
  missvcols <- unlist(lapply(data[, c(counts.intervals.cols,
                                      total.seeds.col)],
                             function(x) TRUE %in% is.na(x)))
  if (TRUE %in% missvcols) {
    stop(paste('The following column(s) in "data" have missing values:\n',
               paste(names(missvcols[missvcols]), collapse = ", ")))
  }

  # Check if counts.intervals.cols are of type integer or numeric
  inttraitcols <- unlist(lapply(data[, counts.intervals.cols],
                                function(x) FALSE %in% (is.vector(x, mode = "integer") | is.vector(x, mode = "numeric"))))
  if (TRUE %in% inttraitcols) {
    stop(paste('The following column(s) specified as germination count per interval in "data" are not of type numeric:\n',
               paste(names(inttraitcols[inttraitcols]), collapse = ", ")))
  }

  # Warning if counts.intervals.cols are not of type integer
  inttraitcols2 <- unlist(lapply(data[, counts.intervals.cols],
                                 function(x) isTRUE(all.equal(x, as.integer(x)))))
  if (FALSE %in% inttraitcols2) {
    warning(paste('The following column(s) specified as germination count per interval in "data" possess non-integer data:\n',
                  paste(names(inttraitcols2[!inttraitcols2]), collapse = ", ")))
  }

  # Check if argument partial is of type logical with unit length
  if (!is.logical(partial) || length(partial) != 1) {
    stop("'partial' should be a logical vector of length 1.")
  }

  # Convert cumulative to partial
  if (!partial) {
    data[, counts.intervals.cols] <- t(apply(data[, counts.intervals.cols], 1,
           function(x) c(x[1], diff(x))))
  }

  # Check if total.seeds > no. of germinated seeds
  if (any(apply(data[, counts.intervals.cols], 1,
                sum) > data[, total.seeds.col])) {
    inderrorrows <- (1:nrow(data))[apply(data[, counts.intervals.cols], 1,
                                         sum) > data[, total.seeds.col]]
    warning(paste('For the following rows in "data", the total',
                  'number of seeds tested ("total.seeds.col")',
                  'is less than the total number of germinated seeds:',
                  paste(inderrorrows, collapse = ", ")))
  }


  data <- data.table::as.data.table(data)

  data[, GermPercent := GermPercent(germ.counts = unlist(mget(counts.intervals.cols)),
                                    total.seeds = unlist(mget(total.seeds.col)),
                                    partial = TRUE), by = 1:nrow(data)]

  if (FirstGermTime) {
    data[, FirstGermTime := FirstGermTime(germ.counts = unlist(mget(counts.intervals.cols)),
                                          intervals = intervals,
                                          partial = TRUE), by = 1:nrow(data)]
  }

  if (LastGermTime) {
    data[, LastGermTime := LastGermTime(germ.counts = unlist(mget(counts.intervals.cols)),
                                        intervals = intervals,
                                        partial = TRUE), by = 1:nrow(data)]
  }

  if (PeakGermTime) {
    data[, PeakGermTime := paste(PeakGermTime(germ.counts = unlist(mget(counts.intervals.cols)),
                                              intervals = intervals,
                                              partial = TRUE), collapse = ", "),
         by = 1:nrow(data)]
  }

  if (TimeSpreadGerm) {
    data[, TimeSpreadGerm := TimeSpreadGerm(germ.counts = unlist(mget(counts.intervals.cols)),
                                            intervals = intervals,
                                            partial = TRUE), by = 1:nrow(data)]
  }

  if (t50) {
    data[, t50_Coolbear := t50(germ.counts = unlist(mget(counts.intervals.cols)),
                               intervals = intervals,
                               partial = TRUE,
                               method = "coolbear"), by = 1:nrow(data)]

    data[, t50_Farooq := t50(germ.counts = unlist(mget(counts.intervals.cols)),
                               intervals = intervals,
                               partial = TRUE,
                               method = "farooq"), by = 1:nrow(data)]
  }

  if (MeanGermTime) {
    data[, MeanGermTime := MeanGermTime(germ.counts = unlist(mget(counts.intervals.cols)),
                                        intervals = intervals,
                                        partial = TRUE), by = 1:nrow(data)]
  }

  if (VarGermTime) {
    data[, VarGermTime := VarGermTime(germ.counts = unlist(mget(counts.intervals.cols)),
                                      intervals = intervals,
                                      partial = TRUE), by = 1:nrow(data)]
  }

  if (SEGermTime) {
    data[, SEGermTime := SEGermTime(germ.counts = unlist(mget(counts.intervals.cols)),
                                    intervals = intervals,
                                    partial = TRUE), by = 1:nrow(data)]
  }

  if (CVGermTime) {
    data[, CVGermTime := CVGermTime(germ.counts = unlist(mget(counts.intervals.cols)),
                                        intervals = intervals,
                                        partial = TRUE), by = 1:nrow(data)]
  }

  if (MeanGermRate) {
    data[, MeanGermRate := MeanGermRate(germ.counts = unlist(mget(counts.intervals.cols)),
                                    intervals = intervals,
                                    partial = TRUE), by = 1:nrow(data)]
  }

  if (VarGermRate) {
    data[, VarGermRate := VarGermRate(germ.counts = unlist(mget(counts.intervals.cols)),
                                    intervals = intervals,
                                    partial = TRUE), by = 1:nrow(data)]
  }

  if (SEGermRate) {
    data[, SEGermRate := SEGermRate(germ.counts = unlist(mget(counts.intervals.cols)),
                                    intervals = intervals,
                                    partial = TRUE), by = 1:nrow(data)]
  }

  if (CVG) {
    data[, CVG := CVG(germ.counts = unlist(mget(counts.intervals.cols)),
                      intervals = intervals,
                      partial = TRUE), by = 1:nrow(data)]
  }

  if (GermRateRecip) {
    data[, GermRateRecip_Coolbear := GermRateRecip(germ.counts = unlist(mget(counts.intervals.cols)),
                               intervals = intervals,
                               partial = TRUE,
                               method = "coolbear"), by = 1:nrow(data)]

    data[, GermRateRecip_Farooq := GermRateRecip(germ.counts = unlist(mget(counts.intervals.cols)),
                             intervals = intervals,
                             partial = TRUE,
                             method = "farooq"), by = 1:nrow(data)]
  }

  if (GermSpeed) {
    data[, GermSpeed_Count := GermSpeed(germ.counts = unlist(mget(counts.intervals.cols)),
                                         intervals = intervals, percent = FALSE,
                                         partial = TRUE), by = 1:nrow(data)]
    data[, GermSpeed_Percent := GermSpeed(germ.counts = unlist(mget(counts.intervals.cols)),
                                          intervals = intervals, percent = TRUE,
                                          total.seeds = unlist(mget(total.seeds.col)),
                                          partial = TRUE), by = 1:nrow(data)]
  }

  if (GermSpeedAccumulated) {
    data[, GermSpeedAccumulated_Count := GermSpeedAccumulated(germ.counts = unlist(mget(counts.intervals.cols)),
                                                        intervals = intervals,
                                                        percent = FALSE,
                                                        partial = TRUE),
         by = 1:nrow(data)]
    data[, GermSpeedAccumulated_Percent := GermSpeedAccumulated(germ.counts = unlist(mget(counts.intervals.cols)),
                                                        intervals = intervals,
                                                        percent = TRUE,
                                                        total.seeds = unlist(mget(total.seeds.col)),
                                                        partial = TRUE),
         by = 1:nrow(data)]
  }

  if (GermSpeedCorrected) {
    data[, GermSpeedCorrected_Normal := GermSpeedCorrected(germ.counts = unlist(mget(counts.intervals.cols)),
                                                           intervals = intervals,
                                                           partial = TRUE,
                                                           method = "normal",
                                                           total.seeds = unlist(mget(total.seeds.col))),
         by = 1:nrow(data)]
    data[, GermSpeedCorrected_Accumulated := GermSpeedCorrected(germ.counts = unlist(mget(counts.intervals.cols)),
                                                                intervals = intervals,
                                                                partial = TRUE,
                                                                method = "accumulated",
                                                                total.seeds = unlist(mget(total.seeds.col))),
         by = 1:nrow(data)]
  }

  if (WeightGermPercent) {
    data[, WeightGermPercent := WeightGermPercent(germ.counts = unlist(mget(counts.intervals.cols)),
                                              intervals = intervals,
                                              partial = TRUE,
                                              total.seeds = unlist(mget(total.seeds.col))),
         by = 1:nrow(data)]
  }

  if (MeanGermPercent) {
    data[, MeanGermPercent := MeanGermPercent(germ.counts = unlist(mget(counts.intervals.cols)),
                                              intervals = intervals,
                                              partial = TRUE,
                                              total.seeds = unlist(mget(total.seeds.col))),
         by = 1:nrow(data)]
  }

  if (MeanGermNumber) {
    data[, MeanGermNumber := MeanGermNumber(germ.counts = unlist(mget(counts.intervals.cols)),
                                            intervals = intervals,
                                            partial = TRUE), by = 1:nrow(data)]
  }

  if (any(TimsonsIndex, GermRateGeorge)) {
    # Set max.int
    if (missing(max.int)) {
      max.int <- intervals[length(intervals)]
    }

    # Check if argument max is of type numeric with unit length
    if (!is.numeric(max.int) || length(max.int) != 1) {
      stop("'max.int' should be a logical vector of length 1.")
    }
  }

  if (TimsonsIndex) {
    data[, TimsonsIndex := TimsonsIndex(germ.counts = unlist(mget(counts.intervals.cols)),
                                        intervals = intervals,
                                        partial = TRUE,
                                        total.seeds = unlist(mget(total.seeds.col)),
                                        max = max.int, modification = "none"),
         by = 1:nrow(data)]

    data[, TimsonsIndex_Labouriau := TimsonsIndex(germ.counts = unlist(mget(counts.intervals.cols)),
                                                  intervals = intervals,
                                                  partial = TRUE,
                                                  total.seeds = unlist(mget(total.seeds.col)),
                                                  max = max.int,
                                                  modification = "labouriau"),
         by = 1:nrow(data)]

    data[, TimsonsIndex_KhanUngar := TimsonsIndex(germ.counts = unlist(mget(counts.intervals.cols)),
                                                  intervals = intervals,
                                                  partial = TRUE,
                                                  total.seeds = unlist(mget(total.seeds.col)),
                                                  max = max.int,
                                                  modification = "khanungar"),
         by = 1:nrow(data)]
  }

  if (GermRateGeorge) {
    data[, GermRateGeorge := GermRateGeorge(germ.counts = unlist(mget(counts.intervals.cols)),
                                            intervals = intervals,
                                            partial = TRUE, max = max.int),
         by = 1:nrow(data)]
  }

  if (GermIndex) {
    data[, GermIndex := GermIndex(germ.counts = unlist(mget(counts.intervals.cols)),
                                  intervals = intervals, partial = TRUE,
                                  total.seeds = unlist(mget(total.seeds.col)),
                                  modification = "none"),
         by = 1:nrow(data)]

    data[, GermIndex_mod := GermIndex(germ.counts = unlist(mget(counts.intervals.cols)),
                                      intervals = intervals, partial = TRUE,
                                      total.seeds = unlist(mget(total.seeds.col)),
                                      modification = "santanaranal"),
         by = 1:nrow(data)]
  }

  if (EmergenceRateIndex) {
    data[, EmergenceRateIndex_Melville := EmergenceRateIndex(germ.counts = unlist(mget(counts.intervals.cols)),
                                  intervals = intervals, partial = TRUE,
                                  total.seeds = unlist(mget(total.seeds.col)),
                                  method = "melville"),
         by = 1:nrow(data)]

    data[, EmergenceRateIndex_Melville_mod := EmergenceRateIndex(germ.counts = unlist(mget(counts.intervals.cols)),
                                                    intervals = intervals, partial = TRUE,
                                                    total.seeds = unlist(mget(total.seeds.col)),
                                                    method = "melvillesantanaranal"),
         by = 1:nrow(data)]

    data[, EmergenceRateIndex_BilbroWanjura := EmergenceRateIndex(germ.counts = unlist(mget(counts.intervals.cols)),
                                                    intervals = intervals, partial = TRUE,
                                                    total.seeds = unlist(mget(total.seeds.col)),
                                                    method = "bilbrowanjura"),
         by = 1:nrow(data)]

    data[, EmergenceRateIndex_Fakorede := EmergenceRateIndex(germ.counts = unlist(mget(counts.intervals.cols)),
                                                    intervals = intervals, partial = TRUE,
                                                    total.seeds = unlist(mget(total.seeds.col)),
                                                    method = "fakorede"),
         by = 1:nrow(data)]

  }

  if (PeakValue) {
    data[, PeakValue := PeakValue(germ.counts = unlist(mget(counts.intervals.cols)),
                                              intervals = intervals,
                                              partial = TRUE,
                                              total.seeds = unlist(mget(total.seeds.col))),
         by = 1:nrow(data)]
  }

  if (GermValue) {
    # Check if argument gv.k is of type numeric with unit length
    if (!is.numeric(gv.k) || length(gv.k) != 1) {
      stop("'gv.k' should be a numeric vector of length 1.")
    }

    data[, GermValue_Czabator := GermValue(germ.counts = unlist(mget(counts.intervals.cols)),
                                           intervals = intervals,
                                           partial = TRUE, k = gv.k,
                                           from.onset = TRUE,
                                           method = "czabator",
                                           total.seeds = unlist(mget(total.seeds.col)))$`Germination Value`,
         by = 1:nrow(data)]
    data[, GermValue_DP := GermValue(germ.counts = unlist(mget(counts.intervals.cols)),
                                     intervals = intervals,
                                     partial = TRUE, k = gv.k,
                                     from.onset = TRUE, method = "dp",
                                     total.seeds = unlist(mget(total.seeds.col)))$`Germination Value`,
         by = 1:nrow(data)]

    data[, GermValue_Czabator_mod := GermValue(germ.counts = unlist(mget(counts.intervals.cols)),
                                               intervals = intervals,
                                               partial = TRUE, k = gv.k,
                                               from.onset = FALSE,
                                               method = "czabator",
                                               total.seeds = unlist(mget(total.seeds.col)))$`Germination Value`,
         by = 1:nrow(data)]
    data[, GermValue_DP_mod := GermValue(germ.counts = unlist(mget(counts.intervals.cols)),
                                         intervals = intervals,
                                         partial = TRUE, k = gv.k,
                                         from.onset = FALSE, method = "dp",
                                         total.seeds = unlist(mget(total.seeds.col)))$`Germination Value`,
         by = 1:nrow(data)]
  }

  if (CUGerm) {
    data[, CUGerm := CUGerm(germ.counts = unlist(mget(counts.intervals.cols)),
                            intervals = intervals,
                            partial = TRUE), by = 1:nrow(data)]
  }

  if (GermSynchrony) {
    data[, GermSynchrony := GermSynchrony(germ.counts = unlist(mget(counts.intervals.cols)),
                                          intervals = intervals,
                                          partial = TRUE), by = 1:nrow(data)]
  }

  if (GermUncertainty) {
    data[, GermUncertainty := GermUncertainty(germ.counts = unlist(mget(counts.intervals.cols)),
                                              intervals = intervals,
                                              partial = TRUE),
         by = 1:nrow(data)]
  }

  data.table::setDF(data)
  return(data)
}
