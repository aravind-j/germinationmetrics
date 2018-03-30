### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017, ICAR-NBPGR.
#
# germinationmetrics is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# germinationmetrics is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  https://www.r-project.org/Licenses/


#'Germination Rate
#'
#'Compute the following metrics: \describe{ \item{\code{MeanGermRate}}{Mean
#'germination rate (\ifelse{html}{\out{<em><span
#'style="text-decoration:overline">V</span></em>}}{\eqn{\overline{V}}}).}
#'\item{\code{VarGermRate}}{Variance of germination rate
#'(\ifelse{html}{\out{<em>s<sup>2</sup><sub style="line-height: 1.8;
#'margin-left: -1ex;">V</sub></em>}}{\eqn{s_{V}^{2}}}). }
#'\item{\code{SEGermRate}}{ Standard error of germination rate
#'(\ifelse{html}{\out{<em>s<sub><span
#'style="text-decoration:overline">V</span></sub></em>}}{\eqn{s_{\overline{V}}}}).
#'} \item{\code{CVG}}{Coefficient of velocity/rate of germination or Kotowski's
#'coefficient of velocity
#'(\ifelse{html}{\out{<i>CVG</i>}}{\ifelse{html}{\out{<i>CVG</i>}}{\eqn{CVG}}}).
#'} \item{\code{GermRateRecip}}{Germination rate as reciprocal of median time
#'(\ifelse{html}{\out{<i>v<sub>50</sub></i>}}{\eqn{v_{50}}}).} }
#'
#'\code{MeanGermRate} computes the mean germination rate
#'(\ifelse{html}{\out{<em><span
#'style="text-decoration:overline">V</span></em>}}{\eqn{\overline{V}}})
#'according to the following formula (Labouriau and Viladares, 1976; Labouriau,
#'1983; Ranal and de Santana, 2006).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em><span
#'style="text-decoration: overline;">V</span> = <sup>&sum;<sup>k</sup><sub
#'style="line-height: 1.8; margin-left: -1ex;">i=1</sub> N<sub>i</sub></sup>
#'&frasl; <sub>&sum;<sup>k</sup><sub style="line-height: 1.8; margin-left:
#'-1ex;">i=1</sub>
#'N<sub>i</sub>T<sub>i</sub></sub></em></p>}}{\deqn{\overline{V} =
#'\frac{\sum_{i=1}^{k}N_{i}}{\sum_{i=1}^{k}N_{i}T_{i}}}}
#'
#'Where, \ifelse{html}{\out{<i>T<sub>i</sub></i>}}{\eqn{T_{i}}} is the time from
#'the start of the experiment to the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th
#'observation, \ifelse{html}{\out{<i>N<sub>i</sub></i>}}{\eqn{N_{i}}} is the
#'number of seeds germinated in the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th
#'time (not the accumulated number, but the number correspondent to the
#'\ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th observation) and
#'\ifelse{html}{\out{<i>k</i>}}{\eqn{k}} is the last time of germination.
#'
#'It is the inverse of mean germination time (\ifelse{html}{\out{<em><span
#'style="text-decoration:overline">T</span></em>}}{\eqn{\overline{T}}}).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em><span
#'style="text-decoration: overline;">V</span> = <sup>1</sup> &frasl; <sub><span
#'style="text-decoration:
#'overline;">T</span></sub></em></p>}}{\deqn{\overline{V} =
#'\frac{1}{\overline{T}}}}
#'
#'\code{VarGermRate} computes the variance of germination rate
#'(\ifelse{html}{\out{<em>s<sup>2</sup><sub style="line-height: 1.8;
#'margin-left: -1ex;">V</sub></em>}}{\eqn{s_{V}^{2}}}) according to the
#'following formula (Labouriau, 1983; Ranal and de Santana, 2006).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em>s<sup>2</sup><sub
#'style="line-height: 1.8; margin-left: -1ex;">V</sub> = <span
#'style="text-decoration: overline;">V</span><sup>4</sup> &times;
#'s<sup>2</sup><sub style="line-height: 1.8; margin-left:
#'-1ex;">T</sub></em></p>}}{\deqn{s_{V}^{2} = \overline{V}^{4} \times
#'s_{T}^{2}}}
#'
#'Where, \ifelse{html}{\out{<em>s<sup>2</sup><sub style="line-height: 1.8;
#'margin-left: -1ex;">T</sub></em>}}{\eqn{s_{T}^{2}}} is the variance of
#'germination time.
#'
#'\code{SEGermRate} computes the standard error of germination time
#'(\ifelse{html}{\out{<em>s<sub><span
#'style="text-decoration:overline">V</span></sub></em>}}{\eqn{s_{\overline{V}}}})
#'according to the following formula (Labouriau, 1983; Ranal and de Santana,
#'2006).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em>s<sub><span
#'style="text-decoration: overline;">V</span></sub> = &radic;[
#'<sup>s<sup>2</sup><sub style="line-height: 1.8; margin-left:
#'-1ex;">V</sub></sup> &frasl; <sub>&sum;<sup>k</sup><sub style="line-height:
#'1.8; margin-left: -1ex;">i=1</sub> N<sub>i</sub></sub>
#']</em></p>}}{\deqn{s_{\overline{V}} =
#'\sqrt{\frac{s_{V}^{2}}{\sum_{i=1}^{k}N_{i}}}}}
#'
#'Where, \ifelse{html}{\out{<i>N<sub>i</sub></i>}}{\eqn{N_{i}}} is the number of
#'seeds germinated in the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th time (not the
#'accumulated number, but the number correspondent to the
#'\ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th observation) and
#'\ifelse{html}{\out{<i>k</i>}}{\eqn{k}} is the last time of germination.
#'
#'\code{CVG} computes the coefficient of velocity/rate of germination or
#'Kotowski's coefficient of velocity
#'(\ifelse{html}{\out{<i>CVG</i>}}{\eqn{CVG}}) according to the following
#'formula (Kotowski, 1926; Nichols and Heydecker, 1968; Labouriau, 1983; Scott
#'et al., 1984; Bewley and Black, 1985).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em>CVG =
#'[<sup>&sum;<sup>k</sup><sub style="line-height: 1.8; margin-left:
#'-1ex;">i=1</sub> N<sub>i</sub></sup> &frasl; <sub>&sum;<sup>k</sup><sub
#'style="line-height: 1.8; margin-left: -1ex;">i=1</sub>
#'N<sub>i</sub>T<sub>i</sub></sub>] &times; 100</em></p>}}{\deqn{CVG =
#'\frac{\sum_{i=1}^{k}N_{i}}{\sum_{i=1}^{k}N_{i}T_{i}} \times 100}}
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em>CVG = <span
#'style="text-decoration: overline;">V</span> &times; 100</em></p>}}{\deqn{CVG =
#'\overline{V} \times 100}}
#'
#'Where, \ifelse{html}{\out{<i>T<sub>i</sub></i>}}{\eqn{T_{i}}} is the time from
#'the start of the experiment to the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th
#'observation, \ifelse{html}{\out{<i>N<sub>i</sub></i>}}{\eqn{N_{i}}} is the
#'number of seeds germinated in the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th
#'time (not the accumulated number, but the number correspondent to the
#'\ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th observation) and
#'\ifelse{html}{\out{<i>k</i>}}{\eqn{k}} is the last time of germination.
#'
#'\code{GermRateRecip} computes the germination rate
#'(\ifelse{html}{\out{<em>v<sub>50</sub></em>}}{\eqn{v_{50}}}) as the reciprocal
#'of the median germination time
#'(\ifelse{html}{\out{<em>t<sub>50</sub></em>}}{\eqn{t_{50}}}) (Went, 1957;
#'Labouriau, 1983a; Ranal and de Santana, 2006) computed according to the
#'methods of Coolbear et al., 1984 or Farooq et al., 2005 as follows:
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em>v<sub>50</sub> =
#'<sup>1</sup> &frasl;
#'<sub><em>t<sub>50</sub></em></sub></em></p>}}{\deqn{v_{50} =
#'\frac{1}{t_{50}}}}
#'
#'@inheritParams MeanGermTime
#'@param method The method for computing median germination time. Either
#'  \code{"coolbear"} or \code{"farooq"}.
#'
#'@return For \code{MeanGermRate}, the mean germination rate value as
#'  \ifelse{html}{\out{time<sup>-1</sup>}}{\eqn{\mathrm{time^{-1}}}}.
#'
#'  For \code{VarGermTime}, the variance of germination rate value as
#'  \ifelse{html}{\out{time<sup>-2</sup>}}{\eqn{\mathrm{time^{-2}}}}.
#'
#'  For \code{SEGermTime}, the standard error of germination rate as
#'  \ifelse{html}{\out{time<sup>-1</sup>}}{\eqn{\mathrm{time^{-1}}}}.
#'
#'  For \code{CVG}, the value of Coefficient of of velocity/rate of germination
#'  or Kotowski's coefficient of velocity.
#'
#'  For \code{GermRateRecip}, the value of germination rate as
#'  \ifelse{html}{\out{time<sup>-1</sup>}}{\eqn{\mathrm{time^{-1}}}}.
#'
#'@references
#'
#'\insertRef{kotowski_temperature_1926}{germinationmetrics}
#'
#'\insertRef{went_experimental_1957}{germinationmetrics}
#'
#'\insertRef{nichols_two_1968}{germinationmetrics}
#'
#'\insertRef{labouriau_uma_1983}{germinationmetrics}
#'
#'\insertRef{coolbear_effect_1984}{germinationmetrics}
#'
#'\insertRef{scott_review_1984}{germinationmetrics}
#'
#'\insertRef{bewley_seeds:_1994}{germinationmetrics}
#'
#'\insertRef{farooq_thermal_2005}{germinationmetrics}
#'
#'\insertRef{ranal_how_2006}{germinationmetrics}
#'
#'@name MeanGermRate
#'
#'@examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' MeanGermRate(germ.counts = x, intervals = int)
#' CVG(germ.counts = x, intervals = int)
#' VarGermRate(germ.counts = x, intervals = int)
#' SEGermRate(germ.counts = x, intervals = int)
#' GermRateRecip(germ.counts = x, intervals = int, method = "coolbear")
#' GermRateRecip(germ.counts = x, intervals = int, method = "farooq")
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' MeanGermRate(germ.counts = y, intervals = int, partial = FALSE)
#' CVG(germ.counts = y, intervals = int, partial = FALSE)
#' VarGermRate(germ.counts = y, intervals = int, partial = FALSE)
#' SEGermRate(germ.counts = y, intervals = int, partial = FALSE)
#' GermRateRecip(germ.counts = y, intervals = int,
#'               method = "coolbear", partial = FALSE)
#' GermRateRecip(germ.counts = y, intervals = int,
#'               method = "farooq", partial = FALSE)
#'
#'@seealso \code{\link[germinationmetrics]{MeanGermTime}},
#'  \code{\link[germinationmetrics]{t50}}


