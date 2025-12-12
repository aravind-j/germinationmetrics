# Timson's index

Compute George's index (George 1961; Tucker and Wright 1965; Nichols and
Heydecker 1968; Chopra and Chaudhary 1980) , Timson's index or Timson's
germination velocity index (Grose and Zimmer 1958; Timson 1965; Lyon and
Coffelt 1966; Chaudhary and Ghildyal 1970; Negm and Smith 1978; Brown
and Mayer 1988; Baskin and Baskin 1998) and it's modifications by
Labouriau (Ranal and de Santana 2006) and (Khan and Ungar 1984) .

## Usage

``` r
TimsonsIndex(
  germ.counts,
  intervals,
  partial = TRUE,
  total.seeds,
  max,
  modification = c("none", "labouriau", "khanungar")
)

GermRateGeorge(germ.counts, intervals, partial = TRUE, max)
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

- max:

  The maximum interval value up to which Timson's index/George's
  germination rate is to be computed.

- modification:

  The modification to be applied. Either `"none"`, `"labouriau"` or
  `"khanungar"`. Default is `"none"` (see **Details**).

## Value

For `TimsonsIndex`, the value of Timson's index (%) if
`modification = "none"`. If `modification = "labouriau"`, then value
with no unit and if `modification = "khanungar"`, then value as %
\\\mathrm{time^{-1}}\\.

For `GermRateGeorge` The value of George's germination rate as \\count
time\\.

## Details

Timson's index (Timson 1965) is computed as follows (Grose and Zimmer
1958; Brown and Mayer 1988; Baskin and Baskin 1998) .

\\\Sigma k = \sum\_{i=1}^{k}G\_{i}\\

Where, \\G\_{i}\\ is the cumulative germination percentage in time
interval \\i\\ and \\k\\ is the total number of time intervals.

For example ten summation (\\\Sigma 10\\) is expressed as follows.

\\\Sigma 10 = G\_{1}+G\_{2}+\cdots+G\_{10}\\

Where \\G\_{1},G\_{2},\cdots G\_{10}\\ are the cumulative germination
percentage at day 1, 2, 3, \\\cdots\\, 10 respectively.

Similarly \\\Sigma 5\\ or \\\Sigma 20\\ can be estimated. For \\\Sigma
10\\, the value can range from 0 (no germination) to 1,000 (100%
germination after 24 hours).

It is the progressive total of cumulative germination percentage
recorded at specific intervals for a set period of time. It combines
onset, rate and total percentage of germination and estimates the area
under the cumulative germination percentage curve. It is same as the
indices for area under time course curve of germination described by
Lyon and Coffelt (1966) as well as Negm and Smith (1978) . It is also
described as Emergence Rate Index (\\ERI\\) by Chaudhary and Ghildyal
(1970) .

Goodchild and Walker (1971) , described the same in terms of partial
germination percentage as follows.

\\\Sigma k = \sum\_{i=1}^{k}g\_{i}(k-j)\\

Where, \\g\_{i}\\ is the germination (not cumulative, but partial
germination) in time interval \\i\\ (\\i\\ varying from \\0\\ to \\k\\),
\\k\\ is the total number of time intervals, and \\j = i - 1\\.

Timson's index is equivalent to the Germination Energy Index \\GEI\\
proposed by Grose and Zimmer (1958) .

As Timson's index is useful for comparison only when samples have
similar germinabilities or final germination percentage, the following
modification was suggested by Labouriau (Ranal and de Santana 2006)
(Specified by the argument `modification = "labouriau"`).

\\\Sigma k\_{mod} = \frac{\Sigma k}{\sum\_{i=1}^{k}g\_{i}}\\

Here Timson's index (\\\Sigma k\\) is divided by the sum of partial
germination percentages.

Similarly another modification was proposed by (Khan and Ungar 1984) ,
where Timson's index (\\\Sigma k\\) is divided by the total time period
of germination (\\T\_{k}\\) (Specified by the argument
`modification = "khanungar"`).

\\\Sigma k\_{mod} = \frac{\Sigma k}{T\_{k}}\\

Timson's index is similar to the Germination Rate (\\GR\\) proposed by
George (1961) as follows (Tucker and Wright 1965; Nichols and Heydecker
1968) .

\\GR = \sum\_{i=1}^{k}N\_{i}K\_{i}\\

Where \\N\_{i}\\ is the number of seeds germinated by \\i\\th interval,
\\K\_{i}\\ is the number of intervals(e.g. days) until the end of the
test, and \\k\\ is the total number of time intervals.

This index uses number of seeds germinated instead of germination
percentage. It is also described as Emergence Rate Index (\\ERI\\) by
Chopra and Chaudhary (1980) .

So germination rate (\\GR\\) can also be described in terms of partial
(\\N\_{i}\\) and cumulative (\\\sum\_{j=1}^{i}N\_{j}\\) number of seeds
germinated in each time interval (\\i\\) as follows.

\\GR = \sum\_{i=1}^{k}\sum\_{j=1}^{i}N\_{j}\\

\\GR = \sum\_{i=1}^{k}N\_{i}(k-j)\\

## References

Baskin CC, Baskin JM (1998). *Seeds: Ecology, Biogeography, and
Evolution of Dormancy and Germination*. Academic Press, San Diego. ISBN
0-12-080260-0.  
  
Brown RF, Mayer DG (1988). “Representing cumulative germination. 1. A
critical analysis of single-value germination indices.” *Annals of
Botany*, **61**(2), 117–125.  
  
Chaudhary TN, Ghildyal BP (1970). “Effect of temperature associated with
levels of bulk density on rice seedling emergence.” *Plant and Soil*,
**33**(1), 87–90.  
  
Chopra UK, Chaudhary TN (1980). “Effect of soil temperature alteration
by soil covers on seedling emergence of wheat (*Triticum aestivum* L.)
sown on two dates.” *Plant and Soil*, **57**(1), 125–129.  
  
George DW (1961). “Influence of germination temperature on the
expression of post-harvest dormancy in wheat.” In *Crop Science
Abstracts; Western Society of Crop Science Annual Meeting, 1961*, 15.  
  
Goodchild NA, Walker MG (1971). “A method of measuring seed germination
in physiological studies.” *Annals of Botany*, **35**(141), 615–621.  
  
Grose RJ, Zimmer WJ (1958). “Some laboratory germination responses of
the seeds of river red gum, *Eucalyptus camaldulensis* Dehn. Syn.
*Eucalyptus rostrata* Schlecht.” *Australian Journal of Botany*,
**6**(2), 129.  
  
Khan MA, Ungar IA (1984). “The effect of salinity and temperature on the
germination of polymorphic seeds and growth of *Atriplex triangularis*
Willd.” *American Journal of Botany*, **71**(4), 481–489.  
  
Lyon JL, Coffelt RJ (1966). “Rapid method for determining numerical
indexes for time-course curves.” *Nature*, **211**(5046), 330–330.  
  
Negm FB, Smith OE (1978). “Effects of ethylene and carbon dioxide on the
germination of osmotically inhibited lettuce seed.” *Plant Physiology*,
**62**(4), 473–476.  
  
Nichols MA, Heydecker W (1968). “Two approaches to the study of
germination data.” *Proceedings of the International Seed Testing
Association*, **33**(3), 531–540.  
  
Ranal MA, de Santana DG (2006). “How and why to measure the germination
process?” *Brazilian Journal of Botany*, **29**(1), 1–11.  
  
Timson J (1965). “New method of recording germination data.” *Nature*,
**207**(4993), 216.  
  
Tucker H, Wright LN (1965). “Estimating rapidity of germination.” *Crop
Science*, **5**(5), 398–399.

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
# Without max specified
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50)
#> [1] 664
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             modification = "none")
#> [1] 664
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             modification = "labouriau")
#> [1] 8.3
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             modification = "khanungar")
#> [1] 47.42857
GermRateGeorge(germ.counts = x, intervals = int)
#> [1] 332

# With max specified
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50, max = 10)
#> [1] 344
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             max = 10, modification = "none")
#> [1] 344
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             max = 10, modification = "labouriau")
#> [1] 4.410256
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             max = 10, modification = "khanungar")
#> [1] 24.57143
GermRateGeorge(germ.counts = x, intervals = int, max = 10)
#> [1] 172
GermRateGeorge(germ.counts = x, intervals = int, max = 14)
#> [1] 332


# From cumulative germination counts
#----------------------------------------------------------------------------
# Without max specified
TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
             total.seeds = 50)
#> [1] 664
TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
             total.seeds = 50,
             modification = "none")
#> [1] 664
TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
             total.seeds = 50,
             modification = "labouriau")
#> [1] 8.3
TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
             total.seeds = 50,
             modification = "khanungar")
#> [1] 47.42857
GermRateGeorge(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 332

# With max specified
TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
             total.seeds = 50, max = 10)
#> [1] 344
TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
             total.seeds = 50,
             max = 10, modification = "none")
#> [1] 344
TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
             total.seeds = 50,
             max = 10, modification = "labouriau")
#> [1] 4.410256
TimsonsIndex(germ.counts = y, intervals = int, partial = FALSE,
             total.seeds = 50,
             max = 10, modification = "khanungar")
#> [1] 24.57143
GermRateGeorge(germ.counts = y, intervals = int, partial = FALSE,
               max = 10)
#> [1] 172
GermRateGeorge(germ.counts = y, intervals = int, partial = FALSE,
               max = 14)
#> [1] 332
```
