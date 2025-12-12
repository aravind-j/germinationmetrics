# Four paramter hill function

To be used by
[`FourPHFfit`](https://aravind-j.github.io/germinationmetrics/reference/FourPHFfit.md).

## Usage

``` r
FourPHF(x, a, bta, c, y0)

FourPHF_fixa(x, a = 100, bta, c, y0)

FourPHF_fixy0(x, a, bta, c)

FourPHF_fixa_fixy0(x, a = 100, bta, c)

RateofGerm(x, a, b, c)
```

## Arguments

- x:

  The explanatory/independent variable value.

- a:

  Parameter \\a\\.

- bta:

  Parameter \\\beta\\ where \\b = e^{\beta}\\.

- c:

  Parameter \\c\\.

- y0:

  Parameter \\y\_{0}\\.

- b:

  Parameter \\b\\.

## Value

The calculated response/dependent value value.