#' @rdname MeanGermRate
#' @export
MeanGermRate <- function(germ.counts, intervals, partial = TRUE) {
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
  MGR <- sum(x)/sum(x*intervals)

  return(MGR)
}

#' @rdname MeanGermRate
#' @export
CVG <- function(germ.counts, intervals, partial = TRUE) {

  MGR <- MeanGermRate(germ.counts, intervals, partial)
  CVG <- MGR*100

  return(CVG)

}

#' @rdname MeanGermRate
#' @export
VarGermRate <- function(germ.counts, intervals, partial = TRUE) {

  MGR <- MeanGermRate(germ.counts, intervals, partial)
  VGT <- VarGermTime(germ.counts, intervals, partial)
  VGR <- (MGR^4)*VGT

  return(VGR)

}

#' @rdname MeanGermRate
#' @export
SEGermRate <- function(germ.counts, intervals, partial = TRUE) {

  VGR <- VarGermRate(germ.counts, intervals, partial)
  SEGR <- sqrt(VGR/sum(germ.counts))

  return(SEGR)

}

#' @rdname MeanGermRate
#' @export
GermRateRecip <- function(germ.counts, intervals, partial = TRUE,
                          method = c("coolbear", "farooq")) {

  # Check method argument
  method <-  match.arg(method)

  t50 <- t50(germ.counts, intervals, partial, method)

  GR <- 1/t50

  return(GR)


}
