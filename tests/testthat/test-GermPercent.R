x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
z <- c(0, 0, 0, 0, 11, 11, 9, 7, 1, 0, 1, 0, 0, 0)
int <- 1:length(x)

test_that("GermPercent works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = GermPercent(germ.counts = x, total.seeds = 50),
               expected = 80)

  # From number of germinated seeds
  expect_equal(GermPercent(germinated.seeds = 40, total.seeds = 50),
               expected = 80)

  # Error in case both germ.counts and germinated.seeds are provided
  expect_error(object = GermPercent(germ.counts = x, total.seeds = 50,
                                    germinated.seeds = 40),
               regexp = "Provide only either one of the two arguments\n'germinated.seeds' or 'germ.counts' and not both")

  # Error in case germ.counts is not a numeric vector
  expect_error(object = GermPercent(germ.counts = as.character(x),
                                    total.seeds = 50),
               regexp = "'germ.counts' should be a numeric vector.")

  # Error in case partial is not a numeric vector of length 1
  expect_error(object = GermPercent(germ.counts = x, total.seeds = 50,
                                    partial = 25),
               regexp = "'partial' should be a logical vector of length 1.")
  expect_error(object = GermPercent(germ.counts = x, total.seeds = 50,
                                    partial = c(TRUE, FALSE)),
               regexp = "'partial' should be a logical vector of length 1.")

})

test_that("GermPercent works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = GermPercent(germ.counts = y, total.seeds = 50,
                                    partial = FALSE),
               expected = 80)

  # Error in case both germ.counts and germinated.seeds are provided
  expect_error(object = GermPercent(germ.counts = y, total.seeds = 50,
                                    germinated.seeds = 40),
               regexp = "Provide only either one of the two arguments\n'germinated.seeds' or 'germ.counts' and not both")


  # Error in case germ.counts is not a numeric vector
  expect_error(object = GermPercent(germ.counts = as.character(y),
                                    total.seeds = 50),
               regexp = "'germ.counts' should be a numeric vector.")

  # Error in case total.seeds' is not a numeric vector of length 1
  expect_error(object = GermPercent(germ.counts = x,
                                    total.seeds = as.character(50)),
               regexp = "'total.seeds' should be a numeric vector of length 1.")
  expect_error(object = GermPercent(germ.counts = x,
                                    total.seeds = c(50, 25)),
               regexp = "'total.seeds' should be a numeric vector of length 1.")

  # Error in case partial is not a numeric vector of length 1
  expect_error(object = GermPercent(germ.counts = y, total.seeds = 50,
                                    partial = 25),
               regexp = "'partial' should be a logical vector of length 1.")
  expect_error(object = GermPercent(germ.counts = y, total.seeds = 50,
                                    partial = c(TRUE, FALSE)),
               regexp = "'partial' should be a logical vector of length 1.")

  # Error in case germ.counts is not cumulative
  expect_error(object = GermPercent(germ.counts = x, total.seeds = 50,
                                    partial = FALSE),
               regexp = "'germ.counts' is not cumulative.")
})

test_that("PeakGermPercent works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = PeakGermPercent(germ.counts = x, intervals = int,
                                        total.seeds = 50),
               expected = 34)

  # Error in case germ.counts is not a numeric vector
  expect_error(object = PeakGermPercent(germ.counts = as.character(x),
                                        intervals = int,
                                        total.seeds = 50),
               regexp = "'germ.counts' should be a numeric vector.")

  # Error in case intervals is not a numeric vector
  expect_error(object = PeakGermPercent(germ.counts = x,
                                        intervals = as.character(int),
                                        total.seeds = 50),
               regexp = "'intervals' should be a numeric vector.")

  # Error in case germ.counts and intervals are of equal length
  expect_error(object = PeakGermPercent(germ.counts = x, intervals = int[-1],
                                        total.seeds = 50),
               regexp = "'germ.counts' and 'intervals' lengths differ.")
  expect_error(object = PeakGermPercent(germ.counts = x[-1], intervals = int,
                                        total.seeds = 50),
               regexp = "'germ.counts' and 'intervals' lengths differ.")

  # Error in case total.seeds' is not a numeric vector of length 1
  expect_error(object = PeakGermPercent(germ.counts = x, intervals = int,
                                        total.seeds = as.character(50)),
               regexp = "'total.seeds' should be a numeric vector of length 1.")
  expect_error(object = PeakGermPercent(germ.counts = x, intervals = int,
                                        total.seeds = c(50, 25)),
               regexp = "'total.seeds' should be a numeric vector of length 1.")

  # Error in case partial is not a numeric vector of length 1
  expect_error(object = PeakGermPercent(germ.counts = x, intervals = int,
                                        total.seeds = 50,
                                        partial = 25),
               regexp = "'partial' should be a logical vector of length 1.")
  expect_error(object = PeakGermPercent(germ.counts = x, intervals = int,
                                        total.seeds = 50,
                                        partial = c(TRUE, FALSE)),
               regexp = "'partial' should be a logical vector of length 1.")
})

