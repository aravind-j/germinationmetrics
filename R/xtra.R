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

wlcm <- paste0("\n",
               "--------------------------------------------------------------------------------\n",
               "Welcome to germinationmetrics version ", utils::packageDescription("germinationmetrics")$Version, "\n",
               "\n", "\n",
               "# To know how to use this package type:", "\n",
               "  browseVignettes(package = 'germinationmetrics')", "\n", "  for the package vignette.", "\n",
               "\n",
               "# To know whats new in this version type:", "\n",
               "  news(package='germinationmetrics')", "\n", "  for the NEWS file.", "\n",
               "\n",
               "# To cite the methods in the package type:", "\n",
               "  citation(package='germinationmetrics')","\n",
               "\n",
               "# To suppress this message use:", "\n",
               "  suppressPackageStartupMessages(library(germinationmetrics))", "\n",
               "--------------------------------------------------------------------------------\n")

.onAttach <- function(lib, pkg,...){
  packageStartupMessage(wlcm)

}
