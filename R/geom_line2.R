### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-2023, ICAR-NBPGR.
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

#' @importFrom rlang `%||%`
#' @export
draw_key_path2 <- function(data, params, size) {

  if (is.null(data$linetype)) {
    data$linetype <- 0
  } else {
    data$linetype[is.na(data$linetype)] <- 0
  }

  # draw_key_point
  if (is.null(data$shape)) {
    data$shape <- 19
  } else if (is.character(data$shape)) {
    data$shape <- translate_shape_string(data$shape)
  }

  # NULL means the default stroke size, and NA means no stroke.
  stroke_size <- data$stroke %||% 0.5
  stroke_size[is.na(stroke_size)] <- 0

  grob <- segmentsGrob(0.1, 0.5, 0.9, 0.5,
                       gp = grid::gpar(
                         col = alpha(data$colour %||% data$fill %||% "black", data$alpha),
                         fill = alpha(params$arrow.fill %||% data$colour
                                      %||% data$fill %||% "black", data$alpha),
                         lwd = (data$linewidth %||% 0.5) * .pt,
                         lty = data$linetype %||% 1,
                         lineend = params$lineend %||% "butt"
                       ),
                       arrow = params$arrow
  )
  if (!is.null(params$arrow)) {
    angle <- deg2rad(params$arrow$angle)
    length <- grid::convertUnit(params$arrow$length, "cm", valueOnly = TRUE)
    attr(grob, "width")  <- cos(angle) * length * 1.25
    attr(grob, "height") <- sin(angle) * length * 2
  }

  pgrob <-
    pointsGrob(0.5, 0.5,
               pch = data$shape,
               gp = grid::gpar(
                 col = alpha(data$colour %||% "black", data$alpha),
                 fill = fill_alpha(data$fill %||% "black", data$alpha),
                 fontsize = (data$size %||% 1.5) * .pt + stroke_size * .stroke / 2,
                 lwd = stroke_size * .stroke / 2
               )
    )

  grid::gTree(children = grid::gList(grob, pgrob))
}

#' @importFrom rlang list2
#' @importFrom stats complete.cases ave
#' @importFrom cli cli_warn cli_inform cli_abort
#' @importFrom grid segmentsGrob pointsGrob pointsGrob polylineGrob gTree convertUnit gpar gList addGrob
#' @export
geom_path2 <- function(mapping = NULL, data = NULL,
                       stat = "identity", position = "identity",
                       ...,
                       lineend = "butt",
                       linejoin = "round",
                       linemitre = 10,
                       arrow = NULL,
                       na.rm = FALSE,
                       show.legend = NA,
                       inherit.aes = TRUE) {
  layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomPath2,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list2(
      lineend = lineend,
      linejoin = linejoin,
      linemitre = linemitre,
      arrow = arrow,
      na.rm = na.rm,
      ...
    )
  )
}

