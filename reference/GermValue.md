# Peak value and germination value

Compute the Peak value (\\PV\\) or Emergence Energy (\\EE\\) (Czabator
1962; Bonner 1967) and Germination value (\\GV\\) (Czabator 1962;
Djavanshir and Pourbeik 1976; Brown and Mayer 1988) .

## Usage

``` r
PeakValue(germ.counts, intervals, total.seeds, partial = TRUE)

GermValue(
  germ.counts,
  intervals,
  total.seeds,
  partial = TRUE,
  method = c("czabator", "dp"),
  from.onset = TRUE,
  k = 10
)
```

## Arguments

- germ.counts:

  Germination counts at each time interval. Can be partial or cumulative
  as specified in the argument `partial`.

- intervals:

  The time intervals.

- total.seeds:

  Total number of seeds.

- partial:

  logical. If `TRUE`, `germ.counts` is considered as partial and if
  `FALSE`, it is considered as cumulative. Default is `TRUE`.

- method:

  The method for computing germination value. Either `"czabator"` or
  `"dp"`.

- from.onset:

  logical. If `TRUE`, duration is considered only from the onset of
  germination. If `FALSE`, full duration of germination test is
  considered. Default is `TRUE`.

- k:

  Constant (See **Details**). Default is 10.

## Value

A list with the following components:

- Germination Value:

  The germination value.

- Calculations:

  The data frame of calculations.

- testend:

  The end of test value (Only for method `dp`).

## Details

Peak value (\\PV\\) is the maximum quotient obtained by dividing
successive cumulative germination values by the relevant incubation time
(Czabator 1962) .

\\PV = \max\left ( \frac{G\_{1}}{T\_{1}},\frac{G\_{2}}{T\_{2}},\cdots
\frac{G\_{k}}{T\_{k}} \right )\\

Where, \\T\_{i}\\ is the time from the start of the experiment to the
\\i\\th interval, \\G\_{i}\\ is the cumulative germination percentage in
the \\i\\th time interval, and \\k\\ is the total number of time
intervals.

It represents the mean daily germination of the most vigorous component
of the seed lot, and is a mathematical expression of the break, or
shoulder, of a typical sigmoid germination curve (Djavanshir and
Pourbeik 1976) . It is the accumulated number of seeds germinated at the
point on the germination curve at which the rate of germination starts
to decrease. It is also described as Emergence energy (Bonner 1967) .

For daily germination counts, germination value (\\GV\\) is computed as
follows (Czabator 1962) (Specified by the argument
`method = "czabator"`).

\\GV = PV \times MDG\\

Where, \\PV\\ is the peak value, and \\MDG\\ is the mean daily
germination percentage from the onset of germination.

Germination value (\\GV\\) can also be computed for other time intervals
of successive germination counts, by replacing \\MDG\\ with the mean
germination percentage per unit time (\\\overline{GP}\\).

A new estimation of germination value was given by Djavanshir and
Pourbeik (1976) as follows (Specified by the argument `method = "dp"`).

\\GV = \frac{\sum DGS}{N} \times GP \times c\\

Where, \\DGS\\ is the daily germination speed computed by dividing
cumulative germination percentage by the number of days since the onset
of germination, \\N\\ is the frequency or number of DGS calculated
during the test, \\GP\\ is the germination percentage expressed over
100, and \\c\\ is a constant. The value of \\c\\ is decided on the basis
of average daily speed of germination (\\\frac{\sum DGS}{N}\\). If it is
less than 10, then \\c\\ value of 10 can be used and if it is more than
10, then value of 7 or 8 can be used for \\c\\.

For both methods of computing \\GV\\, only the duration from the onset
of germination is considered by default. Alternatively, modified \\GV\\
(\\GV\_{mod}\\), where the entire duration from the beginning of the
test is considered can be obtained by using the argument
`from.onset = FALSE` (Brown and Mayer 1988) .

## References

Bonner FT (1967). “Ideal sowing depth for sweetgum seed.” *Tree
Planters' Notes*, **18**(1), 1–1.  
  
