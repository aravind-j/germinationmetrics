### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-21, ICAR-NBPGR.
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

#' Plot the four-parameter hill function fitted cumulative germination curve
#' from a \code{FourPHFfit} object
#'
#' \code{plot.FourPHFfit} plots the four-parameter hill function fitted
#' cumulative germination curve (FPHF curve) from a \code{FourPHFfit} object as
#' an object of class \code{ggplot}. Further, the rate of germination curve (RoG
#' curve) is plotted and different parameters annotated as specified in the
#' different arguments. \loadmathjax
#'
#' @param x An object of class \code{FourPHFfit} obtained as output from the
#'   \code{\link[germinationmetrics]{FourPHFfit}} function.
#' @param rog If \code{TRUE}, plots the Rate of Germination curve (RoG). Default
#'   is \code{TRUE}.
#' @param t50.total If \code{TRUE}, highlights the time required for 50\% of
#'   total seeds to germinate (\mjseqn{\textrm{t}_{\textrm{50}_\textrm{Total}}})
#'   as a vertical line. Default is \code{TRUE}.
#' @param t50.germ If \code{TRUE}, highlights the time required for 50\% of
#'   viable/germinated seeds to germinate
#'   (\mjseqn{\textrm{t}_{\textrm{50}_\textrm{Germ}}}) as a vertical line.
#'   Default is \code{TRUE}.
#' @param tmgr If \code{TRUE}, highlights the Time at Maximum Germination Rate
#'   (TMGR) as a vertical line. Default is \code{TRUE}.
#' @param mgt If \code{TRUE}, highlights the Mean Germination Time (MGT) as a
#'   vertical line. Default is \code{TRUE}.
#' @param uniformity If \code{TRUE}, highlights the uniformity value
#'   (\mjseqn{\textrm{U}_{\textrm{t}_{\textrm{max}}-\textrm{t}_{\textrm{min}}}})
#'   as a horizontal line. Default is \code{TRUE}.
#' @param limits logical. If \code{TRUE}, set the limits of y axis (germination
#'   percentage) between 0 and 100 in the germination curve plot. If
#'   \code{FALSE}, limits are set according to the data. Default is \code{TRUE}.
#' @param plotlabels logical. If \code{TRUE}, adds labels to the germination
#'   curve plot. Default is \code{TRUE}.
#' @param \dots Default plot arguments.
#'
#' @return The plot of the cumulative germination curve as an object of class
#'   \code{ggplot}.
#'
#' @seealso \code{\link[germinationmetrics]{FourPHFfit}}
#'
#' @import ggplot2
#' @import ggrepel
#' @method plot FourPHFfit
#' @export
#'
#' @examples
#'
#' \donttest{
#' x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
#' y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
#' int <- 1:length(x)
#' total.seeds = 50
#'
#' # From partial germination counts
#' #----------------------------------------------------------------------------
#' fit1 <- FourPHFfit(germ.counts = x, intervals = int,
#'                    total.seeds = 50, tmax = 20)
#'
#' # From cumulative germination counts
#' #----------------------------------------------------------------------------
#' fit2 <- FourPHFfit(germ.counts = y, intervals = int,
#'                    total.seeds = 50, tmax = 20, partial = FALSE)
#'
#' # Default plots
#' plot(fit1)
#' plot(fit2)
#'
#' # No labels
#' plot(fit1, plotlabels = FALSE)
#' plot(fit2, plotlabels = FALSE)
#'
#' # Only the FPHF curve
#' plot(fit1, rog = FALSE, t50.total = FALSE, t50.germ = FALSE,
#'      tmgr = FALSE, mgt = FALSE, uniformity = FALSE)
#' plot(fit2, rog = FALSE, t50.total = FALSE, t50.germ = FALSE,
#'      tmgr = FALSE, mgt = FALSE, uniformity = FALSE)
#'
#' # Without y axis limits adjustment
#' plot(fit1, limits = FALSE)
#' plot(fit2, limits = FALSE)
#' }
#'
plot.FourPHFfit <- function(x, rog = TRUE, t50.total = TRUE, t50.germ = TRUE,
                            tmgr = TRUE, mgt = TRUE, uniformity = TRUE,
                            limits = TRUE, plotlabels = TRUE, ...){

  df <- x$data
  a <- x$a
  b <- x$b
  c <- x$c
  y0 <- x$y0
  TMGR <- x$TMGR
  MGT <- x$MGT
  Ufm <- unname(x$Uniformity[3])
  UfmMax <- unname(x$Uniformity[1])
  UfmMin <- unname(x$Uniformity[2])
  UfmMid <- UfmMax - (Ufm/2)
  t50.Germinated <- x$t50.Germinated
  t50.totalseeds <- x$t50.total
  umax = names(x$Uniformity)[1]
  umin = names(x$Uniformity)[2]


  # labels and unifromity positions
  if (limits == TRUE) {
    ypos <-  90
    ypos2 <-  80
  } else {
    ypos <-  plyr::round_any(max(df$csgp), 10, floor)
    ypos2 <- plyr::round_any(max(df$csgp), 10, floor)
  }

  if (max(df$csgp) == 0) {
    Gplot <- ggplot(data = df, aes(x = intervals, y = csgp)) +
      geom_point(alpha = 0.5) +
      labs(x = "Time", y = "Germination (%)") +
      theme_bw()
  } else {

    # curves + TMGR + MGT + t50.G + Ufm
    # Plot points + FPHF fit curve
    Gplot <- ggplot(data = df, aes(x = intervals, y = csgp)) +
      geom_point(alpha = 0.5) +
      stat_function(fun = FourPHF, colour = "red2",
                    args = list(a = a, b = b, c = c, y0 = y0)) +
      labs(x = "Time", y = "Germination (%)") +
      theme_bw()

    # Plot RoG curve
    if (rog == TRUE) {
      Gplot <- Gplot +
        stat_function(fun = RateofGerm, colour = "royalblue4",
                      args = list(a = a, b = b, c = c))
    }

    # Plot TMGR
    if (tmgr == TRUE) {
      Gplot <- Gplot +
        geom_vline(xintercept = TMGR, colour = "royalblue4", linetype = "dashed")
    }

    # Plot MGT
    if (mgt == TRUE) {
      Gplot <- Gplot +
        geom_vline(xintercept = MGT, colour = "green4", linetype = "dashed")
    }

    # Plot uniformity
    if (uniformity == TRUE) {
      Gplot <- Gplot +
        geom_segment(aes(x = UfmMin, xend = UfmMax, y = ypos2, yend = ypos2),
                     colour = "gray15", arrow = arrow(length = unit(0.2,"cm"))) +
        geom_segment(aes(x = UfmMax, xend = UfmMin, y = ypos2, yend = ypos2),
                     colour = "gray15", arrow = arrow(length = unit(0.2,"cm")))
    }

    # t50s
    if (t50.germ == TRUE | t50.total == TRUE ) {
      Gplot <- Gplot +
        geom_hline(yintercept = 50, colour = "black", linetype = "dotted")
      if (t50.germ == TRUE) {
        Gplot <- Gplot +
          geom_vline(xintercept = t50.Germinated, colour = "deeppink3",
                     linetype = "dashed")
      }
      if (t50.total == TRUE & max(df$csgp) >= 50) {
        Gplot <- Gplot +
          geom_vline(xintercept = t50.totalseeds, colour = "red2", linetype = "dashed")
      }
    }

    if (plotlabels == TRUE) {
      labdf <- data.frame(rbind(c(x = max(df$intervals), y = max(df$csgp),
                                  lab = "FPHF~curve", col = "red2")),
                          stringsAsFactors = F)
      if (rog == TRUE) {
        labdf <- rbind(labdf, c(x = max(df$intervals),
                                y = RateofGerm(x = max(df$intervals),
                                               a = a, b = b, c = c),
                                lab = "RoG~curve", col = "royalblue4"))
      }
      if (tmgr == TRUE) {
        labdf <- rbind(labdf, c(x = TMGR, y = ypos, lab = "TMGR",
                                col = "royalblue4"))
      }
      if (mgt == TRUE) {
        labdf <- rbind(labdf, c(x = MGT, y = ypos, lab = "MGT",col = "green4"))
      }
      if (uniformity == TRUE) {
        labdf <- rbind(labdf, c(x = UfmMid, y = ypos2,
                                lab =  paste("U","[", umax, "-", umin,"]",
                                             sep = ""), col = "gray15"))
      }
      if (t50.germ == TRUE) {
        labdf <- rbind(labdf, c(x = t50.Germinated, y = ypos,
                                lab = "t[50[Germ]]", col = "deeppink3"))
      }
      if (t50.total == TRUE & max(df$csgp) >= 50) {
        labdf <- rbind(labdf, c(x = t50.totalseeds, y = ypos, lab = "t[50[Total]]",
                                col = "red2"))
      }
      labdf$x <- as.numeric(as.character(as.factor((labdf$x))))
      labdf$y <- as.numeric(as.character(as.factor((labdf$y))))

      Gplot <- Gplot +
        geom_label_repel(data = labdf, aes(x, y, label = lab), size = 3,
                         nudge_x = 0, nudge_y = 0, colour = labdf$col,
                         na.rm = TRUE, parse = TRUE)
    }

  }


  # plot limits
  if (limits == TRUE) {
    Gplot <- Gplot + coord_cartesian(xlim = c(0, max(df$intervals)),
                                     ylim = c(0, 100))
  }



  Gplot <- Gplot +
    theme(axis.text = element_text(colour = "black"))

    # rm(df, a, b, c, y0, TMGR, MGT, Ufm,
    #    t50.Germinated, t50.totalseeds, umax, umin)

    return(Gplot)

}

