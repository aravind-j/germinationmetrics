# Speed of germination

Compute the following metrics:

- `GermSpeed`:

  Speed of germination (\\S\\) or Germination rate index or Index of
  velocity of germination or Germination index or Emergence rate index
  (Throneberry and Smith 1955; Maguire 1962; Allan et al. 1962; Kendrick
  and Frankland 1969; Bouton et al. 1976; Erbach 1982; AOSA 1983;
  Khandakar and Bradbeer 1983; Hsu and Nelson 1986; Bradbeer 1988;
  Wardle et al. 1991) .

- `GermSpeedAccumulated`:

  Speed of accumulated germination (\\S\_{accumulated}\\) (Bradbeer
  1988; Wardle et al. 1991; Haugland and Brandsaeter 1996; de Santana
  and Ranal 2004) .

- `GermSpeedCorrected`:

  Corrected speed of germination (\\\hat{S}\\) or Corrected germination
  rate index (Evetts and Burnside 1972) .

## Usage

``` r
GermSpeed(
  germ.counts,
  intervals,
  partial = TRUE,
  percent = FALSE,
  total.seeds = NULL
)

GermSpeedAccumulated(
  germ.counts,
  intervals,
  partial = TRUE,
  percent = FALSE,
  total.seeds = NULL
)

GermSpeedCorrected(
  germ.counts,
  intervals,
  partial = TRUE,
  total.seeds,
  method = c("normal", "accumulated")
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

- percent:

  logical. If `TRUE`, germination percentage is used instead of counts
  for computation. Default is `FALSE`.

- total.seeds:

  Total number of seeds. Mandatory for computation when
  `percent = TRUE`.

- method:

  The method for computing germination speed in `GermSpeedCorrected`.
  Either `"normal"` (`GermSpeed`) or `"accumulated"`
  (`GermSpeedAccumulated`).

## Value

For `GermSpeed`, the value of germination speed as \\\mathrm{count \\
time^{-1}}\\ or % \\\mathrm{time^{-1}}\\.

For `GermSpeedAccumulated`, the value of accumulated germination speed
as \\\mathrm{count \\ time^{-1}}\\ or % \\\mathrm{time^{-1}}\\.

For `GermSpeedCorrected`, the corrected speed of germination as
\\\mathrm{time^{-1}}\\.

## Details

`GermSpeed` computes the speed of germination according to the following
formula (Throneberry and Smith 1955; Maguire 1962; Allan et al. 1962;
Kendrick and Frankland 1969; Bouton et al. 1976; Erbach 1982; AOSA 1983;
Khandakar and Bradbeer 1983; Hsu and Nelson 1986; Bradbeer 1988; Wardle
et al. 1991) .

\\S = \frac{N\_{1}}{T\_{1}} + \frac{N\_{2}}{T\_{2}} +
\frac{N\_{3}}{T\_{3}} + \cdots + \frac{N\_{k}}{T\_{k}}\\

Where, \\N\_{1}\\, \\N\_{2}\\, \\N\_{3}\\, \\\cdots\\, \\N\_{k}\\ are
the number of germinated seeds observed at time (days or hours)
\\T\_{1}\\, \\T\_{2}\\, \\T\_{3}\\, \\\cdots\\, \\T\_{k}\\ after sowing
(Not accumulated/cumulative number, but the number of seeds that
germinated at the specific time) and \\k\\ is the total number of time
intervals.

It is the same as Emergence Rate Index (\\ERI\\) described by Allan et
al. (1962) , Erbach (1982) and Hsu and Nelson (1986) as well as
Germination Index (\\GI\\) according to AOSA (1983) .

The formula can also be described as follows.

\\S = \sum\_{i=1}^{k}\frac{N\_{i}}{T\_{i}}\\

Where, \\T\_{i}\\ is the time from the start of the experiment to the
\\i\\th interval, \\N\_{i}\\ is the number of seeds germinated in the
\\i\\th time interval (not the accumulated number, but the number
corresponding to the \\i\\th interval), and \\k\\ is the total number of
time intervals.

`GermSpeedAccumulated` computes the speed of accumulated germination as
follows (Bradbeer 1988; Wardle et al. 1991; Haugland and Brandsaeter
1996; de Santana and Ranal 2004) .

\\S\_{accumulated} = \frac{N\_{1}}{T\_{1}} + \frac{N\_{1} +
N\_{2}}{T\_{2}} + \frac{N\_{1} + N\_{2} + N\_{3}}{T\_{3}} + \cdots
+\frac{N\_{1} + N\_{2} + \cdots + N\_{k}}{T\_{k}}\\

Where, \\N\_{1}\\, \\N\_{2}\\, \\N\_{3}\\, \\\cdots\\, \\N\_{k}\\ are
the number of germinated seeds observed at time (days or hours)
\\T\_{1}\\, \\T\_{2}\\, \\T\_{3}\\, \\\cdots\\, \\T\_{k}\\ after sowing
(Not accumulated/cumulative number, but the number of seeds that
germinated at the specific time), and \\k\\ is the total number of time
intervals.

The formula can also be described as follows.

\\S\_{accumulated} =
\sum\_{i=1}^{k}\frac{\sum\_{j=1}^{i}N\_{j}}{T\_{i}}\\

Where, \\T\_{i}\\ is the time from the start of the experiment to the
\\i\\th interval, \\\sum\_{j=1}^{i}N\_{j}\\ is the cumuative/accumulated
number of seeds germinated in the \\i\\th time interval, and \\k\\ is
the total number of time intervals.

Speed of germination expresses the rate of germination in terms of the
total number of seeds that germinate in a time interval. Higher values
indicate greater and faster germination. This is useful for comparisons
only when samples or treatments possess similar germinabilities. This is
overcome by either using the corrected speed of germination or by using
germination percentages instead of counts for computing speed.

`GermSpeedCorrected` computes the corrected speed of germination \\S\\
or corrected speed of accumulated germination \\\hat{S}\\ as follows
(Evetts and Burnside 1972) .

\\\hat{S} = \frac{S}{FGP}\\

\\\hat{S}\_{accumulated} = \frac{S\_{accumulated}}{FGP}\\

Where, \\S\\ is the germination speed or \\\hat{S}\\ is the accumulated
speed of germination (as specified by the argument `method = "normal"`
or `method = "accumulated"` respectively) computed with germination
percentage instead of counts and \\FGP\\ is the final germination
percentage or germinability.

With `percent = TRUE`, germination percentage is used instead of counts
for computation in `GermSpeed` and `GermSpeedAccumulated`. In case of
`GermSpeedCorrected`, germination percentage is always used for the
numerator.

## References

Allan RE, Vogel OA, Peterson CJ (1962). “Seedling emergence rate of
fall-sown wheat and its association with plant height and coleoptile
length.” *Agronomy Journal*, **54**(4), 347.  
  
AOSA (1983). *Seed Vigor Testing Handbook*. Association of Official Seed
Analysts, Ithaca, NY, USA.  
  
Bouton JH, Dudeck AE, Smith RL (1976). “Germination in freshly harvested
seed of centipedegrass.” *Agronomy Journal*, **68**(6), 991.  
  
Bradbeer JW (1988). *Seed Dormancy and Germination*. Blackie, Glasgow
and London.  
  
de Santana DG, Ranal MA (2004). *Analise Da Germinacao: Um Enfoque
Estatistico*. Universidade de Brasilia, Brasilia.  
  
Erbach DC (1982). “Tillage for continuous corn and corn-soybean
rotation.” *Transactions of the ASAE*, **25**(4), 906–0911.  
  
Evetts LL, Burnside OC (1972). “Germination and seedling development of
common milkweed and other species.” *Weed Science*, **20**(4),
371–378.  
  
Haugland E, Brandsaeter LO (1996). “Experiments on bioassay sensitivity
in the study of allelopathy.” *Journal of Chemical Ecology*, **22**(10),
1845–1859.  
  
Hsu FH, Nelson CJ (1986). “Planting date effects on seedling development
of perennial warm-season forage grasses. I. Field emergence.” *Agronomy
Journal*, **78**(1), 33–38.  
  
Kendrick RE, Frankland B (1969). “Photocontrol of germination in
*Amaranthus caudatus*.” *Planta*, **85**(4), 326–339.  
  
Khandakar AL, Bradbeer JW (1983). *Jute seed quality*. Bangladesh
Agricultural Research Council, Dhaka.  
  
Maguire JD (1962). “Speed of germination - Aid in selection and
evaluation for seedling emergence and vigor.” *Crop Science*, **2**(2),
176–177.  
  
Throneberry GO, Smith FG (1955). “Relation of respiratory and enzymatic
activity to corn seed viability.” *Plant Physiology*, **30**(4),
337–343.  
  
Wardle DA, Ahmed M, Nicholson KS (1991). “Allelopathic influence of
nodding thistle (*Carduus nutans* L.) seeds on germination and radicle
growth of pasture plants.” *New Zealand Journal of Agricultural
Research*, **34**(2), 185–191.

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
GermSpeed(germ.counts = x, intervals = int)
#> [1] 6.138925
GermSpeedAccumulated(germ.counts = x, intervals = int)
#> [1] 34.61567
GermSpeedCorrected(germ.counts = x, intervals = int, total.seeds = 50,
                   method = "normal")
#> [1] 0.1534731
GermSpeedCorrected(germ.counts = x, intervals = int, total.seeds = 50,
                   method = "accumulated")
#> [1] 0.8653917

# From partial germination counts (with percentages instead of counts)
#----------------------------------------------------------------------------
GermSpeed(germ.counts = x, intervals = int,
          percent = TRUE, total.seeds = 50)
#> [1] 12.27785
GermSpeedAccumulated(germ.counts = x, intervals = int,
                     percent = TRUE, total.seeds = 50)
#> [1] 69.23134

# From cumulative germination counts
#----------------------------------------------------------------------------
GermSpeed(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 6.138925
GermSpeedAccumulated(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 34.61567
GermSpeedCorrected(germ.counts = y, intervals = int,
                   partial = FALSE, total.seeds = 50, method = "normal")
#> [1] 0.1534731
GermSpeedCorrected(germ.counts = y, intervals = int,
                   partial = FALSE, total.seeds = 50, method = "accumulated")
#> [1] 0.8653917

# From cumulative germination counts (with percentages instead of counts)
#----------------------------------------------------------------------------
GermSpeed(germ.counts = y, intervals = int, partial = FALSE,
          percent = TRUE, total.seeds = 50)
#> [1] 12.27785
GermSpeedAccumulated(germ.counts = y, intervals = int, partial = FALSE,
                     percent = TRUE, total.seeds = 50)
#> [1] 69.23134
```
