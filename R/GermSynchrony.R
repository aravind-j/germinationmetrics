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


#'Synchrony and uncertainty of germination
#'
#'Compute the following metrics:\itemize{ \item Synchrony of germination
#'(\ifelse{html}{\out{<i>Z</i>}}{\eqn{Z}} index) \item Synchronization index (\ifelse{html}{\out{<em><span
#'style="text-decoration: overline">E</span></em>}}{\eqn{\overline{E}}}) or
#'Uncertainty of the germination process (\ifelse{html}{\out{<i>U</i>}}{\eqn{U}}) or Informational entropy
#'(\ifelse{html}{\out{<i>H</i>}}{\eqn{H}})}.
#'
#'\code{GermSynchrony} computes the value of synchrony of germination (\ifelse{html}{\out{<i>Z</i>}}{\eqn{Z}}
#'index) as follows (Primack, 1980; Ranal and Santana, 2006).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em>Z =
#'<sup>&sum;<sup>k</sup><sub style="line-height: 1.8; margin-left:
#'-1ex;">i=1</sub>C<sub>N<sub>i</sub>,2</sub></sup>
#'&frasl;<sub>C<sub>&sum;N<sub>i</sub>,2</sub></sub></em></p>}}{\deqn{Z=\frac{\sum_{i=1}^{k}C_{N_{i},2}}{C_{\Sigma
#'N_{i},2}}}}
#'
#'Where,
#'\ifelse{html}{\out{<i>C<sub>N<sub>i</sub>,2</sub></i>}}{\eqn{C_{N_{i},2}}} is
#'the partial combination of the two germinated seeds from among
#'\ifelse{html}{\out{N<sub>i</sub>}}{\eqn{N_{i}}}, the number of seeds
#'germinated on the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th time (estimated as
#'\ifelse{html}{\out{<em>C<sub>N<sub>i</sub>,2</sub> =
#'<sup>[N<sub>i</sub>(N<sub>i</sub>-1)]</sup> &frasl;
#'<sub>2</sub></em>}}{\eqn{C_{N_{i},2}=\frac{N{i}(N{i}-1)}{2}}}) and
#'\ifelse{html}{\out{<em>C<sub>&sum;N<sub>i</sub>,2</sub></em>}}{\eqn{C_{\Sigma
#'N_{i},2}}} is the partial combination of the two germinated seeds from among
#'the total number of seeds germinated at the final count, assuming that all
#'seeds that germinated did so simultaneously.
#'
#'\code{GermUncertainty} computes the value of synchronization index
#'(\ifelse{html}{\out{<em><span style="text-decoration:
#'overline">E</span></em>}}{\eqn{\overline{E}}}) or uncertainty of the
#'germination process (\ifelse{html}{\out{<i>U</i>}}{\eqn{U}}) or informational entropy (\ifelse{html}{\out{<i>H</i>}}{\eqn{H}}) as follows
#'(Shannon, 1948; Labouriau and Valadares, 1976; Labouriau 1983).
#'
#'\ifelse{html}{\out{<p style="text-align: center;"><em><span
#'style="text-decoration: overline;">E</span> = &minus;&sum;<sup>k</sup><sub
#'style="line-height: 1.8; margin-left: -1ex;">i=1</sub> f<sub>i</sub></em>log
#'<sub>2</sub><em>f<sub>i</sub></em></p>}}{\deqn{\overline{E} =
#'-\sum_{i=1}^{k}f_{i}\log_{2}f_{i}}}
#'
#'Where, \ifelse{html}{\out{<i>f<sub>i</sub></i>}}{\eqn{f_{i}}} is the relative
#'frequency of germination (estimated as \ifelse{html}{\out{<em>f<sub>i</sub> =
#'<sup>N<sub>i</sub></sup> &frasl; <sub>&sum;<sup>k</sup><sub
#'style="line-height: 1.8; margin-left:
#'-1ex;">i=1</sub>N<sub>i</sub></sub></em>}}{\eqn{f_{i}=\frac{N_{i}}{\sum_{i=1}^{k}N_{i}}}}),
#'\ifelse{html}{\out{<i>N<sub>i</sub></i>}}{\eqn{N_{i}}} is the number of seeds
#'germinated on the \ifelse{html}{\out{<i>i</i>}}{\eqn{i}}th time and \ifelse{html}{\out{<i>k</i>}}{\eqn{k}} is the last day of observation.
#'
#'@inheritParams MeanGermTime
#'
#'@return For \code{GermUncertainty}, the value of uncertainty of germination
#'  process.
#'
#'  For \code{GermSynchrony}, the value of synchrony of germination.
#'
#'@name GermSynchrony
#'
#'@references
#'
#'\insertRef{shannon_mathematical_1948}{germinationmetrics}
#'
#'\insertRef{labouriau_germination_1976}{germinationmetrics}
#'
#'\insertRef{labouriau_uma_1983}{germinationmetrics}
#'
#'\insertRef{primack_longevity_1985}{germinationmetrics}
#'
#'\insertRef{ranal_how_2006}{germinationmetrics}
#'
#' @examples
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' GermSynchrony(germ.counts = x, intervals = int)
#' GermUncertainty(germ.counts = x, intervals = int)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' GermSynchrony(germ.counts = y, intervals = int, partial = FALSE)
#' GermUncertainty(germ.counts = y, intervals = int, partial = FALSE)
#'

#' @rdname GermSynchrony
#' @export
GermSynchrony <- function(germ.counts, intervals, partial = TRUE) {
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

  Z <- sum(x*(x - 1)/2)/(sum(x)*(sum(x) - 1)/2)

  return(Z)
}

#' @rdname GermSynchrony
#' @export
GermUncertainty <- function(germ.counts, intervals, partial = TRUE) {
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

  relfreq <- x/sum(x)

  GU <- -sum(relfreq*log2(relfreq), na.rm = TRUE)

  return(GU)
}