test_that("PeakGermPercent works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = PeakGermPercent(germ.counts = y, intervals = int,
                                        total.seeds = 50, partial = FALSE),
               expected = 34)

  # Error in case germ.counts is not a numeric vector
  expect_error(object = PeakGermPercent(germ.counts = as.character(y),
                                        intervals = int,
                                        total.seeds = 50, partial = FALSE),
               regexp = "'germ.counts' should be a numeric vector.")

  # Error in case intervals is not a numeric vector
  expect_error(object = PeakGermPercent(germ.counts = y,
                                        intervals = as.character(int),
                                        total.seeds = 50, partial = FALSE),
               regexp = "'intervals' should be a numeric vector.")

  # Error in case germ.counts and intervals are of equal length
  expect_error(object = PeakGermPercent(germ.counts = y, intervals = int[-1],
                                        total.seeds = 50, partial = FALSE),
               regexp = "'germ.counts' and 'intervals' lengths differ.")
  expect_error(object = PeakGermPercent(germ.counts = y[-1], intervals = int,
                                        total.seeds = 50, partial = FALSE),
               regexp = "'germ.counts' and 'intervals' lengths differ.")

  # Error in case total.seeds is not a numeric vector of length 1
  expect_error(object = PeakGermPercent(germ.counts = y, intervals = int,
                                        total.seeds = as.character(50),
                                        partial = FALSE),
               regexp = "'total.seeds' should be a numeric vector of length 1.")
  expect_error(object = PeakGermPercent(germ.counts = y, intervals = int,
                                        total.seeds = c(50, 25),
                                        partial = FALSE),
               regexp = "'total.seeds' should be a numeric vector of length 1.")

  # Error in case partial is not a numeric vector of length 1
  expect_error(object = PeakGermPercent(germ.counts = y, intervals = int,
                                        total.seeds = 50,
                                        partial = 25),
               regexp = "'partial' should be a logical vector of length 1.")
  expect_error(object = PeakGermPercent(germ.counts = y, intervals = int,
                                        total.seeds = 50,
                                        partial = c(TRUE, FALSE)),
               regexp = "'partial' should be a logical vector of length 1.")

  # Error in case germ.counts is not cumulative
  expect_error(object = PeakGermPercent(germ.counts = x, intervals = int,
                                        total.seeds = 50,
                                        partial = FALSE),
               regexp = "'germ.counts' is not cumulative.")
})

