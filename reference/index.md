# Package index

## Single-value germination indices

- [`GermPercent()`](https://aravind-j.github.io/germinationmetrics/reference/GermPercent.md)
  [`PeakGermPercent()`](https://aravind-j.github.io/germinationmetrics/reference/GermPercent.md)
  : Germination percentage
- [`FirstGermTime()`](https://aravind-j.github.io/germinationmetrics/reference/FirstGermTime.md)
  [`LastGermTime()`](https://aravind-j.github.io/germinationmetrics/reference/FirstGermTime.md)
  [`PeakGermTime()`](https://aravind-j.github.io/germinationmetrics/reference/FirstGermTime.md)
  [`TimeSpreadGerm()`](https://aravind-j.github.io/germinationmetrics/reference/FirstGermTime.md)
  : Time for first, last and peak germination
- [`t50()`](https://aravind-j.github.io/germinationmetrics/reference/t50.md)
  : Median germination time
- [`MeanGermTime()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md)
  [`VarGermTime()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md)
  [`SEGermTime()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md)
  [`CVGermTime()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md)
  : Germination time
- [`MeanGermRate()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md)
  [`CVG()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md)
  [`VarGermRate()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md)
  [`SEGermRate()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md)
  [`GermRateRecip()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md)
  : Germination rate
- [`GermSpeed()`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md)
  [`GermSpeedAccumulated()`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md)
  [`GermSpeedCorrected()`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md)
  : Speed of germination
- [`WeightGermPercent()`](https://aravind-j.github.io/germinationmetrics/reference/WeightGermPercent.md)
  : Weighted germination percentage
- [`MeanGermPercent()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermPercent.md)
  [`MeanGermNumber()`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermPercent.md)
  : Mean germination percentage and number of seeds per time interval
- [`TimsonsIndex()`](https://aravind-j.github.io/germinationmetrics/reference/TimsonsIndex.md)
  [`GermRateGeorge()`](https://aravind-j.github.io/germinationmetrics/reference/TimsonsIndex.md)
  : Timson's index
- [`GermIndex()`](https://aravind-j.github.io/germinationmetrics/reference/GermIndex.md)
  : Germination Index
- [`EmergenceRateIndex()`](https://aravind-j.github.io/germinationmetrics/reference/EmergenceRateIndex.md)
  : Emergence Rate Index or Germination Rate Index
- [`PeakValue()`](https://aravind-j.github.io/germinationmetrics/reference/GermValue.md)
  [`GermValue()`](https://aravind-j.github.io/germinationmetrics/reference/GermValue.md)
  : Peak value and germination value
- [`CUGerm()`](https://aravind-j.github.io/germinationmetrics/reference/CUGerm.md)
  : Coefficient of uniformity of germination
- [`GermSynchrony()`](https://aravind-j.github.io/germinationmetrics/reference/GermSynchrony.md)
  [`GermUncertainty()`](https://aravind-j.github.io/germinationmetrics/reference/GermSynchrony.md)
  : Synchrony and uncertainty of germination

## Non-linear regression analysis

- [`FourPHF()`](https://aravind-j.github.io/germinationmetrics/reference/FourPHF.md)
  [`FourPHF_fixa()`](https://aravind-j.github.io/germinationmetrics/reference/FourPHF.md)
  [`FourPHF_fixy0()`](https://aravind-j.github.io/germinationmetrics/reference/FourPHF.md)
  [`FourPHF_fixa_fixy0()`](https://aravind-j.github.io/germinationmetrics/reference/FourPHF.md)
  [`RateofGerm()`](https://aravind-j.github.io/germinationmetrics/reference/FourPHF.md)
  : Four paramter hill function

- [`FourPHFfit()`](https://aravind-j.github.io/germinationmetrics/reference/FourPHFfit.md)
  : Fit four-parameter hill function

- [`plot(`*`<FourPHFfit>`*`)`](https://aravind-j.github.io/germinationmetrics/reference/plot.FourPHFfit.md)
  :

  Plot the four-parameter hill function fitted cumulative germination
  curve from a `FourPHFfit` object

## Wrapper

- [`germination.indices()`](https://aravind-j.github.io/germinationmetrics/reference/germination.indices.md)
  : Germination Indices

- [`FourPHFfit.bulk()`](https://aravind-j.github.io/germinationmetrics/reference/FourPHFfit.bulk.md)
  : Fit four-parameter hill function for multiple samples

- [`plot(`*`<FourPHFfit.bulk>`*`)`](https://aravind-j.github.io/germinationmetrics/reference/plot.FourPHFfit.bulk.md)
  :

  Plot the multiple four-parameter hill function fitted cumulative
  germination curves from a `FourPHFfit.bulk` object

## Data

- [`gcdata`](https://aravind-j.github.io/germinationmetrics/reference/gcdata.md)
  : Germination count data
