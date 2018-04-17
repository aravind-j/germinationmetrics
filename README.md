
## `germinationmetrics`: Seed Germination Indices and Curve Fitting

###### Version : [0.1.0.9000](https://aravind-j.github.io/germinationmetrics/articles/Introduction.html#version-history); Copyright (C) 2017-2018: [ICAR-NBPGR](http://www.nbpgr.ernet.in/); License: [GPL2|GPL-3](https://www.r-project.org/Licenses/)

##### *J. Aravind, S. Vimala Devi, J. Radhamani, Sherry R. Jacob and Kalyani Srinivasan*

ICAR-National Bureau of Plant Genetic Resources, New Delhi

-----

[![minimal R
version](https://img.shields.io/badge/R%3E%3D-3.0.2-6666ff.svg)](https://cran.r-project.org/)
[![License: GPL
v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version-last-release/germinationmetrics)](https://cran.r-project.org/package=germinationmetrics)
[![rstudio mirror
downloads](https://cranlogs.r-pkg.org/badges/grand-total/germinationmetrics?color=green)](https://CRAN.R-project.org/package=germinationmetrics)
<!-- [![packageversion](https://img.shields.io/badge/Package%20version-0.2.3.3-orange.svg)](https://github.com/aravind-j/germinationmetrics) -->
[![develVersion](https://img.shields.io/badge/devel%20version-0.1.0.9000-orange.svg)](https://github.com/aravind-j/germinationmetrics)
<!-- [![GitHub Download Count](https://github-basic-badges.herokuapp.com/downloads/aravind-j/germinationmetrics/total.svg)] -->
[![Project Status:
WIP](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Last-changedate](https://img.shields.io/badge/last%20change-2018--04--18-yellowgreen.svg)](/commits/master)
[![Rdoc](http://www.rdocumentation.org/badges/version/germinationmetrics)](http://www.rdocumentation.org/packages/germinationmetrics)
[![Zenodo
DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1219630.svg)](https://doi.org/10.5281/zenodo.1219630)
[![Analytics](https://pro-pulsar-193905.appspot.com/UA-116205606-1/welcome-page)](https://github.com/aravind-j/google-analytics-beacon)

-----

## Description

Provides functions to compute various germination indices such as
germinability, median germination time, mean germination time, mean
germination rate, speed of germination, Timson’s index, germination
value, coefficient of uniformity of germination, uncertainty of
germination process, synchrony of germination etc. from germination
count data. Includes functions for fitting cumulative seed germination
curves using four-parameter hill function and computation of associated
parameters. See the vignette for more, including full list of citations
for the methods implemented.

## Installation

The package can be installed from CRAN as follows:

``` r
install.packages('germinationmetrics', dependencies=TRUE)
```

The development version can be installed from github as follows:

``` r
devtools::install_github("aravind-j/germinationmetrics")
```

## Detailed tutorial

For a detailed tutorial on how to used this package type:

``` r
browseVignettes(package = 'germinationmetrics')
```

## What’s new

To know whats new in this version type:

``` r
news(package='germinationmetrics')
```

## Links

## Citing `germinationmetrics`

To cite the methods in the package use:

``` r
citation("germinationmetrics")
```

``` 

To cite the R package 'germinationmetrics' in publications use:

  J. Aravind, S. Vimala Devi, J. Radhamani, Sherry Rachel Jacob
  and Kalyani Srinivasan (2018).  germinationmetrics: Seed
  Germination Indices and Curve Fitting . R package version
  0.1.0.9000, https://aravind-j.github.io/germinationmetrics/.

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {germinationmetrics: Seed Germination Indices and Curve Fitting},
    author = {{Aravind J} and {Vimala Devi S} and {Radhamani J} and {Sherry Rachel Jacob} and {Kalyani Srinivasan}},
    note = {R package version 0.1.0.9000},
    note = {https://aravind-j.github.io/germinationmetrics/},
    year = {2018},
  }

This free and open-source software implements academic research by
the authors and co-workers. If you use it, please support the
project by citing the package.
```
