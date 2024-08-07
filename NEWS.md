# germinationmetrics  0.1.9

## NEW FUNCTIONS:
* `geom_line2` - A modification of `ggplot2::geom_line` to plot both lines and points together.

## UPDATED FUNCTIONS:
* `FourPHFfit` - Added better error handling. Now gracefully fails by returning empty output due to convergence errors or when fitting is not possible.
* `FourPHFfit.bulk` - Added better convergence error handling. Added grid search for finding starting values.
* `plot.FourPHFfit.bulk` - Now uses `geom_errorbar` for showing uniformity. Added better plotting without overlap using `geom_line2`.
* `t50` - Fixes bug causing incorrect results when multiple values of Ni and Nj are present (Thanks to Aude Maugarny @amaugarn).

# germinationmetrics  0.1.8

## UPDATED FUNCTIONS:
* `FirstGermTime`, `LastGermTime`, `TimeSpreadGerm` - Fixed issue with incorrect display of results in case of intervals which are not in days (Thanks to D. Vijay Dunna.Vijay[at]icar.gov.in).
* `FourPHFfit`, `plot.FourPHFfit` `FourPHFfit.bulk` and `plot.FourPHFfit.bulk` - Replaced fitting using `minpack.lm::nlsLM` with `gslnls::gsl_nls`.
* `FourPHFfit.bulk` and `plot.FourPHFfit.bulk` - Fixed issue with plotting of cumulative data with `show.points = TRUE` (Thanks to D. Vijay for Dunna.Vijay[at]icar.gov.in).
* `FourPHFfit.bulk` - Added fit quality evaluation in output.
* `VarGermTime`, `SEGermTime`, `SEGermRate`, `CUGerm` - Fixed calculation bug with cumulative data.

## OTHER NOTES: 
* Added unit tests with `testthat`.
* Fixed `inst/CITATION`.

# germinationmetrics  0.1.7

## UPDATED FUNCTIONS:
* `FourPHFfit.bulk` - Fixed false "`total number of seeds tested is less than the total number of germinated seeds`" warning when germination count data is cumulative (Thanks to D. Vijay for Dunna.Vijay[at]icar.gov.in).
* `FourPHFfit` - Updated computation of starting values.

## VIGNETTE:
* Resolved duplicate chunk labels.

## OTHER NOTES: 
* Updated documentation for `WeightGermPercent` and `germination.indices` to fix HTML validation problems.

# germinationmetrics  0.1.6

## NEW FUNCTIONS:
* `PeakGermPercent` - Compute peak germination percentage.

## UPDATED FUNCTIONS:
* `FirstGermTime`, `LastGermTime` and `PeakGermTime` - Updated documentation with formula.
* `EmergenceRateIndex` - Depreciate erroneous `method` argument options of `melville` and `melvillesantanaranal` and replace them with `shmueligoldberg` and `sgsantanaranal` respectively.
 `GermSpeedCorrected` - Use germination percentage instead of counts.
* `EmergenceRateIndex`, `GermIndex`, `GermSpeedCorrected`, `GermValue`, `GermRateRecip` and `TimsonsIndex` - Minor documentation update.

## VIGNETTE:
* Fixed fetching CRAN page for version history to fail gracefully when access is down.
* Updated units in Table 3.

# germinationmetrics  0.1.5

## NEW FUNCTIONS:
* `plot.FourPHFfit.bulk` - Wrapper function around `FourPHFfit` for multiple samples.

## UPDATED FUNCTIONS:
* `FourPHFfit` - Added warning for low germination percentages. Modified to return `NA` output for zero total germination inputs with non-converging fits so as not to break `FourPHFfit.bulk`.

## VIGNETTE:
* Removed cairo dependency.

# germinationmetrics  0.1.4

## NEW FUNCTIONS:
* `FourPHFfit.bulk` - Wrapper function around `FourPHFfit` for multiple samples.
* `GermIndex` - Compute germination index according to Melville et al., (1980).
* `EmergenceRateIndex` - Compute emergence rate index according to Shmueli and
Goldberg (1971), Bilbro and Wanjura (1982), and Fakorede and Ayoola (1980).

