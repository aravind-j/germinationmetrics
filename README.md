
## `germinationmetrics`: Seed Germination Indices and Curve Fitting <img src="https://raw.githubusercontent.com/aravind-j/germinationmetrics/master/inst/extdata/germinationmetrics.png" align="right" alt="logo" width="173" height = "200" style = "padding: 10px; border: none; float: right;">

###### Version : [0.1.7.9000](https://aravind-j.github.io/germinationmetrics/articles/Introduction.html#version-history); Copyright (C) 2017-2023: [ICAR-NBPGR](http://www.nbpgr.ernet.in/); License: [GPL2\|GPL-3](https://www.r-project.org/Licenses/)

##### *Aravind, J., Vimala Devi, S., Radhamani, J., Jacob, S. R., and Kalyani Srinivasan*

ICAR-National Bureau of Plant Genetic Resources, New Delhi

------------------------------------------------------------------------

<!-- badges: start -->

[![minimal R
version](https://img.shields.io/badge/R%3E%3D-3.0.2-6666ff.svg?logo=R)](https://cran.r-project.org/)
[![License: GPL
v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version-last-release/germinationmetrics)](https://cran.r-project.org/package=germinationmetrics)
[![Dependencies](https://tinyverse.netlify.com/badge/germinationmetrics)](https://cran.r-project.org/package=germinationmetrics)
[![rstudio mirror
downloads](https://cranlogs.r-pkg.org/badges/grand-total/germinationmetrics?color=green)](https://CRAN.R-project.org/package=germinationmetrics)
[![develVersion](https://img.shields.io/badge/devel%20version-0.1.7.9000-orange.svg)](https://github.com/aravind-j/germinationmetrics)
[![Github Code
Size](https://img.shields.io/github/languages/code-size/aravind-j/germinationmetrics.svg)](https://github.com/aravind-j/germinationmetrics)
[![R-CMD-check](https://github.com/aravind-j/germinationmetrics/workflows/R-CMD-check/badge.svg)](https://github.com/aravind-j/germinationmetrics/actions)
[![Project Status:
Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![Last-changedate](https://img.shields.io/badge/last%20change-2023--05--13-yellowgreen.svg)](https://github.com/aravind-j/germinationmetrics/commits/master)
[![Zenodo
DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1219630.svg)](https://doi.org/10.5281/zenodo.1219630)
[![Website -
pkgdown](https://img.shields.io/website-up-down-green-red/https/aravind-j.github.io/germinationmetrics.svg)](https://aravind-j.github.io/germinationmetrics/)
[![.](https://pro-pulsar-193905.appspot.com/UA-116205606-1/welcome-page)](https://github.com/aravind-j/google-analytics-beacon)
<!-- [![packageversion](https://img.shields.io/badge/Package%20version-0.2.3.3-orange.svg)](https://github.com/aravind-j/germinationmetrics) -->
<!-- [![GitHub Download Count](https://github-basic-badges.herokuapp.com/downloads/aravind-j/germinationmetrics/total.svg)] -->
<!-- [![Rdoc](https://www.rdocumentation.org/badges/version/germinationmetrics)](https://www.rdocumentation.org/packages/germinationmetrics) -->
<!-- badges: end -->

------------------------------------------------------------------------

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
if (!require('devtools')) install.packages('devtools')
install.packages('germinationmetrics', dependencies=TRUE)
```

The development version can be installed from github as follows:

``` r
devtools::install_github("aravind-j/germinationmetrics")
```

## Detailed tutorial

For a detailed tutorial (vignette) on how to used this package type:

``` r
browseVignettes(package = 'germinationmetrics')
```

The vignette for the latest version is also available
[online](https://aravind-j.github.io/germinationmetrics/articles/Introduction.html).

## What’s new

To know whats new in this version type:

``` r
news(package='germinationmetrics')
```

## Links

[CRAN page](https://cran.r-project.org/package=germinationmetrics)

[Github page](https://github.com/aravind-j/germinationmetrics)

[Documentation website](https://aravind-j.github.io/germinationmetrics/)

[Zenodo DOI](https://doi.org/10.5281/zenodo.1219630)

## CRAN checks

<table class="table table-striped table-hover" style="width: auto !important; ">
<thead>
<tr>
<th style="text-align:left;">
Flavour
</th>
<th style="text-align:left;">
CRAN check
</th>
</tr>
</thead>
<tbody>
<tr grouplength="6">
<td colspan="2" style="border-bottom: 1px solid;">
<strong>[![Linux](https://shields.io/badge/Linux--9cf?logo=Linux&style=social)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-devel-linux-x86_64-debian-clang
</td>
<td style="text-align:left;">
[![CRAN check -
r-devel-linux-x86_64-debian-clang](https://badges.cranchecks.info/flavor/r-devel-linux-x86_64-debian-clang/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-devel-linux-x86_64-debian-gcc
</td>
<td style="text-align:left;">
[![CRAN check -
r-devel-linux-x86_64-debian-gcc](https://badges.cranchecks.info/flavor/r-devel-linux-x86_64-debian-gcc/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-devel-linux-x86_64-fedora-clang
</td>
<td style="text-align:left;">
[![CRAN check -
r-devel-linux-x86_64-fedora-clang](https://badges.cranchecks.info/flavor/r-devel-linux-x86_64-fedora-clang/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-devel-linux-x86_64-fedora-gcc
</td>
<td style="text-align:left;">
[![CRAN check -
r-devel-linux-x86_64-fedora-gcc](https://badges.cranchecks.info/flavor/r-devel-linux-x86_64-fedora-gcc/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-patched-linux-x86_64
</td>
<td style="text-align:left;">
[![CRAN check -
r-patched-linux-x86_64](https://badges.cranchecks.info/flavor/r-patched-linux-x86_64/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-release-linux-x86_64
</td>
<td style="text-align:left;">
[![CRAN check -
r-release-linux-x86_64](https://badges.cranchecks.info/flavor/r-release-linux-x86_64/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr grouplength="3">
<td colspan="2" style="border-bottom: 1px solid;">
<strong>[![Windows](https://shields.io/badge/Windows--9cf?logo=Windows&style=social)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-devel-windows-ix86+x86_64
</td>
<td style="text-align:left;">
[![CRAN check -
r-devel-windows-ix86+x86_64](https://badges.cranchecks.info/flavor/r-devel-windows-ix86+x86_64/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-release-windows-ix86+x86_64
</td>
<td style="text-align:left;">
[![CRAN check -
r-release-windows-ix86+x86_64](https://badges.cranchecks.info/flavor/r-release-windows-ix86+x86_64/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-oldrel-windows-ix86+x86_64
</td>
<td style="text-align:left;">
[![CRAN check -
r-oldrel-windows-ix86+x86_64](https://badges.cranchecks.info/flavor/r-oldrel-windows-ix86+x86_64/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr grouplength="2">
<td colspan="2" style="border-bottom: 1px solid;">
<strong>[![MacOS](https://shields.io/badge/MacOS--9cf?logo=Apple&style=social)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-release-macos-x86_64
</td>
<td style="text-align:left;">
[![CRAN check -
r-release-macos-x86_64](https://badges.cranchecks.info/flavor/r-release-macos-x86_64/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
r-oldrel-macos-x86_64
</td>
<td style="text-align:left;">
[![CRAN check -
r-oldrel-macos-x86_64](https://badges.cranchecks.info/flavor/r-oldrel-macos-x86_64/germinationmetrics.svg)](https://cran.r-project.org/web/checks/check_results_germinationmetrics.html)
</td>
</tr>
</tbody>
</table>

## Citing `germinationmetrics`

To cite the methods in the package use:

``` r
citation("germinationmetrics")
```

    To cite the R package 'germinationmetrics' in publications use:

      Aravind, J., Vimala Devi, S., Radhamani, J., Jacob, S. R., and Kalyani Srinivasan (2023).  germinationmetrics: Seed
      Germination Indices and Curve Fitting. R package version 0.1.7.9000,
      https://github.com/aravind-j/germinationmetricshttps://cran.r-project.org/package=germinationmetrics.

    A BibTeX entry for LaTeX users is

      @Manual{,
        title = {germinationmetrics: Seed Germination Indices and Curve Fitting},
        author = {J. Aravind and S. {Vimala Devi} and J. Radhamani and Sherry Rachel Jacob and {Kalyani Srinivasan}},
        year = {2023},
        note = {R package version 0.1.7.9000},
        note = {https://aravind-j.github.io/germinationmetrics/},
        note = {https://CRAN.R-project.org/package=germinationmetrics},
      }

    This free and open-source software implements academic research by the authors and co-workers. If you use it, please
    support the project by citing the package.
