x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
z <- c(0, 0, 0, 0, 11, 11, 9, 7, 1, 0, 1, 0, 0, 0)
int <- 1:length(x)

test_that("FirstGermTime works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = FirstGermTime(germ.counts = x, intervals = int),
               expected = 5)
})

test_that("FirstGermTime works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = FirstGermTime(germ.counts = y, intervals = int,
                                      partial = FALSE),
               expected = 5)
})

test_that("FirstGermTime works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = LastGermTime(germ.counts = x, intervals = int),
               expected = 11)
})

test_that("FirstGermTime works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = LastGermTime(germ.counts = y, intervals = int,
                                     partial = FALSE),
               expected = 11)
})

test_that("FirstGermTime works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = TimeSpreadGerm(germ.counts = x, intervals = int),
               expected = 6)
})

test_that("FirstGermTime works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = TimeSpreadGerm(germ.counts = y, intervals = int,
                                       partial = FALSE),
               expected = 6)
})

test_that("FirstGermTime works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = PeakGermTime(germ.counts = x, intervals = int),
               expected = 6)
})

test_that("FirstGermTime works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = PeakGermTime(germ.counts = y, intervals = int,
                                     partial = FALSE),
               expected = 6)
})

test_that("PeakGermPercent with multiple peaks works; Partial germination counts", {

  # From partial germination counts
  expect_warning(object = out1 <- PeakGermTime(germ.counts = z,
                                               intervals = int),
                 regexp = "Multiple peak germination times exist.")
  expect_equal(object = out1, expected = c(5, 6))
})

test_that("PeakGermPercent with multiple peaks works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_warning(object = out2 <- PeakGermTime(germ.counts = cumsum(z),
                                                  intervals = int,
                                                  partial = FALSE),
                 regexp = "Multiple peak germination times exist.")
  expect_equal(object = out2, expected = c(5, 6))
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = FirstGermTime(germ.counts = x, intervals = int),
                   expected = FirstGermTime(germ.counts = y, intervals = int,
                                            partial = FALSE))
  expect_identical(object = LastGermTime(germ.counts = x, intervals = int),
                   expected = LastGermTime(germ.counts = y, intervals = int,
                                           partial = FALSE))
  expect_identical(object = TimeSpreadGerm(germ.counts = x, intervals = int),
                   expected = TimeSpreadGerm(germ.counts = y, intervals = int,
                                             partial = FALSE))
  expect_identical(object = PeakGermTime(germ.counts = x, intervals = int),
                   expected = PeakGermTime(germ.counts = y, intervals = int,
                                           partial = FALSE))

  expect_warning(object = out1 <- PeakGermTime(germ.counts = z,
                                               intervals = int),
                 regexp = "Multiple peak germination times exist.")
  expect_warning(object = out2 <- PeakGermTime(germ.counts = cumsum(z),
                                               intervals = int,
                                               partial = FALSE),
                 regexp = "Multiple peak germination times exist.")
  expect_identical(object = out1, expected = out2)

})

