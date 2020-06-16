### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-20, ICAR-NBPGR.
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

#' Fit four-parameter hill function for multiple samples
#'
#' Fit four-parameter hill function from a data frame of germination counts
#' recorded at specific time intervals for multiple samples in batch.
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
#' @inheritParams FourPHFfit
#'
#' @return A data frame with the original data along with the various parameters
#'   of the respective fitted four-parameter hill function.
#'
#' @references
#'
#' \insertRef{el-kassaby_seed_2008}{germinationmetrics}
#'
#' @seealso This function is a wrapper around the
#'   \code{\link[germinationmetrics]{FourPHFfit}} function for fitting
#'   four-parameter hill curve.
#'
#' @export
#'
#' @examples
#'
#' \donttest{
#' data(gcdata)
#'
#' counts.per.intervals <- c("Day01", "Day02", "Day03", "Day04", "Day05",
#'                           "Day06", "Day07", "Day08", "Day09", "Day10",
#'                           "Day11", "Day12", "Day13", "Day14")
#'
#' FourPHFfit.bulk(gcdata, total.seeds.col = "Total Seeds",
#'                     counts.intervals.cols = counts.per.intervals,
#'                     intervals = 1:14, partial = TRUE,
#'                     fix.y0 = TRUE, fix.a = TRUE, xp = c(10, 60),
#'                     tmax = 20, tries = 3, umax = 90, umin = 10)
#' }
#'
FourPHFfit.bulk <- function(data, total.seeds.col, counts.intervals.cols,
                            intervals, partial = TRUE,
                            fix.y0 = TRUE, fix.a = TRUE,
                            tmax, xp = c(10, 60),
                            umin = 10, umax = 90, tries = 3) {

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
    stop(paste('The following column(s) specified as germination count per interval in "data" are not of type integer:\n',
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


  data <- data.table::as.data.table(data)

  fphfnames1 <- c("a", "b", "c", "y0", "lag", "Dlag50", "t50.total",
                  "t50.Germinated",
                  "TMGR", "AUC", "MGT", "Skewness", "msg", "isConv")

  data[, (fphfnames1) := FourPHFfit(germ.counts = unlist(mget(counts.intervals.cols)),
                                    intervals = intervals,
                                    partial = TRUE, fix.y0 = fix.y0,
                                    fix.a = fix.a, tmax = tmax,
                                    xp = xp, umin = umin, umax = umax, tries = tries,
                                    total.seeds = unlist(mget(total.seeds.col)))[fphfnames1],
       by = 1:nrow(data)]


  ulist <- data[, .(Ulist = list(FourPHFfit(germ.counts = unlist(mget(counts.intervals.cols)),
                                            intervals = intervals,
                                            partial = TRUE, fix.y0 = fix.y0,
                                            fix.a = fix.a, tmax = tmax,
                                            xp = xp, umin = umin, umax = umax, tries = tries,
                                            total.seeds = unlist(mget(total.seeds.col)))["Uniformity"])),
                by=1:nrow(data)]

  ulist <- rbindlist(lapply(ulist$Ulist, function(x) as.data.frame.list(unlist(x))))

  xptlist <- data[, .(xptlist = list(FourPHFfit(germ.counts = unlist(mget(counts.intervals.cols)),
                                                intervals = intervals,
                                                partial = TRUE, fix.y0 = fix.y0,
                                                fix.a = fix.a, tmax = tmax,
                                                xp = xp, umin = umin, umax = umax, tries = tries,
                                                total.seeds = unlist(mget(total.seeds.col)))["txp.total"])),
                  by=1:nrow(data)]

  xptlist <- rbindlist(lapply(xptlist$xptlist, function(x) as.data.frame.list(unlist(x))))

  xpglist <- data[, .(xpglist = list(FourPHFfit(germ.counts = unlist(mget(counts.intervals.cols)),
                                                intervals = intervals,
                                                partial = TRUE, fix.y0 = fix.y0,
                                                fix.a = fix.a, tmax = tmax,
                                                xp = xp, umin = umin, umax = umax, tries = tries,
                                                total.seeds = unlist(mget(total.seeds.col)))["txp.germinated"])),
                  by=1:nrow(data)]

  xpglist <- rbindlist(lapply(xpglist$xpglist, function(x) as.data.frame.list(unlist(x))))

  data <- cbind(data, xptlist, xpglist, ulist)

  setnames(data, old = "Uniformity.uniformity", new = "Uniformity")
  setnames(data, old = colnames(data),
           new = gsub("Uniformity.", "Uniformity_", colnames(data)))
  setnames(data, old = colnames(data),
           new = gsub("txp.total.", "txp.total_", colnames(data)))
  setnames(data, old = colnames(data),
           new = gsub("txp.Germinated.", "txp.Germinated_", colnames(data)))

  return(data)


}
