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

#' Median germination time
#'
#' Compute the median germination time
#' (\ifelse{html}{\out{<em>t<sub>50</sub></em>}}{\eqn{t_{50}}}). Median
#' germination time is the time to reach 50\% of final/maximum germination.
#'
#' With argument \code{method} specified as \code{"coolbear"}, median
#' germination time is computed according to the formula by
#' \insertCite{coolbear_effect_1984;textual}{germinationmetrics} as follows:
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>t<sub>50</sub> =
#' T<sub>i</sub> + [ <sup>(((<sup>(N+1)</sup> &frasl; <sub>2</sub> ) &minus;
#' N<sub>i</sub>)(T<sub>j</sub> &minus; T<sub>i</sub>))</sup> &frasl;
#' <sub>(N<sub>j</sub> &minus;
#' N<sub>i</sub>)</sub>]</em></p>}}{\deqn{t_{50}=T_{i}+
#' \frac{(\frac{N+1}{2}-N_{i})(T_{j}-T_{i})}{N_{j}-N_{i}}}}
#'
#' Where, \ifelse{html}{\out{<em>t<sub>50</sub></em>}}{\eqn{t_{50}}} is the
#' median germination time, \ifelse{html}{\out{<i>N</i>}}{\eqn{N}} is the final
#' number of germinated seeds and
#' \ifelse{html}{\out{<em>N<sub>i</sub></em>}}{\eqn{N_{i}}} and
#' \ifelse{html}{\out{<em>N<sub>j</sub></em>}}{\eqn{N_{j}}} are the total number
#' of seeds germinated in adjacent counts at time
#' \ifelse{html}{\out{<em>T<sub>i</sub></em>}}{\eqn{T_{i}}} and
#' \ifelse{html}{\out{<em>T<sub>j</sub></em>}}{\eqn{T_{j}}} respectively, when
#' \ifelse{html}{\out{<em>N<sub>i</sub>&nbsp;&lt;&nbsp;<sup>(N+1)</sup>&nbsp;&frasl;&nbsp;<sub>2</sub>&nbsp;&lt;&nbsp;N<sub>j</sub></em>}}{\eqn{N_{i}
#' < \frac{N + 1}{2} < N_{j}}}.
#'
#' Similarly with argument \code{method} specified as \code{"farooq"}, median
#' germination time is computed according to the formula by  by
#' \insertCite{farooq_thermal_2005;textual}{germinationmetrics} as follows:
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>t<sub>50</sub> =
#' T<sub>i</sub> + [ <sup>(((<sup>N</sup> &frasl; <sub>2</sub> ) &minus;
#' N<sub>i</sub>)(T<sub>j</sub> &minus; T<sub>i</sub>))</sup> &frasl;&nbsp;
#' <sub>(N<sub>j</sub> &minus;
#' N<sub>i</sub>)</sub>]</em></p>}}{\deqn{t_{50}=T_{i}+
#' \frac{(\frac{N}{2}-N_{i})(T_{j}-T_{i})}{N_{j}-N_{i}}}}
#'
#' Where, \ifelse{html}{\out{<em>t<sub>50</sub></em>}}{\eqn{t_{50}}} is the
#' median germination time, \ifelse{html}{\out{<i>N</i>}}{\eqn{N}} is the final
#' number of germinated seeds and
#' \ifelse{html}{\out{<em>N<sub>i</sub></em>}}{\eqn{N_{i}}} and
#' \ifelse{html}{\out{<em>N<sub>j</sub></em>}}{\eqn{N_{j}}} are the total number
#' of seeds germinated in adjacent counts at time
#' \ifelse{html}{\out{<em>T<sub>i</sub></em>}}{\eqn{T_{i}}} and
#' \ifelse{html}{\out{<em>T<sub>j</sub></em>}}{\eqn{T_{j}}} respectively, when
#' \ifelse{html}{\out{<em>N<sub>i</sub>&nbsp;&lt;&nbsp;<sup>N</sup>&frasl;<sub>2</sub>&nbsp;&lt;&nbsp;N<sub>j</sub></em>}}{\eqn{N_{i}
#' < \frac{N}{2} < N_{j}}}.
#'
#' @inheritParams MeanGermTime
#' @param method The method for computing median germination time. Either
#'   \code{"coolbear"} or \code{"farooq"}.
#'
#' @return The median germination time
#'   (\ifelse{html}{\out{<em>t<sub>50</sub></em>}}{\eqn{t_{50}}}) value in the
#'   same unit of time as specified in the argument \code{intervals}.
#'
#' @export
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
#' t50(germ.counts = x, intervals = int, method = "coolbear")
#' t50(germ.counts = x, intervals = int, method = "farooq")
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' t50(germ.counts = y, intervals = int, partial = FALSE, method = "coolbear")
#' t50(germ.counts = y, intervals = int, partial = FALSE, method = "farooq")
#'
#' @seealso \code{\link[germinationmetrics]{MeanGermRate}}
#'
t50 <- function(germ.counts, intervals, partial = TRUE,
                        method = c("coolbear", "farooq")) {

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

  x <- germ.counts
  csx <- cumsum(x)

  if (method == "coolbear") {
    xhalf <- (sum(x) + 1)/2
  }

  if (method == "farooq") {
    xhalf <- sum(x)/2
  }

  nearest <- c(match(max(csx[csx <= xhalf]), csx), match(min(csx[csx >= xhalf]), csx))

  if (nearest[2] == nearest[1]) {
    t50 <- as.numeric(intervals[nearest[1]])
  } else {
    if (nearest[2] > nearest[1]) {
      t50 <- intervals[nearest[1]] + ((xhalf - csx[nearest[1]])*(intervals[nearest[2]] - intervals[nearest[1]]))/(csx[nearest[2]] - csx[nearest[1]])
    } else {
      t50 <- NA_real_
    }
  }

  return(unname(t50))

}

