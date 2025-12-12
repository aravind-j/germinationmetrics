# Fit four-parameter hill function

Fit a four-parameter hill function (El-Kassaby et al. 2008) to
cumulative germination count data and compute the associated parameters.

## Usage

``` r
FourPHFfit(
  germ.counts,
  intervals,
  total.seeds,
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

A list with the following components:

- data:

  A data frame with the data used for computing the model.

- Parameters:

  A data frame of parameter estimates, standard errors and p value.

- Fit:

  A one-row data frame with estimates of model fitness such as log
  likelyhoods, Akaike Information Criterion, Bayesian Information
  Criterion, deviance and residual degrees of freedom.

- a:

  The asymptote or the maximum cumulative germination percentage.

- b:

  The mathematical parameter controlling the shape and steepness of the
  germination curve.

- c:

  The half-maximal activation level.

- y0:

  The intercept on the y axis.

- lag:

  Time at germination onset.

- Dlag50:

  duration between the time at germination onset (lag) and that at 50%
  germination.

- t50.total:

  Time required for 50% of total seeds to germinate. Will be `NaN` if
  more than 50% of total seeds do not germinate.

- txp.total:

  Time required for x% (as specified in argument `xp`) of total seeds to
  germinate. Will be `NaN` if more than x% of total seeds do not
  germinate.

- t50.Germinated:

  Time required for 50% of viable/germinated seeds to germinate.

- txp.Germinated:

  Time required for x% (as specified in argument `xp`) of
  viable/germinated seeds to germinate.

- Uniformity:

  Time interval between `umin`% and `umax`% of viable seeds to
  germinate.

- TMGR:

  Time at maximum germination rate.

- AUC:

  The estimate of area under the curve.

- MGT:

  Mean germination time.

- Skewness:

  Skewness of mean germination time.

- msg:

  The message from
  [`gsl_nls`](https://rdrr.io/pkg/gslnls/man/gsl_nls.html).

- isConv:

  Logical value indicating whether convergence was achieved.

- model:

  The raw fitted model output as a list of class `gsl_nls`.

## Details

The cumulative germination count data of a seed lot can be modelled to
fit a four-parameter hill function defined as follows (El-Kassaby et al.
2008) .

\\y = y\_{0}+\frac{ax^{b}}{c^{b}+x^{b}}\\

Where, \\y\\ is the cumulative germination percentage at time \\x\\,
\\y\_{0}\\ is the intercept on the y axis, \\a\\ is the asymptote, or
maximum cumulative germination percentage, which is equivalent to
germination capacity, \\b\\ is a mathematical parameter controlling the
shape and steepness of the germination curve (the larger the \\b\\
parameter, the steeper the rise toward the asymptote \\a\\, and the
shorter the time between germination onset and maximum germination), and
\\c\\ is the "half-maximal activation level" which represents the time
required for 50% of viable seeds to germinate (\\c\\ is equivalent to
the germination speed).

In `FourPHFfit`, this model has be reparameterized by substituting \\b\\
with \\e^{\beta}\\ to constraint \\b\\ to positive values only.

\\y = y\_{0}+\frac{ax^{e^{\beta}}}{c^{e^{\beta}}+x^{e^{\beta}}}\\

Where, \\b = e^{\beta}\\ and \\\beta = \log\_{e}(b)\\.

The curve fitting is performed with nonlinear
[`gslnls`](https://rdrr.io/pkg/gslnls/man/gsl_nls.html) package, a R
interface to the least-squares optimization with the GNU Scientific
Library (GSL) with the Levenberg-Marquardt algorithm (Chau 2023) .

Once this function is fitted to the curve, `FourPHFfit` computes the
time to 50% germination of total seeds (`t50.total`) or viable seeds
(`t50.Germinated`). Similarly the time at any percentage of germination
(in terms of both total and viable seeds) as specified in argument `xp`
can be computed.

The time at germination onset (\\lag\\) can be computed as follows.

\\lag = b\sqrt{\frac{-y\_{0}c^{b}}{a + y\_{0}}}\\

The value \\D\_{lag-50}\\ is defined as the duration between the time at
germination onset (lag) and that at 50% germination (\\c\\).

The time interval between the percentages of viable seeds specified in
the arguments `umin` and `umin` to germinate is computed as uniformity
(\\U\_{t\_{max}-t\_{min}}\\).

\\U\_{t\_{max}-t\_{min}} = t\_{max} - t\_{min}\\

The partial derivative of the four-parameter hill function gives the
instantaneous rate of germination (\\s\\) as follows.

\\s = \frac{\partial y}{\partial x} =
\frac{abc^{b}x^{b-1}}{(c^{b}+x^{b})^{2}}\\

From this function for instantaneous rate of germination, the time at
maximum germination rate (\\TMGR\\) can be estimated as follows.

\\TMGR = b \sqrt{\frac{c^{b}(b-1)}{b+1}}\\

TMGR represents the point in time when the instantaneous rate of
germination starts to decline.

The area under the curve (\\AUC\\) is obined by integration of the
fitted curve between time 0 and time specified in the argument \`tmax\`.

Integration of the fitted curve gives the value of mean germination time
(\\MGT\\) and the skewness of the germination curve is computed as the
ratio of \\MGT\\ and the time for 50% of viable seeds to germinate
(\\t\_{50}\\).

\\Skewness = \frac{MGT}{t\_{50}}\\

If final germination percentage is less than 10%, a warning is given, as
the results may not be informative.

## References

Chau J (2023). “gslnls: GSL Nonlinear Least-Squares Fitting.”  
  
El-Kassaby YA, Moss I, Kolotelo D, Stoehr M (2008). “Seed germination:
Mathematical representation and parameters extraction.” *Forest
Science*, **54**(2), 220–227.  
  
Galassi M (ed.) (2009). *GNU Scientific Library Reference Manual: For
GSL Version 1.12*, 3. ed edition. Network Theory, Bristol. ISBN
978-0-9546120-7-8.

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)
total.seeds = 50

# From partial germination counts
#----------------------------------------------------------------------------
FourPHFfit(germ.counts = x, intervals = int, total.seeds = 50, tmax = 20)
#> $data
#>    gp csgp intervals
#> 1   0    0         1
#> 2   0    0         2
#> 3   0    0         3
#> 4   0    0         4
#> 5   8    8         5
#> 6  34   42         6
#> 7  20   62         7
#> 8  14   76         8
#> 9   2   78         9
#> 10  0   78        10
#> 11  2   80        11
#> 12  0   80        12
#> 13  0   80        13
#> 14  0   80        14
#> 
#> $Parameters
#>   term estimate  std.error statistic      p.value
#> 1  bta 2.290709 0.05602634  40.88628 2.965932e-14
#> 2    c 6.034954 0.03872162 155.85488 3.270089e-21
#> 
#> $Fit
#>     sigma isConv       finTol    logLik      AIC      BIC deviance df.residual
#> 1 1.61522   TRUE 6.039613e-14 -25.49868 56.99736 58.91453 31.30723          12
#>   nobs
#> 1   14
#> 
#> $a
#> [1] 80
#> 
#> $b
#> [1] 9.881937
#> 
#> $c
#> [1] 6.034954
#> 
#> $y0
#> [1] 0
#> 
#> $lag
#> [1] 0
#> 
#> $Dlag50
#> [1] 6.034954
#> 
#> $t50.total
#> [1] 6.355121
#> 
#> $txp.total
#>       10       60 
#> 4.956264 6.744598 
#> 
#> $t50.Germinated
#> [1] 6.034954
#> 
#> $txp.Germinated
#>       10       60 
#> 4.831807 6.287724 
#> 
#> $Uniformity
#>         90         10 uniformity 
#>   7.537690   4.831807   2.705882 
#> 
#> $TMGR
#> [1] 5.912194
#> 
#> $AUC
#> [1] 1108.976
#> 
#> $MGT
#> [1] 6.632252
#> 
#> $Skewness
#> [1] 1.098973
#> 
#> $msg
#> [1] "#1. success "
#> 
#> $isConv
#> [1] TRUE
#> 
#> $model
#> Nonlinear regression model
#>   model: csgp ~ FourPHF_fixa_fixy0(x = intervals, a = max(csgp), bta,     c)
#>    data: data
#>   bta     c 
#> 2.291 6.035 
#>  residual sum-of-squares: 31.31
#> 
#> Algorithm: multifit/levenberg-marquardt, (scaling: levenberg, solver: qr)
#> 
#> Number of iterations to convergence: 9 
#> Achieved convergence tolerance: 6.04e-14
#> 
#> attr(,"class")
#> [1] "FourPHFfit" "list"      

# From cumulative germination counts
#----------------------------------------------------------------------------
FourPHFfit(germ.counts = y, intervals = int, total.seeds = 50, tmax = 20,
           partial = FALSE)
#> $data
#>    gp csgp intervals
#> 1   0    0         1
#> 2   0    0         2
#> 3   0    0         3
#> 4   0    0         4
#> 5   8    8         5
#> 6  34   42         6
#> 7  20   62         7
#> 8  14   76         8
#> 9   2   78         9
#> 10  0   78        10
#> 11  2   80        11
#> 12  0   80        12
#> 13  0   80        13
#> 14  0   80        14
#> 
#> $Parameters
#>   term estimate  std.error statistic      p.value
#> 1  bta 2.290709 0.05602634  40.88628 2.965932e-14
#> 2    c 6.034954 0.03872162 155.85488 3.270089e-21
#> 
#> $Fit
#>     sigma isConv       finTol    logLik      AIC      BIC deviance df.residual
#> 1 1.61522   TRUE 6.039613e-14 -25.49868 56.99736 58.91453 31.30723          12
#>   nobs
#> 1   14
#> 
#> $a
#> [1] 80
#> 
#> $b
#> [1] 9.881937
#> 
#> $c
#> [1] 6.034954
#> 
#> $y0
#> [1] 0
#> 
#> $lag
#> [1] 0
#> 
#> $Dlag50
#> [1] 6.034954
#> 
#> $t50.total
#> [1] 6.355121
#> 
#> $txp.total
#>       10       60 
#> 4.956264 6.744598 
#> 
#> $t50.Germinated
#> [1] 6.034954
#> 
#> $txp.Germinated
#>       10       60 
#> 4.831807 6.287724 
#> 
#> $Uniformity
#>         90         10 uniformity 
#>   7.537690   4.831807   2.705882 
#> 
#> $TMGR
#> [1] 5.912194
#> 
#> $AUC
#> [1] 1108.976
#> 
#> $MGT
#> [1] 6.632252
#> 
#> $Skewness
#> [1] 1.098973
#> 
#> $msg
#> [1] "#1. success "
#> 
#> $isConv
#> [1] TRUE
#> 
#> $model
#> Nonlinear regression model
#>   model: csgp ~ FourPHF_fixa_fixy0(x = intervals, a = max(csgp), bta,     c)
#>    data: data
#>   bta     c 
#> 2.291 6.035 
#>  residual sum-of-squares: 31.31
#> 
#> Algorithm: multifit/levenberg-marquardt, (scaling: levenberg, solver: qr)
#> 
#> Number of iterations to convergence: 9 
#> Achieved convergence tolerance: 6.04e-14
#> 
#> attr(,"class")
#> [1] "FourPHFfit" "list"      
```