#' @export
GeomPath2 <- ggproto("GeomPath2", Geom,
                     required_aes = c("x", "y"),

                     default_aes = aes(colour = "black", linewidth = 0.5, linetype = 1, alpha = NA,
                                       # geom_point
                                       size = 1.5, shape = 19, fill = NA, stroke = 0.5),

                     non_missing_aes = c("linewidth", "colour", "linetype",
                                         # geom_point
                                         "size", "shape",
                                         # Add
                                         "show.points", "include.points"),

                     handle_na = function(self, data, params) {
                       # Drop missing values at the start or end of a line - can't drop in the
                       # middle since you expect those to be shown by a break in the line
                       aesthetics <- c(self$required_aes, self$non_missing_aes)
                       complete <- stats::complete.cases(data[names(data) %in% aesthetics])
                       kept <- stats::ave(complete, data$group, FUN = keep_mid_true)
                       data <- data[kept, ]

                       if (!all(kept) && !params$na.rm) {
                         cli::cli_warn(paste0(
                           "Removed {sum(!kept)} row{?s} containing missing values or values ",
                           "outside the scale range ({.fn {snake_class(self)}})."
                         ))
                       }

                       data
                     },

                     draw_panel = function(self, data, panel_params, coord, arrow = NULL,
                                           lineend = "butt", linejoin = "round", linemitre = 10,
                                           na.rm = FALSE) {

                       data <- fix_linewidth(data, snake_class(self))
                       if (!anyDuplicated(data$group)) {
                         cli::cli_inform(c(
                           "{.fn {snake_class(self)}}: Each group consists of only one observation.",
                           i = "Do you need to adjust the {.field group} aesthetic?"
                         ))
                       }

                       # must be sorted on group
                       data <- data[order(data$group), , drop = FALSE]
                       munched <- coord_munch(coord, data, panel_params)

                       # Add
                       if (!(is.null(munched$include.points)) &
                           !(is.null(munched$show.points))) {
                         munched$include.points <- ifelse(munched$show.points == FALSE,
                                                          TRUE,
                                                          munched$include.points)
                         munched <- munched[munched$include.points == TRUE, ]
                       }

                       # Silently drop lines with less than two points, preserving order
                       rows <- stats::ave(seq_len(nrow(munched)), munched$group, FUN = length)
                       munched <- munched[rows >= 2, ]
                       if (nrow(munched) < 2) return(zeroGrob())

                       # Work out whether we should use lines or segments
                       attr <- dapply(munched, "group", function(df) {
                         linetype <- unique0(df$linetype)
                         data_frame0(
                           solid = identical(linetype, 1) || identical(linetype, "solid"),
                           constant = nrow(unique0(df[, names(df) %in% c("alpha", "colour", "linewidth", "linetype")])) == 1,
                           .size = 1
                         )
                       })
                       solid_lines <- all(attr$solid)
                       constant <- all(attr$constant)
                       if (!solid_lines && !constant) {
                         cli::cli_abort("{.fn {snake_class(self)}} can't have varying {.field colour}, {.field linewidth}, and/or {.field alpha} along the line when {.field linetype} isn't solid.")
                       }

                       # Work out grouping variables for grobs
                       n <- nrow(munched)
                       group_diff <- munched$group[-1] != munched$group[-n]
                       start <- c(TRUE, group_diff)
                       end <-   c(group_diff, TRUE)

                       # geom_point
                       if (is.character(data$shape)) {
                         data$shape <- translate_shape_string(data$shape)
                       }

                       # geom_point
                       coords <- coord$transform(data, panel_params)

                       # Add
                       if (!(is.null(coords$show.points))) {
                         coords <- coords[coords$show.points == TRUE, ]
                       }

                       # geom_point
                       stroke_size <- coords$stroke
                       stroke_size[is.na(stroke_size)] <- 0

                       if (!constant) {

                         # MOD

                         out <- lapply(seq_along(unique0(munched$group)),
                                       function(i) {

                                         munched_id <- munched[munched$group == i, ]

                                         arrow <- repair_segment_arrow(arrow, munched_id$group)

                                         lineg_id <- grid::segmentsGrob(
                                           munched_id$x[!end], munched_id$y[!end], munched_id$x[!start], munched_id$y[!start],
                                           default.units = "native", arrow = arrow,
                                           gp = grid::gpar(
                                             col = alpha(munched_id$colour, munched_id$alpha)[!end],
                                             fill = alpha(munched_id$colour, munched_id$alpha)[!end],
                                             lwd = munched_id$linewidth[!end] * .pt,
                                             lty = munched_id$linetype[!end],
                                             lineend = lineend,
                                             linejoin = linejoin,
                                             linemitre = linemitre
                                           )
                                         )

                                         coords_id <- coords[coords$group == i, ]

                                         pointg_id <-
                                           # geom-point.R
                                           grid::pointsGrob(
                                             coords_id$x, coords_id$y,
                                             pch = coords_id$shape,
                                             gp = grid::gpar(
                                               col = alpha(coords_id$colour, coords_id$alpha),
                                               fill = fill_alpha(coords_id$fill, coords_id$alpha),
                                               # Stroke is added around the outside of the point
                                               fontsize = coords_id$size * .pt + stroke_size[coords$group == i] * .stroke / 2,
                                               lwd = coords_id$stroke * .stroke / 2
                                             )
                                           )


                                         list(lineg_id, pointg_id)
                                       })

                         out <- unlist(out, recursive = F)
                         out <- do.call(grid::gList, out)
                         out <- gTree(children = out)

                         out

                       } else {

                         # MOD

                         # id <- match(munched$group, unique0(munched$group))

                         out <- lapply(seq_along(unique0(munched$group)),
                                       function(i) {
                                         munched_id <- munched[munched$group == i, ]

                                         lineg_id <- grid::polylineGrob(
                                           munched_id$x, munched_id$y, #id = id,
                                           default.units = "native", arrow = arrow,
                                           gp = grid::gpar(
                                             col = alpha(munched_id$colour, munched_id$alpha)[start],
                                             fill = alpha(munched_id$colour, munched_id$alpha)[start],
                                             lwd = munched_id$linewidth[start] * .pt,
                                             lty = munched_id$linetype[start],
                                             lineend = lineend,
                                             linejoin = linejoin,
                                             linemitre = linemitre
                                           )
                                         )

                                         coords_id <- coords[coords$group == i, ]

                                         pointg_id <-
                                           # geom-point.R
                                           grid::pointsGrob(
                                             coords_id$x, coords_id$y,
                                             pch = coords_id$shape,
                                             gp = grid::gpar(
                                               col = alpha(coords_id$colour, coords_id$alpha),
                                               fill = fill_alpha(coords_id$fill, coords_id$alpha),
                                               # Stroke is added around the outside of the point
                                               fontsize = coords_id$size * .pt + stroke_size[coords$group == i] * .stroke / 2,
                                               lwd = coords_id$stroke * .stroke / 2
                                             )
                                           )

                                         list(lineg_id, pointg_id)
                                       })

                         out <- unlist(out, recursive = F)
                         out <- do.call(grid::gList, out)
                         out <- gTree(children = out)

                         out
                       }
                     },

                     draw_key = draw_key_path2,

                     rename_size = TRUE
)


