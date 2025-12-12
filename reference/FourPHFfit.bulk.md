# Fit four-parameter hill function for multiple samples

Fit four-parameter hill function from a data frame of germination counts
recorded at specific time intervals for multiple samples in batch.

## Usage

``` r
FourPHFfit.bulk(
  data,
  total.seeds.col,
  counts.intervals.cols,
  intervals,
  partial = TRUE,
  fix.y0 = TRUE,
  fix.a = TRUE,
  tmax,
  xp = c(10, 60),
  umin = 10,
  umax = 90,
  tries = 3
)
```

## Arguments

- data:

  A data frame with the germination count data. It should possess
  columns with

  - Partial or cumulative germination counts per time interval (to be
    indicated by the argument `counts.intervals.cols` and

  - Total number of seeds tested (to be indicated by the argument
    `total.seeds.col`).

- total.seeds.col:

  The name of the column in `data` with the total number of seeds
  tested.

- counts.intervals.cols:

  The names of columns in `data` with the germination counts (partial or
  cumulative, as indicated by the argument `partial`) per time interval
  (indicated by the argument `intervals`).

- intervals:

  The time intervals.

- partial:

  logical. If `TRUE`, `germ.counts` is considered as partial and if
  `FALSE`, it is considered as cumulative. Default is `TRUE`.

- fix.y0:

  Force the intercept of the y axis through 0.

- fix.a:

  Fix a as the actual maximum germination percentage at the end of the
  experiment.

- tmax:

  The time up to which AUC is to be computed.

- xp:

  Germination percentage value(s) for which the corresponding time is to
  be computed as a numeric vector. Default is `c(10, 60)`.

- umin:

  The minimum germination percentage value for computing uniformity.
  Default is `10`. Seed **`Details`**.

- umax:

  The maximum germination percentage value for computing uniformity.
  Default is `90`. Seed **`Details`**.

- tries:

  The number of tries to be attempted to fit the curve. Default is 3.

## Value

A data frame with the original data along with the various parameters of
the respective fitted four-parameter hill function.

## References

El-Kassaby YA, Moss I, Kolotelo D, Stoehr M (2008). “Seed germination:
Mathematical representation and parameters extraction.” *Forest
Science*, **54**(2), 220–227.

## See also

This function is a wrapper around the
[`FourPHFfit`](https://aravind-j.github.io/germinationmetrics/reference/FourPHFfit.md)
function for fitting four-parameter hill curve.

## Examples

``` r
# \donttest{
data(gcdata)

counts.per.intervals <- c("Day01", "Day02", "Day03", "Day04", "Day05",
                          "Day06", "Day07", "Day08", "Day09", "Day10",
                          "Day11", "Day12", "Day13", "Day14")

FourPHFfit.bulk(gcdata, total.seeds.col = "Total Seeds",
                    counts.intervals.cols = counts.per.intervals,
                    intervals = 1:14, partial = TRUE,
                    fix.y0 = TRUE, fix.a = TRUE, xp = c(10, 60),
                    tmax = 20, tries = 3, umax = 90, umin = 10)
#>    Genotype Rep Day01 Day02 Day03 Day04 Day05 Day06 Day07 Day08 Day09 Day10
#> 1        G1   1     0     0     0     0     4    17    10     7     1     0
#> 2        G2   1     0     0     0     1     3    15    13     6     2     1
#> 3        G3   1     0     0     0     2     3    18     9     8     2     1
#> 4        G4   1     0     0     0     0     4    19    12     6     2     1
#> 5        G5   1     0     0     0     0     5    20    12     8     1     0
#> 6        G1   2     0     0     0     0     3    21    11     7     1     1
#> 7        G2   2     0     0     0     0     4    18    11     7     1     0
#> 8        G3   2     0     0     0     1     3    14    12     6     2     1
#> 9        G4   2     0     0     0     1     3    19    10     8     1     1
#> 10       G5   2     0     0     0     0     4    18    13     6     2     1
#> 11       G1   3     0     0     0     0     5    21    11     8     1     0
#> 12       G2   3     0     0     0     0     3    20    10     7     1     1
#> 13       G3   3     0     0     0     0     4    19    12     8     1     1
#> 14       G4   3     0     0     0     0     3    21    11     6     1     0
#> 15       G5   3     0     0     0     0     4    17    10     8     1     1
#>    Day11 Day12 Day13 Day14 Total Seeds        a         b        c y0 lag
#> 1      1     0     0     0          50 80.00000  9.881937 6.034954  0   0
#> 2      0     1     0     0          51 82.35294  9.227666 6.175193  0   0
#> 3      1     1     0     0          48 93.75000  7.793051 6.138110  0   0
#> 4      1     1     0     0          51 90.19608  8.925655 6.125173  0   0
#> 5      0     1     1     0          50 96.00000  9.419181 6.049642  0   0
#> 6      1     1     0     0          49 93.87755  9.450149 6.097415  0   0
#> 7      1     0     0     0          48 87.50000 10.172459 6.029851  0   0
#> 8      0     1     0     0          47 85.10638  8.940696 6.189774  0   0
#> 9      1     1     0     0          52 86.53846  8.617391 6.125122  0   0
#> 10     0     1     0     0          50 90.00000  9.608844 6.109504  0   0
#> 11     0     1     1     0          51 94.11765  9.400212 6.018760  0   0
#> 12     1     1     0     0          51 86.27451  9.162526 6.108452  0   0
#> 13     0     1     1     0          49 95.91837  8.995210 6.149012  0   0
#> 14     1     1     0     0          48 91.66667 10.391845 6.015910  0   0
#> 15     1     0     0     0          48 87.50000  9.136744 6.121579  0   0
#>      Dlag50 t50.total t10.total t60.total t50.Germinated t10.Germinated
#> 1  6.034954  6.355121  4.956264  6.744598       6.034954       4.831807
#> 2  6.175193  6.473490  4.983236  6.872603       6.175193       4.866755
#> 3  6.138110  6.244191  4.673022  6.608438       6.138110       4.630062
#> 4  6.125173  6.276794  4.850875  6.614968       6.125173       4.788597
#> 5  6.049642  6.103433  4.814125  6.386789       6.049642       4.790946
#> 6  6.097415  6.182279  4.868632  6.477599       6.097415       4.832471
#> 7  6.029851  6.202812  4.930422  6.510495       6.029851       4.858476
#> 8  6.189774  6.439510  4.940057  6.823299       6.189774       4.841105
#> 9  6.125122  6.352172  4.836658  6.733276       6.125122       4.746573
#> 10 6.109504  6.253043  4.920629  6.566506       6.109504       4.860681
#> 11 6.018760  6.099435  4.798627  6.391291       6.018760       4.764246
#> 12 6.108452  6.326184  4.893596  6.684526       6.108452       4.806013
#> 13 6.149012  6.207501  4.841308  6.509954       6.149012       4.816393
#> 14 6.015910  6.122389  4.915140  6.397491       6.015910       4.869398
#> 15 6.121579  6.317392  4.892502  6.667247       6.121579       4.813083
#>    t60.Germinated Uniformity_90 Uniformity_10 Uniformity     TMGR      AUC
#> 1        6.287724      7.537690      4.831807   2.705882 5.912194 1108.976
#> 2        6.452582      7.835407      4.866755   2.968652 6.031282 1128.559
#> 3        6.465924      8.137342      4.630062   3.507280 5.938180 1283.693
#> 4        6.409838      7.834810      4.788597   3.046213 5.972686 1239.887
#> 5        6.315746      7.639028      4.790946   2.848083 5.914289 1328.328
#> 6        6.364722      7.693469      4.832471   2.860997 5.961879 1294.463
#> 7        6.275050      7.483643      4.858476   2.625166 5.914057 1213.908
#> 8        6.476945      7.914163      4.841105   3.073058 6.036192 1164.346
#> 9        6.420208      7.904041      4.746573   3.157468 5.961631 1188.793
#> 10       6.372823      7.679177      4.860681   2.818496 5.978115 1240.227
#> 11       6.284051      7.603611      4.764246   2.839365 5.883557 1305.200
#> 12       6.384836      7.763854      4.806013   2.957841 5.964080 1188.021
#> 13       6.432524      7.850345      4.816393   3.033952 5.998270 1316.407
#> 14       6.255276      7.432372      4.869398   2.562974 5.905180 1273.385
#> 15       6.399357      7.785806      4.813083   2.972723 5.976087 1203.664
#>         MGT Skewness          msg    sigma       finTol    logLik      AIC
#> 1  6.632252 1.098973 #1. success  1.615220 6.039613e-14 -25.49868 56.99736
#> 2  6.784407 1.098655 #1. success  1.115372 6.217249e-14 -20.31471 46.62943
#> 3  6.772742 1.103392 #1. success  2.432704 1.790568e-12 -31.23213 68.46426
#> 4  6.739666 1.100323 #1. success  2.396582 8.526513e-14 -31.02269 68.04538
#> 5  6.654981 1.100062 #1. success  2.399662 1.094236e-12 -31.04067 68.08135
#> 6  6.702473 1.099232 #1. success  3.034962 1.392664e-12 -34.32887 74.65774
#> 7  6.622417 1.098272 #1. success  1.663019 7.105427e-14 -25.90697 57.81395
#> 8  6.804000 1.099232 #1. success  1.120704 4.302336e-12 -20.38149 46.76298
#> 9  6.745241 1.101242 #1. success  2.429960 8.810730e-13 -31.21633 68.43266
#> 10 6.711900 1.098600 #1. success  1.686656 8.199663e-12 -26.10456 58.20911
#> 11 6.624248 1.100600 #1. success  2.628113 2.984279e-13 -32.31381 70.62762
#> 12 6.718639 1.099892 #1. success  2.878146 1.008971e-12 -33.58613 73.17227
#> 13 6.762274 1.099733 #1. success  2.604588 3.126388e-13 -32.18793 70.37586
#> 14 6.604967 1.097916 #1. success  2.764756 9.379164e-13 -33.02342 72.04684
#> 15 6.732266 1.099760 #1. success  1.954008 7.602807e-13 -28.16444 62.32888
#>         BIC  deviance df.residual nobs
#> 1  58.91453  31.30723          12   14
#> 2  48.54660  14.92865          12   14
#> 3  70.38143  71.01658          12   14
#> 4  69.96256  68.92324          12   14
#> 5  69.99852  69.10052          12   14
#> 6  76.57491 110.53195          12   14
#> 7  59.73112  33.18760          12   14
#> 8  48.68015  15.07174          12   14
#> 9  70.34984  70.85647          12   14
#> 10 60.12629  34.13771          12   14
#> 11 72.54479  82.88372          12   14
#> 12 75.08944  99.40469          12   14
#> 13 72.29303  81.40654          12   14
#> 14 73.96401  91.72652          12   14
#> 15 64.24606  45.81777          12   14
# }
```