Brown RF, Mayer DG (1988). “Representing cumulative germination. 1. A
critical analysis of single-value germination indices.” *Annals of
Botany*, **61**(2), 117–125.  
  
Czabator FJ (1962). “Germination value: An index combining speed and
completeness of pine seed germination.” *Forest Science*, **8**(4),
386–396.  
  
Djavanshir K, Pourbeik H (1976). “Germination value-A new formula.”
*Silvae Genetica*, **25**(2), 79–83.

## Examples

``` r
x <- c(0, 0, 34, 40, 21, 10, 4, 5, 3, 5, 8, 7, 7, 6, 6, 4, 0, 2, 0, 2)
y <- c(0, 0, 34, 74, 95, 105, 109, 114, 117, 122, 130, 137, 144, 150,
      156, 160, 160, 162, 162, 164)
int <- 1:length(x)
total.seeds = 200

# From partial germination counts
#----------------------------------------------------------------------------
PeakValue(germ.counts = x, intervals = int, total.seeds = 200)
#> [1] 9.5
GermValue(germ.counts = x, intervals = int, total.seeds = 200,
          method = "czabator")
#> $`Germination Value`
#> [1] 38.95
#> 
#> [[2]]
#>    germ.counts intervals Cumulative.germ.counts Cumulative.germ.percent
#> 3           34         3                     34                    17.0
#> 4           40         4                     74                    37.0
#> 5           21         5                     95                    47.5
#> 6           10         6                    105                    52.5
#> 7            4         7                    109                    54.5
#> 8            5         8                    114                    57.0
#> 9            3         9                    117                    58.5
#> 10           5        10                    122                    61.0
#> 11           8        11                    130                    65.0
#> 12           7        12                    137                    68.5
#> 13           7        13                    144                    72.0
#> 14           6        14                    150                    75.0
#> 15           6        15                    156                    78.0
#> 16           4        16                    160                    80.0
#> 17           0        17                    160                    80.0
#> 18           2        18                    162                    81.0
#> 19           0        19                    162                    81.0
#> 20           2        20                    164                    82.0
#>         DGS
#> 3  5.666667
#> 4  9.250000
#> 5  9.500000
#> 6  8.750000
#> 7  7.785714
#> 8  7.125000
#> 9  6.500000
#> 10 6.100000
#> 11 5.909091
#> 12 5.708333
#> 13 5.538462
#> 14 5.357143
#> 15 5.200000
#> 16 5.000000
#> 17 4.705882
#> 18 4.500000
#> 19 4.263158
#> 20 4.100000
#> 
GermValue(germ.counts = x, intervals = int, total.seeds = 200,
          method = "dp", k = 10)
#> $`Germination Value`
#> [1] 53.36595
#> 
#> [[2]]
#>    germ.counts intervals Cumulative.germ.counts Cumulative.germ.percent
#> 3           34         3                     34                    17.0
#> 4           40         4                     74                    37.0
#> 5           21         5                     95                    47.5
#> 6           10         6                    105                    52.5
#> 7            4         7                    109                    54.5
#> 8            5         8                    114                    57.0
#> 9            3         9                    117                    58.5
#> 10           5        10                    122                    61.0
#> 11           8        11                    130                    65.0
#> 12           7        12                    137                    68.5
#> 13           7        13                    144                    72.0
#> 14           6        14                    150                    75.0
#> 15           6        15                    156                    78.0
#> 16           4        16                    160                    80.0
#> 17           0        17                    160                    80.0
#> 18           2        18                    162                    81.0
#> 19           0        19                    162                    81.0
#> 20           2        20                    164                    82.0
#>         DGS SumDGSbyN        GV
#> 3  5.666667  5.666667  9.633333
#> 4  9.250000  7.458333 27.595833
#> 5  9.500000  8.138889 38.659722
#> 6  8.750000  8.291667 43.531250
#> 7  7.785714  8.190476 44.638095
#> 8  7.125000  8.012897 45.673512
#> 9  6.500000  7.796769 45.611097
#> 10 6.100000  7.584673 46.266503
#> 11 5.909091  7.398497 48.090230
#> 12 5.708333  7.229481 49.521942
#> 13 5.538462  7.075752 50.945411
#> 14 5.357143  6.932534 51.994006
#> 15 5.200000  6.799262 53.034246
#> 16 5.000000  6.670744 53.365948
#> 17 4.705882  6.539753 52.318022
#> 18 4.500000  6.412268 51.939373
#> 19 4.263158  6.285850 50.915385
#> 20 4.100000  6.164414 50.548194
#> 
#> $testend
#> [1] 16
#> 
GermValue(germ.counts = x, intervals = int, total.seeds = 200,
          method = "czabator", from.onset = FALSE)
#> $`Germination Value`
#> [1] 38.95
#> 
#> [[2]]
#>    germ.counts intervals Cumulative.germ.counts Cumulative.germ.percent
#> 1            0         1                      0                     0.0
#> 2            0         2                      0                     0.0
#> 3           34         3                     34                    17.0
#> 4           40         4                     74                    37.0
#> 5           21         5                     95                    47.5
#> 6           10         6                    105                    52.5
#> 7            4         7                    109                    54.5
#> 8            5         8                    114                    57.0
#> 9            3         9                    117                    58.5
#> 10           5        10                    122                    61.0
#> 11           8        11                    130                    65.0
#> 12           7        12                    137                    68.5
#> 13           7        13                    144                    72.0
#> 14           6        14                    150                    75.0
#> 15           6        15                    156                    78.0
#> 16           4        16                    160                    80.0
#> 17           0        17                    160                    80.0
#> 18           2        18                    162                    81.0
#> 19           0        19                    162                    81.0
#> 20           2        20                    164                    82.0
#>         DGS
#> 1  0.000000
#> 2  0.000000
#> 3  5.666667
#> 4  9.250000
#> 5  9.500000
#> 6  8.750000
#> 7  7.785714
#> 8  7.125000
#> 9  6.500000
#> 10 6.100000
#> 11 5.909091
#> 12 5.708333
#> 13 5.538462
#> 14 5.357143
#> 15 5.200000
#> 16 5.000000
#> 17 4.705882
#> 18 4.500000
#> 19 4.263158
#> 20 4.100000
#> 
GermValue(germ.counts = x, intervals = int, total.seeds = 200,
          method = "dp", k = 10, from.onset = FALSE)
#> $`Germination Value`
#> [1] 46.6952
#> 
#> [[2]]
#>    germ.counts intervals Cumulative.germ.counts Cumulative.germ.percent
#> 1            0         1                      0                     0.0
#> 2            0         2                      0                     0.0
#> 3           34         3                     34                    17.0
#> 4           40         4                     74                    37.0
#> 5           21         5                     95                    47.5
#> 6           10         6                    105                    52.5
#> 7            4         7                    109                    54.5
#> 8            5         8                    114                    57.0
#> 9            3         9                    117                    58.5
#> 10           5        10                    122                    61.0
#> 11           8        11                    130                    65.0
#> 12           7        12                    137                    68.5
#> 13           7        13                    144                    72.0
#> 14           6        14                    150                    75.0
#> 15           6        15                    156                    78.0
#> 16           4        16                    160                    80.0
#> 17           0        17                    160                    80.0
#> 18           2        18                    162                    81.0
#> 19           0        19                    162                    81.0
#> 20           2        20                    164                    82.0
#>         DGS SumDGSbyN        GV
#> 1  0.000000  0.000000  0.000000
#> 2  0.000000  0.000000  0.000000
#> 3  5.666667  1.888889  3.211111
#> 4  9.250000  3.729167 13.797917
#> 5  9.500000  4.883333 23.195833
#> 6  8.750000  5.527778 29.020833
#> 7  7.785714  5.850340 31.884354
#> 8  7.125000  6.009673 34.255134
#> 9  6.500000  6.064153 35.475298
#> 10 6.100000  6.067738 37.013202
#> 11 5.909091  6.053316 39.346552
#> 12 5.708333  6.024567 41.268285
#> 13 5.538462  5.987174 43.107655
#> 14 5.357143  5.942172 44.566291
#> 15 5.200000  5.892694 45.963013
#> 16 5.000000  5.836901 46.695205
#> 17 4.705882  5.770370 46.162961
#> 18 4.500000  5.699794 46.168331
#> 19 4.263158  5.624182 45.555871
#> 20 4.100000  5.547972 45.493374
#> 
#> $testend
#> [1] 16
#> 

# From cumulative germination counts
#----------------------------------------------------------------------------
PeakValue(germ.counts = y, interval = int, total.seeds = 200,
          partial = FALSE)
#> [1] 9.5
GermValue(germ.counts = y, intervals = int, total.seeds = 200,
          partial = FALSE, method = "czabator")
#> $`Germination Value`
#> [1] 38.95
#> 
#> [[2]]
#>    germ.counts intervals Cumulative.germ.counts Cumulative.germ.percent
#> 3           34         3                     34                    17.0
#> 4           40         4                     74                    37.0
#> 5           21         5                     95                    47.5
#> 6           10         6                    105                    52.5
#> 7            4         7                    109                    54.5
#> 8            5         8                    114                    57.0
#> 9            3         9                    117                    58.5
#> 10           5        10                    122                    61.0
#> 11           8        11                    130                    65.0
#> 12           7        12                    137                    68.5
#> 13           7        13                    144                    72.0
#> 14           6        14                    150                    75.0
#> 15           6        15                    156                    78.0
#> 16           4        16                    160                    80.0
#> 17           0        17                    160                    80.0
#> 18           2        18                    162                    81.0
#> 19           0        19                    162                    81.0
#> 20           2        20                    164                    82.0
#>         DGS
#> 3  5.666667
#> 4  9.250000
#> 5  9.500000
#> 6  8.750000
#> 7  7.785714
#> 8  7.125000
#> 9  6.500000
#> 10 6.100000
#> 11 5.909091
#> 12 5.708333
#> 13 5.538462
#> 14 5.357143
#> 15 5.200000
#> 16 5.000000
#> 17 4.705882
#> 18 4.500000
#> 19 4.263158
#> 20 4.100000
#> 
GermValue(germ.counts = y, intervals = int, total.seeds = 200,
          partial = FALSE, method = "dp", k = 10)
#> $`Germination Value`
#> [1] 53.36595
#> 
#> [[2]]
#>    germ.counts intervals Cumulative.germ.counts Cumulative.germ.percent
#> 3           34         3                     34                    17.0
#> 4           40         4                     74                    37.0
#> 5           21         5                     95                    47.5
#> 6           10         6                    105                    52.5
#> 7            4         7                    109                    54.5
#> 8            5         8                    114                    57.0
#> 9            3         9                    117                    58.5
#> 10           5        10                    122                    61.0
#> 11           8        11                    130                    65.0
#> 12           7        12                    137                    68.5
#> 13           7        13                    144                    72.0
#> 14           6        14                    150                    75.0
#> 15           6        15                    156                    78.0
#> 16           4        16                    160                    80.0
#> 17           0        17                    160                    80.0
#> 18           2        18                    162                    81.0
#> 19           0        19                    162                    81.0
#> 20           2        20                    164                    82.0
#>         DGS SumDGSbyN        GV
#> 3  5.666667  5.666667  9.633333
#> 4  9.250000  7.458333 27.595833
#> 5  9.500000  8.138889 38.659722
#> 6  8.750000  8.291667 43.531250
#> 7  7.785714  8.190476 44.638095
#> 8  7.125000  8.012897 45.673512
#> 9  6.500000  7.796769 45.611097
#> 10 6.100000  7.584673 46.266503
#> 11 5.909091  7.398497 48.090230
#> 12 5.708333  7.229481 49.521942
#> 13 5.538462  7.075752 50.945411
#> 14 5.357143  6.932534 51.994006
#> 15 5.200000  6.799262 53.034246
#> 16 5.000000  6.670744 53.365948
#> 17 4.705882  6.539753 52.318022
#> 18 4.500000  6.412268 51.939373
#> 19 4.263158  6.285850 50.915385
#> 20 4.100000  6.164414 50.548194
#> 
#> $testend
#> [1] 16
#> 
GermValue(germ.counts = y, intervals = int, total.seeds = 200,
          partial = FALSE, method = "czabator", from.onset = FALSE)
#> $`Germination Value`
#> [1] 38.95
#> 
#> [[2]]
#>    germ.counts intervals Cumulative.germ.counts Cumulative.germ.percent
#> 1            0         1                      0                     0.0
#> 2            0         2                      0                     0.0
#> 3           34         3                     34                    17.0
#> 4           40         4                     74                    37.0
#> 5           21         5                     95                    47.5
#> 6           10         6                    105                    52.5
#> 7            4         7                    109                    54.5
#> 8            5         8                    114                    57.0
#> 9            3         9                    117                    58.5
#> 10           5        10                    122                    61.0
#> 11           8        11                    130                    65.0
#> 12           7        12                    137                    68.5
#> 13           7        13                    144                    72.0
#> 14           6        14                    150                    75.0
#> 15           6        15                    156                    78.0
#> 16           4        16                    160                    80.0
#> 17           0        17                    160                    80.0
#> 18           2        18                    162                    81.0
#> 19           0        19                    162                    81.0
#> 20           2        20                    164                    82.0
#>         DGS
#> 1  0.000000
#> 2  0.000000
#> 3  5.666667
#> 4  9.250000
#> 5  9.500000
#> 6  8.750000
#> 7  7.785714
#> 8  7.125000
#> 9  6.500000
#> 10 6.100000
#> 11 5.909091
#> 12 5.708333
#> 13 5.538462
#> 14 5.357143
#> 15 5.200000
#> 16 5.000000
#> 17 4.705882
#> 18 4.500000
#> 19 4.263158
#> 20 4.100000
#> 
GermValue(germ.counts = y, intervals = int, total.seeds = 200,
          partial = FALSE, method = "dp", k = 10, from.onset = FALSE)
#> $`Germination Value`
#> [1] 46.6952
#> 
#> [[2]]
#>    germ.counts intervals Cumulative.germ.counts Cumulative.germ.percent
#> 1            0         1                      0                     0.0
#> 2            0         2                      0                     0.0
#> 3           34         3                     34                    17.0
#> 4           40         4                     74                    37.0
#> 5           21         5                     95                    47.5
#> 6           10         6                    105                    52.5
#> 7            4         7                    109                    54.5
#> 8            5         8                    114                    57.0
#> 9            3         9                    117                    58.5
#> 10           5        10                    122                    61.0
#> 11           8        11                    130                    65.0
#> 12           7        12                    137                    68.5
#> 13           7        13                    144                    72.0
#> 14           6        14                    150                    75.0
#> 15           6        15                    156                    78.0
#> 16           4        16                    160                    80.0
#> 17           0        17                    160                    80.0
#> 18           2        18                    162                    81.0
#> 19           0        19                    162                    81.0
#> 20           2        20                    164                    82.0
#>         DGS SumDGSbyN        GV
#> 1  0.000000  0.000000  0.000000
#> 2  0.000000  0.000000  0.000000
#> 3  5.666667  1.888889  3.211111
#> 4  9.250000  3.729167 13.797917
#> 5  9.500000  4.883333 23.195833
#> 6  8.750000  5.527778 29.020833
#> 7  7.785714  5.850340 31.884354
#> 8  7.125000  6.009673 34.255134
#> 9  6.500000  6.064153 35.475298
#> 10 6.100000  6.067738 37.013202
#> 11 5.909091  6.053316 39.346552
#> 12 5.708333  6.024567 41.268285
#> 13 5.538462  5.987174 43.107655
#> 14 5.357143  5.942172 44.566291
#> 15 5.200000  5.892694 45.963013
#> 16 5.000000  5.836901 46.695205
#> 17 4.705882  5.770370 46.162961
#> 18 4.500000  5.699794 46.168331
#> 19 4.263158  5.624182 45.555871
#> 20 4.100000  5.547972 45.493374
#> 
#> $testend
#> [1] 16
#> 
```