#' @export
geom_line2 <- function(mapping = NULL, data = NULL, stat = "identity",
                       position = "identity", na.rm = FALSE, orientation = NA,
                       show.legend = NA, inherit.aes = TRUE, ...) {


  layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomLine2,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list2(
      na.rm = na.rm,
      orientation = orientation,
      ...
    )
  )
}


#' @export
GeomLine2 <- ggproto("GeomLine2", GeomPath2,
                     setup_params = function(data, params) {
                       params$flipped_aes <- has_flipped_aes(data, params, ambiguous = TRUE)
                       params
                     },

                     extra_params = c("na.rm", "orientation"),

                     setup_data = function(data, params) {

                       data$flipped_aes <- params$flipped_aes
                       data <- flip_data(data, params$flipped_aes)
                       data <- data[order(data$PANEL, data$group, data$x), ]
                       flip_data(data, params$flipped_aes)
                     }
)


# Helper functions from ggplot2

keep_mid_true <- getFromNamespace("keep_mid_true", "ggplot2")
snake_class <- getFromNamespace("snake_class", "ggplot2")
fix_linewidth <- getFromNamespace("fix_linewidth", "ggplot2")
dapply <- getFromNamespace("dapply", "ggplot2")
unique0 <- getFromNamespace("unique0", "ggplot2")
data_frame0 <- getFromNamespace("data_frame0", "ggplot2")
fill_alpha <- getFromNamespace("fill_alpha", "ggplot2")
repair_segment_arrow <- getFromNamespace("repair_segment_arrow", "ggplot2")
snakeize <- getFromNamespace("snakeize", "ggplot2")
lower_ascii <- "abcdefghijklmnopqrstuvwxyz"
upper_ascii <- "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
to_lower_ascii <- getFromNamespace("to_lower_ascii", "ggplot2")
to_upper_ascii  <- getFromNamespace("to_upper_ascii", "ggplot2")
translate_shape_string  <- getFromNamespace("translate_shape_string", "ggplot2")
deg2rad  <- getFromNamespace("deg2rad", "ggplot2")
