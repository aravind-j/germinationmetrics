# Emergence Rate Index or Germination Rate Index

Compute the Emergence rate index or Germination rate index according to

- Shmueli and Goldberg (1971) and it's modification by de Santana and
  Ranal (2004) (Ranal and de Santana 2006) ;

- Bilbro and Wanjura (1982) ; and

- Fakorede and Ayoola (1980) , Fakorede and Ojo (1981) , and Fakorede
  and Agbana (1983) .

## Usage

``` r
EmergenceRateIndex(
  germ.counts,
  intervals,
  partial = TRUE,
  total.seeds = NULL,
  method = c("shmueligoldberg", "sgsantanaranal", "bilbrowanjura", "fakorede")
)
```

## Arguments

- germ.counts:

  Germination counts at each time interval. Can be partial or cumulative
  as specified in the argument `partial`.

- intervals:

  The time intervals.

- partial:

  logical. If `TRUE`, `germ.counts` is considered as partial and if
  `FALSE`, it is considered as cumulative. Default is `TRUE`.

- total.seeds:

  Total number of seeds.

- method:

  The method to be used. Either `"shmueligoldberg"`, `"sgsantanaranal"`,
  `"bilbrowanjura"` or `"fakorede"`. Default is `"shmueligoldberg"` (see
  **Details**).

## Value

The value of the Emergence rate index with the units according to
`method` as follows.

- `shmueligoldberg`:

  \\\mathrm{count}\\

- `sgsantanaranal`:

  \\\mathrm{no \\ unit}\\

- `bilbrowanjura`:

  \\\mathrm{count} \\ time^{-1}\\

- `fakorede`:

  \\time \\ \mathrm{count}^{-1}\\

## Details

Several germination indices are referred to as Emergence rate Index
(\\ERI\\).

### Shmueli and Goldberg (1971)

With argument `method` specified as `"shmueligoldberg"` \\ERI\\ is
estimated as follows.

\\ERI = \sum\_{i=i\_{0}}^{k-1}N\_{i}(k-i)\\

Where, \\N\_{i}\\ is the number of seeds germinated in the \\i\\th time
interval (not the accumulated number, but the number corresponding to
the \\i\\th interval), \\i\_{0}\\ is the time interval when
emergence/germination started, and \\k\\ is the total number of time
intervals.

A modification for the same was suggested by de Santana and Ranal (2004)
(Ranal and de Santana 2006) and is estimated by dividing Emergence rate
index (\\ERI\\) by total number of emerged seedlings (or germinated
seeds) as follows with argument `method` specified as
`"sgsantanaranal"`).

\\ERI\_{mod} = \frac{\sum\_{i=i\_{0}}^{k-1}N\_{i}(k-i)}{N\_{g}} =
\frac{ERI}{N\_{g}}\\

Where, \\N\_{g}\\ is the total number of germinated seeds at the end of
the test, \\N\_{i}\\ is the number of seeds germinated in the \\i\\th
time interval (not the accumulated number, but the number corresponding
to the \\i\\th interval), \\i\_{0}\\ is the time interval when
emergence/germination started, and \\k\\ is the total number of time
intervals.

### Bilbro and Wanjura (1982)

With argument `method` specified as `"bilbrowanjura"` \\ERI\\ is the
estimated as follows.

\\ERI = \frac{\sum\_{i=1}^{k}N\_{i}}{\overline{T}} =
\frac{N\_{g}}{\overline{T}}\\

Where, \\N\_{g}\\ is the total number of germinated seeds at the end of
the test, \\N\_{i}\\ is the number of seeds germinated in the \\i\\th
time interval (not the accumulated number, but the number corresponding
to the \\i\\th interval), and \\\overline{T}\\ is the mean germination
time or mean emergence time.

### Fakorede and Ayoola (1980); Fakorede and Ojo (1981); Fakorede and Agbana (1983)

With argument `method` specified as `"fakorede"` \\ERI\\ is the
estimated as follows.

\\ERI = \frac{\overline{T}}{FGP/100}\\

Where, \\\overline{T}\\ is the Mean germination time and \\FGP\\ is the
final germination time.

### Others

