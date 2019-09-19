# germinationmetrics  0.1.4

## NEW FUNCTIONS:
* `FourPHFfit.bulk` - Wrapper function around `FourPHFfit` for multiple samples.

## UPDATED FUNCTIONS:
* `FourPHFfit` - Added more checks for the input arguments `umax`, `umin`, `xp`, `tries` and `tmax`.
* `MeanGermPercent`, `MeanGermNumber`, `GermSynchrony`, `GermUncertainty`, `TimsonsIndex`, `GermRateGeorge`, `GermSpeed`, `GermSpeedAccumulated`, `FirstGermTime`, `GermValue`, `PeakValue`, `WeightGermPercent`, `t50`, `MeanGermRate`, `MeanGermTime`, `germination.indices`, `FourPHFfit` and `FourPHFfit.bulk` - Fixed the check for uniformity of intervals to handle non-integer values correclty. Closes issue #3.(Thanks to Jonas Ohlsson [@jonasoh])

## OTHER NOTES: 
* Error in case of non-uniform intervals converted to warning.

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
