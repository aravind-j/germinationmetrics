### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-2023, ICAR-NBPGR.
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

#' Fit four-parameter hill function
#'
#' Fit a four-parameter hill function
#' \insertCite{el-kassaby_seed_2008}{germinationmetrics} to cumulative
#' germination count data and compute the associated parameters. \loadmathjax
#'
#' The cumulative germination count data of a seed lot can be modelled to fit a
#' four-parameter hill function defined as follows
#' \insertCite{el-kassaby_seed_2008}{germinationmetrics}.
#'
#' \mjsdeqn{y = y_{0}+\frac{ax^{b}}{c^{b}+x^{b}}}
#'
#' Where, \mjseqn{y} is the cumulative germination percentage at time
#' \mjseqn{x}, \mjseqn{y_{0}} is the intercept on the y axis, \mjseqn{a} is the
#' asymptote, or maximum cumulative germination percentage, which is equivalent
#' to germination capacity, \mjseqn{b} is a mathematical parameter controlling
#' the shape and steepness of the germination curve (the larger the \mjseqn{b}
#' parameter, the steeper the rise toward the asymptote \mjseqn{a}, and the
#' shorter the time between germination onset and maximum germination), and
#' \mjseqn{c} is the "half-maximal activation level" which represents the time
#' required for 50\% of viable seeds to germinate (\mjseqn{c} is equivalent to
#' the germination speed).
#'
#' In \code{FourPHFfit}, this model has be reparameterized by substituting
#' \mjseqn{b} with \mjseqn{e^{\beta}} to constraint \mjseqn{b} to positive
#' values only.
#'
#' \mjsdeqn{y = y_{0}+\frac{ax^{e^{\beta}}}{c^{e^{\beta}}+x^{e^{\beta}}}}
#'
#' Where, \mjseqn{b = e^{\beta}} and \mjseqn{\beta = \log_{e}(b)}.
#'
#' The curve fitting is performed with nonlinear
#' \code{\link[gslnls:gsl_nls]{gslnls}} package, a R interface to the
#' least-squares optimization with the GNU Scientific Library (GSL) with the
#' Levenberg-Marquardt algorithm
#' \insertCite{galassi_gnu_2009,chau_gslnls_2023}{germinationmetrics}.
#'
#' Once this function is fitted to the curve, \code{FourPHFfit} computes the
#' time to 50\% germination of total seeds (\code{t50.total}) or viable seeds
#' (\code{t50.Germinated}). Similarly the time at any percentage of germination
#' (in terms of both total and viable seeds) as specified in argument \code{xp}
#' can be computed.
#'
#' The time at germination onset (\mjseqn{lag}) can be computed as follows.
#'
#' \mjsdeqn{lag = b\sqrt{\frac{-y_{0}c^{b}}{a + y_{0}}}}
#'
#' The value \mjseqn{D_{lag-50}} is defined as the duration between the time at
#' germination onset (lag) and that at 50\% germination (\mjseqn{c}).
#'
#' The time interval between the percentages of viable seeds specified in the
#' arguments \code{umin} and \code{umin} to germinate is computed as uniformity
#' (\mjseqn{U_{t_{max}-t_{min}}}).
#'
#' \mjsdeqn{U_{t_{max}-t_{min}} = t_{max} - t_{min}}
#'
#' The partial derivative of the four-parameter hill function gives the
#' instantaneous rate of germination (\mjseqn{s}) as follows.
#'
#' \mjsdeqn{s = \frac{\partial y}{\partial x} =
#' \frac{abc^{b}x^{b-1}}{(c^{b}+x^{b})^{2}}}
#'
#' From this function for instantaneous rate of germination, the time at maximum
#' germination rate (\mjseqn{TMGR}) can be estimated as follows.
#'
#' \mjsdeqn{TMGR = b \sqrt{\frac{c^{b}(b-1)}{b+1}}}
#'
#' TMGR represents the point in time when the instantaneous rate of germination
#' starts to decline.
#'
#' The area under the curve (\mjseqn{AUC}) is obined by integration of the
#' fitted curve between time 0 and time specified in the argument `tmax`.
#'
#' Integration of the fitted curve gives the value of mean germination time
#' (\mjseqn{MGT}) and the skewness of the germination curve is computed as the
#' ratio of \mjseqn{MGT} and the time for 50\% of viable seeds to germinate
#' (\mjseqn{t_{50}}).
#'
#' \mjsdeqn{Skewness = \frac{MGT}{t_{50}}}
#'
#' If final germination percentage is less than 10\%, a warning is given, as the
#' results may not be informative.
#'
#' @inheritParams MeanGermTime
#' @param total.seeds Total number of seeds.
#' @param fix.y0 Force the intercept of the y axis through 0.
#' @param fix.a Fix a as the actual maximum germination percentage at the end of
#'   the experiment.
#' @param tmax The time up to which AUC is to be computed.
#' @param xp Germination percentage value(s) for which the corresponding time is
#'   to be computed as a numeric vector. Default is \code{c(10, 60)}.
#' @param umin The minimum germination percentage value for computing
#'   uniformity. Default is \code{10}. Seed \strong{\code{Details}}.
#' @param umax The maximum germination percentage value for computing
#'   uniformity. Default is \code{90}. Seed \strong{\code{Details}}.
#' @param tries The number of tries to be attempted to fit the curve. Default is
#'   3.
#'
#' @return A list with the following components: \item{data}{A data frame with
#'   the data used for computing the model.} \item{Parameters}{A data frame of
#'   parameter estimates, standard errors and p value.}  \item{Fit}{A one-row
#'   data frame with estimates of model fitness such as log likelyhoods, Akaike
#'   Information Criterion, Bayesian Information Criterion, deviance and
#'   residual degrees of freedom.}  \item{a}{The asymptote or the maximum
#'   cumulative germination percentage.}  \item{b}{The mathematical parameter
#'   controlling the shape and steepness of the germination curve.} \item{c}{The
#'   half-maximal activation level.}  \item{y0}{The intercept on the y axis.}
#'   \item{lag}{Time at germination onset.} \item{Dlag50}{duration between the
#'   time at germination onset (lag) and that at 50\% germination.}
#'   \item{t50.total}{Time required for 50\% of total seeds to germinate. Will
#'   be \code{NaN} if more than 50\% of total seeds do not germinate.}
#'   \item{txp.total}{Time required for x\% (as specified in argument \code{xp})
#'   of total seeds to germinate. Will be \code{NaN} if more than x\% of total
#'   seeds do not germinate.} \item{t50.Germinated}{Time required for 50\%
#'   of viable/germinated seeds to germinate.} \item{txp.Germinated}{Time
#'   required for x\% (as specified in argument \code{xp}) of viable/germinated
#'   seeds to germinate.} \item{Uniformity}{Time interval between \code{umin}\%
#'   and \code{umax}\% of viable seeds to germinate.} \item{TMGR}{Time at
#'   maximum germination rate.} \item{AUC}{The estimate of area under the
#'   curve.} \item{MGT}{Mean germination time.} \item{Skewness}{Skewness of mean
#'   germination time.} \item{msg}{The message from
#'   \code{\link[gslnls]{gsl_nls}}.} \item{isConv}{Logical value indicating
#'   whether convergence was achieved.}
#'   \item{model}{The raw fitted model output as a list of class
#'   \code{gsl_nls}.}
#'
#' @import gslnls
#' @importFrom broom glance
#' @importFrom broom tidy
#' @importFrom plyr round_any
#' @importFrom stats coef df integrate predict
#' @importFrom utils globalVariables
#'
#' @name FourPHFfit
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#' total.seeds = 50
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' FourPHFfit(germ.counts = x, intervals = int, total.seeds = 50, tmax = 20)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' FourPHFfit(germ.counts = y, intervals = int, total.seeds = 50, tmax = 20,
#'            partial = FALSE)
#'
#' @export
FourPHFfit <- function(germ.counts, intervals, total.seeds, partial = TRUE,
                       fix.y0 = TRUE, fix.a = TRUE, tmax, xp = c(10, 60),
                       umin = 10, umax = 90, tries = 3) {

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

  # Check if argument total.seeds is of type numeric with unit length
  if (!is.numeric(total.seeds) || length(total.seeds) != 1) {
    stop("'total.seeds' should be a numeric vector of length 1.")
  }

  # Check GP
  GP <- GermPercent(germ.counts = germ.counts, total.seeds = total.seeds,
                    partial = partial)

  if (GP == 0) {
    warning("Final germination percentage is 0%.\n",
            "The computation is not possible.")
  } else {
    if (GP < 10) {
      warning("Final germination percentage is less than 10%.\n",
              "The computation may not be appropriate.")
    }
  }

  # Check if umax is of type numeric with unit length
  if (!is.numeric(umax) || length(umax) != 1) {
    stop("'umax' should be a numeric vector of length 1.")
  }

  # Check if umin is of type numeric with unit length
  if (!is.numeric(umin) || length(umin) != 1) {
    stop("'umin' should be a numeric vector of length 1.")
  }

  # Check if argument xp is of type numeric
  if (!is.numeric(xp)) {
    stop("'xp' should be a numeric vector.")
  }

  # check if 0 < umax < 100
  if (umax > 100 || umax < 0) {
    stop('"umax" is not within range',
         ' (0 <= "umax" <= 100).')

    # check if 0 < umin < 100
    if (umin > 100 || umin < 0) {
      stop('"umin" is not within range',
           ' (0 <= "umin" <= 100).')
      # check if umax < umin
      if (umin > umax) {
        stop('"umin" is greater than "umax"')
      }

      if (umin == umax) {
        stop('"umin" and "umax" have same values')
      }

    }
  }

  # check if 0 < xp < 100
  if (any(!findInterval(xp, c(0, 100),
                        rightmost.closed = TRUE) == 1)) {
    stop('Values in "xp" are not within range',
         ' (0 <= "xp" <= 100).')
  }

  # name xp
  names(xp) <- xp

  # Check if tmax is of type numeric with unit length
  if (!is.numeric(tmax) || length(tmax) != 1) {
    stop("'tmax' should be a numeric vector of length 1.")
  }

  # Check if tmax is > 0
  if (tmax < 0) {
    stop("'tmax' should be greater than 0.")
  }

  # Check if tries is of type numeric with unit length
  if (!is.numeric(tries) || length(tries) != 1) {
    stop("'tries' should be a numeric vector of length 1.")
  }

  # Check if tries is > 0
  if (tries < 0) {
    stop("'tries' should be greater than 0.")
  }

  # Check if argument partial is of type logical with unit length
  if (!is.logical(partial) || length(partial) != 1) {
    stop("'partial' should be a logical vector of length 1.")
  }

  # Check if data is cumulative
  if (!partial) {
    if(is.unsorted(germ.counts)) {
      stop("'germ.counts' is not cumulative.")
    }
  }

  # Convert cumulative to partial
  if (!partial) {
    germ.counts <- c(germ.counts[1], diff(germ.counts))
  }

  gp <- (germ.counts/total.seeds) * 100
  csgp <- cumsum(gp)

  df <- data.frame(gp, csgp, intervals)

  # Blank output
  parameters <- data.frame(term = c("a", "b", "c", "y0"),
                           estimate = rep(NA_integer_),
                           std.error = rep(NA_integer_, 4),
                           statistic = rep(NA_integer_, 4),
                           p.value = rep(NA_integer_, 4))

  fit <- data.frame(sigma = NA_integer_, isConv = NA, finTol = NA_integer_,
                    logLik = NA_integer_, AIC = NA_integer_, BIC = NA_integer_,
                    deviance = NA_integer_, df.residual = NA_integer_,
                    nobs = NA_integer_)

  a <- NA_integer_
  b <- NA_integer_
  c <- NA_integer_
  y0 <- NA_integer_
  lag <- NA_integer_
  Dlag50 <- NA_integer_
  t50.total <- NA_integer_
  t50.Germinated <- NA_integer_
  TMGR <- NA_integer_
  AUC <- NA_integer_
  MGT <- NA_integer_
  #MGTg <- NA_integer_
  Skewness <- NA_integer_
  isConv <- NA
  mod <- NULL

  uniformity = c(NA_integer_, NA_integer_, NA_integer_)
  names(uniformity) <- c(umax, umin, "uniformity")

  txp.total <-  txp.Germinated <- rep(NA_integer_, length(xp))
  names(txp.total) <- xp
  names(txp.Germinated) <- xp

  if (GP > 0) { # perform fit only if GP > 0

    peakg <- suppressWarnings(PeakGermTime(germ.counts, intervals,
                                           partial = TRUE))

    # Starting values for nls
    starta <- max(csgp)
    # startb <- 20
    startb  <- CVG(df$csgp, df$intervals, partial = TRUE)
    if (length(peakg) == 1 && peakg == 1 &&
        df[which(df$intervals == 1), ]$csgp >= 90) {
      startb <- 20
    }
    if (mean(peakg) <= 3) {
      startb <- 20
    }
    if (csgp[1] >= 10 || csgp[2] >= 10 && csgp[3] >= 60) {
      startb <- 10
    }
    startbta <- log(startb, base = exp(1))
    startc <- t50(germ.counts, intervals, partial = TRUE, method = "coolbear")
    starty0 <- 0

    # test starting values
    tryStart <-
      FourPHF_withWE(data = df,
                     fix.a = fix.a, fix.y0 = fix.y0,
                     starta = starta, startb = startbta,
                     startc = startc, starty0 = starty0,
                     maxiter = 1024)

    # Test grid of starting values
    if (inherits(tryStart, "error")) {
      startgrid <- expand.grid(starta = starta,
                               startb = c(0.0000001, 2, 5,
                                          seq(from = 10, to = 100, by = 10)),
                               startc = startc, starty0 = starty0)
      startgrid$startbta <- log(startgrid$startb, base = exp(1))

      nls_fitlist <- vector("list", nrow(startgrid))

      for (i in 1:nrow(startgrid)) {

        nls_fitlist[[i]] <-
          FourPHF_withWE(data = df,
                         fix.a = fix.a, fix.y0 = fix.y0,
                         starta = startgrid[i, "starta"],
                         startbta = startgrid[i, "startbta"],
                         startc = startgrid[i, "startc"],
                         starty0 = startgrid[i, "starty0"], maxiter = 1024)
      }


      isnls <- unlist(lapply(nls_fitlist, function(x) is(x, "nls")))

      # Workaround for gls_nls summary error
      # when there is singular gradient matrix at parameter estimates
      isnlssumm <- unlist(lapply(nls_fitlist, function(x) {
        out <- tryCatch(summary(x), error = function(e) e)
        inherits(out, "error")
      }))

      isnls <- isnls & (!isnlssumm)

      if (any(isnls)) {
        nls_fitlist <- nls_fitlist[isnls]

        nls_fitdf <-
          lapply(nls_fitlist, function(x) {
            cdf <- data.frame(t(coef(x)))
            colnames(cdf) <- paste("start", colnames(cdf), sep = "")
            cbind(cdf, broom::glance(x))
          })

        nls_fitdf <- do.call(rbind, nls_fitdf)
        sel_ind <- which(nls_fitdf$deviance == min(nls_fitdf$deviance))[1]

        starta <- ifelse("starta" %in% colnames(nls_fitdf),
                         nls_fitdf[sel_ind, "starta"],
                         starta)
        startbta <- ifelse("startbta" %in% colnames(nls_fitdf),
                           nls_fitdf[sel_ind, "startbta"],
                           startbta)
        startc <- ifelse("startc" %in% colnames(nls_fitdf),
                         nls_fitdf[sel_ind, "startc"],
                         startc)
        starty0 <- ifelse("starty0" %in% colnames(nls_fitdf),
                          nls_fitdf[sel_ind, "starty0"],
                          starty0)
      }

    }

    msg <- ""

    # lowera <- lowerb <- lowerc <- lowery0 <- -Inf
    # uppera <- upperb <- upperc <- uppery0 <- Inf
    #
    # if (TRUE %in% c(fix.y0, fix.a)) {
    #
    #   if (fix.y0 == TRUE) {
    #     lowery0 <- uppery0 <- 0
    #   }
    #   if (fix.a == TRUE) {
    #     lowera <- uppera <- max(csgp)
    #   }
    # }
    #
    # # test starting values
    # possibleError <- tryCatch(
    #
    #   nlsLM(
    #     csgp ~ FourPHF(x = intervals, a, b, c, y0),
    #     data = df,
    #     start = list(a = starta, b = startb, c = startc, y0 = starty0),
    #     lower = c(a = lowera, b = lowerb, c = lowerc, y0 = lowery0),
    #     upper = c(a = uppera, b = upperb, c = upperc, y0 = uppery0),
    #     control = list(maxiter = 1024, warnOnly = FALSE)),
    #
    #   error = function(e) e)
    #
    # if (inherits(possibleError, "error") & mean(peakg) <= 3) {
    #   csgp2 <- c(csgp, rep(max(csgp), 20))
    #   intervals2 <- seq_along(csgp2)
    #   df2 <- data.frame(csgp2, intervals2)
    #
    #   # grd <- data.frame(a=c(starta, starta),
    #   #                   b=c(55,85),
    #   #                   c=c(startc-1, startc+1),
    #   #                   y0=c(starty0, starty0))
    #
    #   # Modify start values v1
    #   tmod <- tryCatch(
    #
    #     suppressWarnings(nlsLM(
    #       csgp2 ~ FourPHF(x = intervals2, a, b, c, y0),
    #       data = df2,
    #       start = list(a = starta, b = startb, c = startc, y0 = starty0),
    #       lower = c(a = lowera, b = lowerb, c = lowerc, y0 = lowery0),
    #       upper = c(a = uppera, b = upperb, c = upperc, y0 = uppery0),
    #       control = list(maxiter = 1024, warnOnly = FALSE))),
    #
    #     # suppressWarnings(nls2(csgp ~ FourPHF(x = intervals, a, b, c, y0),
    #     #      data = df,
    #     #      start = grd,
    #     #      algorithm = "random",
    #     #      control = nls.control(maxiter = 20000), all = TRUE)),
    #
    #     error = function(e) e)
    #
    #   if (!inherits(tmod, "error")) {
    #
    #     tmod2 <- tryCatch(
    #
    #       suppressWarnings(nlsLM(
    #         csgp ~ FourPHF(x = intervals, a, b, c, y0),
    #         data = df,
    #         start = list(a = starta, b = startb, c = startc, y0 = starty0),
    #         lower = c(a = lowera, b = lowerb, c = lowerc, y0 = lowery0),
    #         upper = c(a = uppera, b = upperb, c = upperc, y0 = uppery0),
    #         control = list(maxiter = 1024, warnOnly = FALSE))),
    #
    #       error = function(e) e)
    #
    #     tmod3 <- tryCatch(
    #
    #       suppressWarnings(nlsLM(
    #         csgp ~ FourPHF(x = intervals, a, b, c, y0),
    #         data = df,
    #         start = list(a = starta, b = startb/2, c = startc, y0 = starty0),
    #         lower = c(a = lowera, b = lowerb, c = lowerc, y0 = lowery0),
    #         upper = c(a = uppera, b = upperb, c = upperc, y0 = uppery0),
    #         control = list(maxiter = 1024, warnOnly = FALSE))),
    #
    #       error = function(e) e)
    #
    #     if (!inherits(tmod2, "error")) {
    #       startb <-  unname(coef(tmod2)["b"])
    #       # startc <-  unname(coef(tmod)["c"])
    #     }
    #
    #     if (!inherits(tmod3, "error")) {
    #       startb <-  unname(coef(tmod3)["b"])
    #     }
    #
    #   }
    #
    # }
    # rm(possibleError)

    #===========================================================================
    # Fit the model - using gsl_nls
    #------------------------------
    for (i in 1:tries) {
      # check if convergence possible with start values
      possibleError <-
        FourPHF_withWE(data = df,
                       fix.a = fix.a, fix.y0 = fix.y0,
                       starta = starta, startb = startbta,
                       startc = startc, starty0 = starty0,
                       maxiter = 1024)

      if (!inherits(possibleError, "error") &&
          possibleError$convInfo$isConv == TRUE) {

        mod <- possibleError
        rm(possibleError)

        filler <- ifelse(i == 1, "#", "\n#")
        msg <- paste(msg, filler, i, ". ", mod$convInfo$stopMessage, " ",
                     sep = "")
        break # break out of loop if convergence is successful

      } else {# In case of convergence failure with initial start values

        # suppress warnings and rerun above with warnOnly = TRUE

        mod <-
          FourPHF_withWE(data = df,
                         fix.a = fix.a, fix.y0 = fix.y0,
                         starta = starta, startb = startbta,
                         startc = startc, starty0 = starty0,
                         maxiter = 1024, warnOnly = TRUE)

        # Extract convergence msg
        if (!inherits(mod, "error")) {

          filler <- ifelse(i == 1, "#", "\n#")
          msg <- paste(msg, filler, i, ". ", mod$convInfo$stopMessage,
                       " ", sep = "")

          # Get new start values
          starta <- coef(mod)["a"]
          startbta <- coef(mod)["bta"]
          startc <- coef(mod)["c"]
          starty0 <- 0

        } else {

          filler <- ifelse(i == 1, "#", "\n#")
          msg <- paste(msg, filler, i, ". ", mod$message,
                       " ", sep = "")

          break # break out of loop if convergence is NOT successful
        }

      }
    }

    if (mod$convInfo$stopCode == 11) {

      starta <- ifelse(is.na(coef(mod)["a"]),
                       starta,
                       coef(mod)["a"])
      startbta <- ifelse(is.na(coef(mod)["bta"]),
                         startbta,
                         coef(mod)["bta"])
      startc <- ifelse(is.na(coef(mod)["c"]),
                       startc,
                       coef(mod)["c"])
      starty0 <- ifelse(is.na(coef(mod)["y0"]),
                        starty0,
                        coef(mod)["y0"])

      mod <- FourPHF_withWE(data = df,
                            fix.a = fix.a, fix.y0 = fix.y0,
                            starta = starta, startb = startbta,
                            startc = startc, starty0 = starty0,
                            maxiter = 2048, algorithm = "lm")
      i = i + 1
      msg <- paste(msg, "\n#", i, ". ", mod$convInfo$stopMessage,
                   " ", sep = "")
    }

    # "iteration is not making progress towards solution"
    if (mod$convInfo$stopCode == 27) {

      starta <- ifelse(is.na(coef(mod)["a"]),
                       starta,
                       coef(mod)["a"])
      startbta <- ifelse(is.na(coef(mod)["bta"]),
                         startbta,
                         coef(mod)["bta"])
      startc <- ifelse(is.na(coef(mod)["c"]),
                       startc,
                       coef(mod)["c"])
      starty0 <- ifelse(is.na(coef(mod)["y0"]),
                        starty0,
                        coef(mod)["y0"])

      mod <- FourPHF_withWE(data = df,
                            fix.a = fix.a, fix.y0 = fix.y0,
                            starta = starta, startb = startbta,
                            startc = startc, starty0 = starty0,
                            maxiter = 2048, algorithm = "lmaccel")

      i = i + 1
      msg <- paste(msg, "\n#", i, ". ", mod$convInfo$stopMessage,
                   " ", sep = "")
    }

    #===========================================================================

    if (!inherits(mod, "error")) {
      isConv <-  mod$convInfo$isConv

      # Parameters estimates
      parameters <- tidy(mod)

      # Fit quality
      fit <- glance(mod)

      # Asymptote or maximum cumulative germination percentage
      if (fix.a) {
        a <- max(csgp)
      } else {
        a <- unname(unlist(parameters[parameters$term == "a", "estimate"]))
      }
      # Shape and steepness
      bta <- unname(unlist(parameters[parameters$term == "bta", "estimate"]))
      b <- exp(bta)
      # Half-maximal activation level
      # Time required for 50% of viable seeds to germinate
      c <- unname(unlist(parameters[parameters$term == "c", "estimate"]))
      # Intercept on the y axis
      if (fix.y0) {
        y0 <- 0
      } else {
        y0 <- unname(unlist(parameters[parameters$term == "y0", "estimate"]))
      }

      # Time at germination onset (lag); will be 0 if y0 is constrained to zero
      lag <- ((-y0*(c^b))/(a + y0))^(1/b)

      # Duration between the time at germination onset (lag)
      # and that at 50% germination (c)
      Dlag50 <- c - lag

      # #-----------------------------------------------------------------------
      # findInt <- function(model, value) {
      #   function(x) {
      #     predict(mod, data.frame(intervals = x), type="response") - value
      #   }
      # }
      #
      # txp.total <- uniroot(findInt(model, xp), range(intervals))$root
      #
      # t50.total <- uniroot(findInt(model, 50), range(intervals))$root

      # txp.Germinated <- uniroot(findInt(model, (xp * max(csgp)/100)),
      #                           range(intervals))$root

      # #-----------------------------------------------------------------------

      # Time required for 50% of total seeds to germinate
      t50.total <- (((((50 - y0)/a))*(c^b))/(1 - (((50 - y0)/a))))^(1/b)

      # Time required for x% of total seeds to germinate
      txp.total <- (((((xp - y0)/a))*(c^b))/(1 - (((xp - y0)/a))))^(1/b)


      # Time required for 50%  of germinated/viable seeds to germinate
      t50.Germinated <- (((50 - y0)/100*(c^b))/(1 - ((50 - y0)/100)))^(1/b)

      # Time required for x%  of germinated/viable seeds to germinate
      # or time to reach x%  of germination
      txp.Germinated <- (((xp - y0)/100*(c^b))/(1 - ((xp - y0)/100)))^(1/b)

      # Uniformity
      UfmMax <- (((umax - y0)/100*(c^b))/(1 - ((umax - y0)/100)))^(1/b)
      UfmMin <- (((umin - y0)/100*(c^b))/(1 - ((umin - y0)/100)))^(1/b)
      Ufm <- UfmMax - UfmMin
      uniformity = c(max = UfmMax, min = UfmMin, uniformity = Ufm)
      names(uniformity) <- c(umax, umin, "uniformity")

      # Time at maximum germination rate
      # ie. peak of plot of daily rate of germination
      TMGR <- (((c^b)*(b - 1))/(b + 1))^(1/b)

      # Area under the curve - add argument max time
      AUC <- integrate(FourPHF, lower = 0, upper = tmax,
                       a = a, bta = bta, c = c, y0 = y0)$value

      # Mean Germination time
      FourPHFMGT <- function(x, a, b, c, y0)
      {
        ((y0 + a * (x ^ b) / (c ^ b + x ^ b )) -
           (y0 + a * ((x - 1) ^ b)/(c ^ b + (x - 1) ^ b))) * x
      }

      MGT <- integrate(FourPHFMGT, lower = 1, upper = max(intervals),
                       a = a, b = b, c = c, y0 = y0)$value / a

      #-------------------------------------------------------------------------
      # Mean Germination time
      # tmax <- max(intervals)
      # x <- 1
      # MGTg1 <- (y0 + ((a * ((x / 1000)^b)) /
      #                   ((c^b) + (((x - 1) / 1000)^b)))) * 0.001
      # x <- 2:(1000 * tmax)
      # z <- (y0 + ((a * ((x / 1000)^b)) / ((c^b) + (((x - 1) / 1000)^b))) -
      #         (y0 + ((a * (((x - 1) / 1000)^b)) /
      #                  ((c^b) + (((x - 2) / 1000)^b))))) * (x / 1000)
      # MGTg <- sum(c(MGTg1, z)) / a
      # rm(x, MGTg1, z)
      #-------------------------------------------------------------------------
      # plot(df$intervals, df$csgp, xlab = "Time", ylab = "Germination (%)")
      # abline(h = 50)
      # abline(v = c)
      # lines(predict(mod)~df$intervals, col="red")
      #
      # abline(h = xp, col="green")
      # abline(v = txp.total, col="green")
      # abline(v = t50.total , col="red")
      #
      # abline(v = TMGR, col = "blue")
      # curve(RateofGerm(x, a=a, b=b, c=c), xlim = c(0, 13), type = "l",
      #       add = TRUE, col = "blue")
    } else {

      warning("Convergence Error\n", paste(msg, collapse = "\n"))
    }


  } else {

    msg <- paste("Final germination percentage is 0%.",
                 "The computation is not possible.", sep = " ")

  }

  output <- list(data = df, Parameters = data.frame(parameters),
                 Fit = as.data.frame(fit),
                 a = a, b = b, c = c, y0 = y0,
                 lag = lag, Dlag50 = Dlag50,
                 t50.total = t50.total, txp.total = txp.total,
                 t50.Germinated = t50.Germinated,
                 txp.Germinated = txp.Germinated,
                 Uniformity = uniformity, TMGR = TMGR, AUC = AUC, MGT = MGT,
                 #MGTg = MGTg,
                 Skewness = MGT/t50.Germinated,
                 msg = msg, isConv = isConv, model = mod)

  # Set Class
  class(output) <- c("FourPHFfit", class(output))

  return(output)
  rm(mod)

}

#' Four paramter hill function
#'
#' To be used by
#' \code{\link[germinationmetrics]{FourPHFfit}}.
#'
#' @param x The explanatory/independent variable value.
#' @param a Parameter \mjseqn{a}.
#' @param bta Parameter \mjseqn{e^{\beta}}.
#' @param b Parameter \mjseqn{b}.
#' @param c Parameter \mjseqn{c}.
#' @param y0 Parameter \mjseqn{y_{0}}.
#'
#' @return The calculated response/dependent value value.
#'
#' @export
#'
#'
FourPHF <- function(x, a, bta, c, y0)
{
  y0 + ((a * (x ^ exp(bta))) /
          (c ^ exp(bta) + x ^ exp(bta))) # b = exp(bta) to enforce +ive slope
}

#' @rdname FourPHF
#' @export
# FPHF with a fixed to fixed to max(csgp)
FourPHF_fixa <- function(x, a = 100, bta, c, y0)
{
  y0 + ((a * (x ^ exp(bta))) /
          (c ^ exp(bta) + x ^ exp(bta)))
}

#' @rdname FourPHF
#' @export
# FPHF with y0 fixed to 0
FourPHF_fixy0 <- function(x, a, bta, c)
{
  0 + ((a * (x ^ exp(bta))) /
         (c ^ exp(bta) + x ^ exp(bta)))
}

#' @rdname FourPHF
#' @export
# FPHF with a fixed to max(csgp) & y0 fixed to 0
FourPHF_fixa_fixy0 <- function(x, a = 100, bta, c)
{
  0 + ((a * (x ^ exp(bta))) /
         (c ^ exp(bta) + x ^ exp(bta)))
}

#' @rdname FourPHF
#' @export
# Daily rate of germination function - partial derivative of 4PHF
RateofGerm <- function(x, a, b, c) {
  (a * b * (c ^ b) * (x ^ (b - 1))) /
    (((c ^ b) + (x ^ b)) ^ 2)
}


FourPHF_withWE <- function(data,
                           fix.a, fix.y0,
                           starta, startbta, startc, starty0,
                           maxiter, algorithm = "lm", warnOnly = FALSE) {
  tryCatch(

    if (TRUE %in% c(fix.y0, fix.a)) {

      if (fix.a == FALSE & fix.y0 == TRUE) {

        gsl_nls(
          csgp ~ FourPHF_fixy0(x = intervals, a, bta, c),
          data = data,
          algorithm = algorithm,
          start = list(a = starta, bta = startbta, c = startc),
          control = list(maxiter = maxiter, warnOnly = warnOnly,
                         scale = "levenberg"))

      }

      if (fix.a == TRUE & fix.y0 == FALSE) {

        gsl_nls(
          csgp ~ FourPHF_fixa(x = intervals, a = max(csgp), bta, c, y0),
          data = data,
          algorithm = algorithm,
          start = list(bta = startbta, c = startc, y0 = starty0),
          control = list(maxiter = maxiter, warnOnly = warnOnly,
                         scale = "levenberg"))

      }

      if (fix.a == TRUE & fix.y0 == TRUE) {

        gsl_nls(
          csgp ~ FourPHF_fixa_fixy0(x = intervals, a = max(csgp),
                                    bta, c),
          data = data,
          algorithm = algorithm,
          start = list(bta = startbta, c = startc),
          control = list(maxiter = maxiter, warnOnly = warnOnly,
                         scale = "levenberg"))
      }

    } else {

      gsl_nls(
        csgp ~ FourPHF(x = intervals, a, bta, c, y0),
        data = data,
        algorithm = algorithm,
        start = list(a = starta, bta = startbta,
                     c = startc, y0 = starty0),
        control = list(maxiter = maxiter, warnOnly = warnOnly,
                       scale = "levenberg"))

    },

    error = function(e) e)
}