test_that("PeakGermPercent with multiple peaks works; Partial germination counts", {

  # From partial germination counts
  expect_warning(object = out1 <- PeakGermPercent(germ.counts = z,
                                                  intervals = int,
                                                  total.seeds = 50),
                 regexp = "Multiple peak germination times exist.")
  expect_equal(object = out1, expected = 22)

  # Error in case germ.counts is not a numeric vector
  expect_error(object = PeakGermPercent(germ.counts = as.character(z),
                                        intervals = int,
                                        total.seeds = 50),
               regexp = "'germ.counts' should be a numeric vector.")

  # Error in case intervals is not a numeric vector
  expect_error(object = PeakGermPercent(germ.counts = z,
                                        intervals = as.character(int),
                                        total.seeds = 50),
               regexp = "'intervals' should be a numeric vector.")

  # Error in case germ.counts and intervals are of equal length
  expect_error(object = PeakGermPercent(germ.counts = z, intervals = int[-1],
                                        total.seeds = 50),
               regexp = "'germ.counts' and 'intervals' lengths differ.")
  expect_error(object = PeakGermPercent(germ.counts = z[-1], intervals = int,
                                        total.seeds = 50),
               regexp = "'germ.counts' and 'intervals' lengths differ.")

  # Error in case total.seeds' is not a numeric vector of length 1
  expect_error(object = PeakGermPercent(germ.counts = z, intervals = int,
                                        total.seeds = as.character(50)),
               regexp = "'total.seeds' should be a numeric vector of length 1.")
  expect_error(object = PeakGermPercent(germ.counts = z, intervals = int,
                                        total.seeds = c(50, 25)),
               regexp = "'total.seeds' should be a numeric vector of length 1.")

  # Error in case partial is not a numeric vector of length 1
  expect_error(object = PeakGermPercent(germ.counts = z, intervals = int,
                                        total.seeds = 50,
                                        partial = 25),
               regexp = "'partial' should be a logical vector of length 1.")
  expect_error(object = PeakGermPercent(germ.counts = z, intervals = int,
                                        total.seeds = 50,
                                        partial = c(TRUE, FALSE)),
               regexp = "'partial' should be a logical vector of length 1.")

})

test_that("PeakGermPercent with multiple peaks works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_warning(object = out2 <- PeakGermPercent(germ.counts = cumsum(z),
                                                  intervals = int,
                                                  total.seeds = 50,
                                                  partial = FALSE),
                 regexp = "Multiple peak germination times exist.")
  expect_equal(object = out2, expected = 22)

  # Error in case germ.counts is not a numeric vector
  expect_error(object = PeakGermPercent(germ.counts = as.character(cumsum(z)),
                                        intervals = int,
                                        total.seeds = 50, partial = FALSE),
               regexp = "'germ.counts' should be a numeric vector.")

  # Error in case intervals is not a numeric vector
  expect_error(object = PeakGermPercent(germ.counts = cumsum(z),
                                        intervals = as.character(int),
                                        total.seeds = 50, partial = FALSE),
               regexp = "'intervals' should be a numeric vector.")

  # Error in case germ.counts and intervals are of equal length
  expect_error(object = PeakGermPercent(germ.counts = cumsum(z),
                                        intervals = int[-1],
                                        total.seeds = 50, partial = FALSE),
               regexp = "'germ.counts' and 'intervals' lengths differ.")
  expect_error(object = PeakGermPercent(germ.counts = cumsum(z)[-1],
                                        intervals = int,
                                        total.seeds = 50, partial = FALSE),
               regexp = "'germ.counts' and 'intervals' lengths differ.")

  # Error in case total.seeds is not a numeric vector of length 1
  expect_error(object = PeakGermPercent(germ.counts = cumsum(z),
                                        intervals = int,
                                        total.seeds = as.character(50),
                                        partial = FALSE),
               regexp = "'total.seeds' should be a numeric vector of length 1.")
  expect_error(object = PeakGermPercent(germ.counts = cumsum(z),
                                        intervals = int,
                                        total.seeds = c(50, 25),
                                        partial = FALSE),
               regexp = "'total.seeds' should be a numeric vector of length 1.")

  # Error in case partial is not a numeric vector of length 1
  expect_error(object = PeakGermPercent(germ.counts = cumsum(z),
                                        intervals = int,
                                        total.seeds = 50,
                                        partial = 25),
               regexp = "'partial' should be a logical vector of length 1.")
  expect_error(object = PeakGermPercent(germ.counts = cumsum(z),
                                        intervals = int,
                                        total.seeds = 50,
                                        partial = c(TRUE, FALSE)),
               regexp = "'partial' should be a logical vector of length 1.")

  # Error in case germ.counts is not cumulative
  expect_error(object = PeakGermPercent(germ.counts = z, intervals = int,
                                        total.seeds = 50,
                                        partial = FALSE),
               regexp = "'germ.counts' is not cumulative.")
})
