### This file is part of 'germinationmetrics' package for R.

### Copyright (C) 2017-2022, ICAR-NBPGR.
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


if (getRversion() >= "2.15.1")  {
  utils::globalVariables(
    c("x", "y", "lab", "intervals", "csgp",
      "t50_Coolbear", "t50_Farooq", "GermRateRecip_Coolbear",
      "GermRateRecip_Farooq", "GermSpeed_Count", "GermSpeed_Percent",
      "GermSpeedAccumulated_Count", "GermSpeedAccumulated_Percent",
      "GermSpeedCorrected_Normal", "GermSpeedCorrected_Accumulated",
      "TimsonsIndex_Labouriau", "TimsonsIndex_KhanUngar", "GermValue_Czabator",
      "GermValue_DP", "GermValue_Czabator_mod", "GermValue_DP_mod","GermIndex_mod",
      "EmergenceRateIndex_Melville", "EmergenceRateIndex_Melville_mod",
      "EmergenceRateIndex_BilbroWanjura", "EmergenceRateIndex_Fakorede", ".",
      "a", "b", "curve", "dfgp", "gp", "y0")
  )
}