Apart from the above the above, the name Emergence rate index (\\ERI\\)
has also been used to for the mathematical expressions for Speed of
germination
([`GermSpeed`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md))
(Allan et al. 1962; Erbach 1982) , Timson's index
([`TimsonsIndex`](https://aravind-j.github.io/germinationmetrics/reference/TimsonsIndex.md))
(Chaudhary and Ghildyal 1970) , and George's index
([`GermRateGeorge`](https://aravind-j.github.io/germinationmetrics/reference/TimsonsIndex.md))
(Chopra and Chaudhary 1980) .

## References

Allan RE, Vogel OA, Peterson CJ (1962). “Seedling emergence rate of
fall-sown wheat and its association with plant height and coleoptile
length.” *Agronomy Journal*, **54**(4), 347.  
  
Bilbro JD, Wanjura DF (1982). “Soil crusts and cotton emergence
relationships.” *Transactions of the ASAE*, **25**(6), 1484–1487.  
  
Chaudhary TN, Ghildyal BP (1970). “Effect of temperature associated with
levels of bulk density on rice seedling emergence.” *Plant and Soil*,
**33**(1), 87–90.  
  
Chopra UK, Chaudhary TN (1980). “Effect of soil temperature alteration
by soil covers on seedling emergence of wheat (*Triticum aestivum* L.)
sown on two dates.” *Plant and Soil*, **57**(1), 125–129.  
  
de Santana DG, Ranal MA (2004). *Analise Da Germinacao: Um Enfoque
Estatistico*. Universidade de Brasilia, Brasilia.  
  
Erbach DC (1982). “Tillage for continuous corn and corn-soybean
rotation.” *Transactions of the ASAE*, **25**(4), 906–0911.  
  
Fakorede MAB, Agbana SB (1983). “Heterotic effects and association of
seedling vigour with mature characteristics and grain yield in some
tropical maize cultivars.” *Maydica*, **28**, 327–338.  
  
Fakorede MAB, Ayoola AO (1980). “Relation between seedling vigor and
selection for yield improvement in maize.” *Maydica*, **25**(3),
135–147.  
  
Fakorede MAB, Ojo DK (1981). “Variability for seedling vigour in maize.”
*Experimental Agriculture*, **17**(2), 195–201.  
  
Ranal MA, de Santana DG (2006). “How and why to measure the germination
process?” *Brazilian Journal of Botany*, **29**(1), 1–11.  
  
Shmueli M, Goldberg D (1971). “Emergence, early growth, and salinity of
five vegetable crops germinated by sprinkle and trickle irrigation in an
arid zone.” *HortScience*, **6**, 563–565.

## See also

[`GermSpeed`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md),
[`TimsonsIndex`](https://aravind-j.github.io/germinationmetrics/reference/TimsonsIndex.md),
[`GermRateGeorge`](https://aravind-j.github.io/germinationmetrics/reference/TimsonsIndex.md)

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
EmergenceRateIndex(germ.counts = x, intervals = int, total.seeds = 50)
#> [1] 292
EmergenceRateIndex(germ.counts = x, intervals = int, total.seeds = 50,
                   method = "shmueligoldberg")
#> [1] 292
EmergenceRateIndex(germ.counts = x, intervals = int, total.seeds = 50,
                   method = "sgsantanaranal")
#> [1] 7.3
EmergenceRateIndex(germ.counts = x, intervals = int, total.seeds = 50,
                   method = "bilbrowanjura")
#> [1] 5.970149
EmergenceRateIndex(germ.counts = x, intervals = int, total.seeds = 50,
                   method = "fakorede")
#> [1] 8.375

# From cumulative germination counts
#----------------------------------------------------------------------------
EmergenceRateIndex(germ.counts = y, intervals = int, total.seeds = 50,
                   partial = FALSE)
#> [1] 292
EmergenceRateIndex(germ.counts = y, intervals = int, total.seeds = 50,
                   partial = FALSE,
                   method = "shmueligoldberg")
#> [1] 292
EmergenceRateIndex(germ.counts = y, intervals = int, total.seeds = 50,
                   partial = FALSE,
                   method = "sgsantanaranal")
#> [1] 7.3
EmergenceRateIndex(germ.counts = y, intervals = int, total.seeds = 50,
                   partial = FALSE,
                   method = "bilbrowanjura")
#> [1] 5.970149
EmergenceRateIndex(germ.counts = y, intervals = int, total.seeds = 50,
                   partial = FALSE,
                   method = "fakorede")
#> [1] 8.375
```
