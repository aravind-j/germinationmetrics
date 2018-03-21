
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