## UPDATED FUNCTIONS:
* `FourPHFfit` - Added more checks for the input arguments `umax`, `umin`, `xp`, `tries` and `tmax`.
* `MeanGermPercent`, `MeanGermNumber`, `GermSynchrony`, `GermUncertainty`, `TimsonsIndex`, `GermRateGeorge`, `GermSpeed`, `GermSpeedAccumulated`, `FirstGermTime`, `GermValue`, `PeakValue`, `WeightGermPercent`, `t50`, `MeanGermRate`, `MeanGermTime`, `germination.indices`, `FourPHFfit` and `FourPHFfit.bulk` - Fixed the check for uniformity of intervals to handle non-integer values correctly. Closes issue #3.(Thanks to Jonas Ohlsson [@jonasoh])
* `TimsonsIndex` and `GermRateGeorge`- Fixed to handle interval data other than days.

## VIGNETTE:
* Fixed details of Median germination time in Table 3.
* Fixed typo in formula for CUG in Table 3.
* Added reference for Coefficient of variation of the germination time in Table 3.
* Reverted to using system certificates instead of RCurl ones for fetching and displaying version history as suggested by Prof. Brian Ripley (ripley@stats.ox.ac.uk).

## OTHER NOTES: 
* Error in case of non-uniform intervals converted to warning.
* Fixed documentation errors in `FourPHFfit` and `CVGermTime`.
* Updated documentation for `GermSpeed`, `GermSpeedAccumulated`, `CUGerm` `MeanGermRate`, `SEGermRate`, `CVG`, `MeanGermTime`, `VarGermTime`, `SEGermTime`, `GermUncertainty`, `GermSynchrony`, `MeanGermPercent`, `MeanGermNumber`,   `WeightGermPercent`, `TimsonsIndex`, `GermRateGeorge` and `GermSynchrony`.
* Converted all equations in Rd files to `MathJax`using `mathjaxr`
* Added long running examples to `\donttest` in `germination.indices`, `plot.FourPHFfit`, `gcdata` and `FourPHFfit.bulk`.

# germinationmetrics  0.1.3

## NEW FUNCTIONS:
* `WeightGermPercent` - Compute the Weighted germination percentage.
* `germination.indices` - wrapper function to compute germination indices in batch.

## UPDATED FUNCTIONS:
* `CVGermTime` - Fixed error in function name (`CVSEGermTime`).
* `TimsonsIndex` - Fixed error in method name (`khanungar`).
* `GermSpeed` and `GermSpeedAccumulated` - Updated with option to use percentage germination in addition to germination counts.
* `GermSpeedCorrected` - Updated with option to use `GermSpeedAccumulated` in addition to `GermSpeed`.
* `GermValue` - Updated with option to consider time from start of test in addition to time from onset of germination.

## VIGNETTE:
* Fixed LATEX xcolor options clash issue in vignette.

## OTHER NOTES: 
* Updated documentation - `GermValue`, `MeanGermTime` and `TimsonsIndex`.

# germinationmetrics  0.1.2

## OTHER NOTES: 
* Removed non-ASCII symbols in `inst/REFERENCES.bib` being used by `Rdpack` macro to enforce UTF-8 encoding.
* Added inline citations in documentation with Rdpack `\insertCite{}{}` and replaced all `\insertRef{}{}` with `\insertAllCited{}`.
* Fixed https link issue in vignette.
* Added mirror set command in vignette.
* Added `XML`, `RCurl` and `httr` to suggests.

# germinationmetrics  0.1.1

## NEW FUNCTIONS:
* `plot.FourPHFfit` - plot method for `FourPHFfit`.

## UPDATED FUNCTIONS:
* `FourPHFfit` - Fixed code to accommodate changes in the new release of `broom` package.
* `FourPHFfit` - Separated plot method to new function `plot.FourPHFfit`.
 
## VIGNETTE:
* Fixed LATEX xcolor options clash issue in vignette.
* Fixed issue with missing pandoc in case of r-release-osx-x86_64.

## OTHER NOTES:
* Fixed citation information.
* Added zenodo and rdocumentation badges.
* Added CRAN installation instructions in Readme.
* Added logo.

# germinationmetrics  0.1.0

* First release

# germinationmetrics  0.0.0.9000

* Pre-release
