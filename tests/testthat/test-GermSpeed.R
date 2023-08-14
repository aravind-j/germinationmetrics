x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)


test_that("GermSpeed works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = GermSpeed(germ.counts = x, intervals = int),
               expected = 6.13892496392496, tolerance = 1e-12)

  # From partial germination counts (with percentages instead of counts)
  expect_equal(object = GermSpeed(germ.counts = x, intervals = int,
                                  percent = TRUE, total.seeds = 50),
               expected = 12.2778499278499, tolerance = 1e-12)
})

test_that("GermSpeed works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = GermSpeed(germ.counts = y, intervals = int,
                                  partial = FALSE),
               expected = 6.13892496392496, tolerance = 1e-12)

  # From partial germination counts (with percentages instead of counts)
  expect_equal(object = GermSpeed(germ.counts = y, intervals = int,
                                  partial = FALSE, percent = TRUE,
                                  total.seeds = 50),
               expected = 12.2778499278499, tolerance = 1e-12)
})

test_that("GermSpeedAccumulated works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = GermSpeedAccumulated(germ.counts = x, intervals = int),
               expected = 34.6156676656677, tolerance = 1e-12)

  # From partial germination counts (with percentages instead of counts)
  expect_equal(object = GermSpeedAccumulated(germ.counts = x, intervals = int,
                                             percent = TRUE, total.seeds = 50),
               expected = 69.2313353313353, tolerance = 1e-12)
})

test_that("GermSpeedAccumulated works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = GermSpeedAccumulated(germ.counts = y, intervals = int,
                                             partial = FALSE),
               expected = 34.6156676656677, tolerance = 1e-12)

  # From partial germination counts (with percentages instead of counts)
  expect_equal(object = GermSpeedAccumulated(germ.counts = y, intervals = int,
                                             partial = FALSE, percent = TRUE,
                                             total.seeds = 50),
               expected = 69.2313353313353, tolerance = 1e-12)
})

test_that("GermSpeedCorrected works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = GermSpeedCorrected(germ.counts = x, intervals = int,
                                           total.seeds = 50, method = "normal"),
               expected = 0.153473124098124, tolerance = 1e-12)
  expect_equal(object = GermSpeedCorrected(germ.counts = x, intervals = int,
                                           total.seeds = 50,
                                           method = "accumulated"),
               expected = 0.865391691641692, tolerance = 1e-12)

})

test_that("GermSpeedCorrected works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = GermSpeedCorrected(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50,
                                           method = "normal"),
               expected = 0.153473124098124, tolerance = 1e-12)
  expect_equal(object = GermSpeedCorrected(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50,
                                           method = "accumulated"),
               expected = 0.865391691641692, tolerance = 1e-12)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = GermSpeed(germ.counts = x, intervals = int),
                   expected = GermSpeed(germ.counts = y, intervals = int,
                                        partial = FALSE))
  expect_identical(object = GermSpeed(germ.counts = x, intervals = int,
                                      percent = TRUE, total.seeds = 50),
                   expected = GermSpeed(germ.counts = y, intervals = int,
                                        partial = FALSE, percent = TRUE,
                                        total.seeds = 50))

  expect_identical(object = GermSpeedAccumulated(germ.counts = x, intervals = int),
                   expected =  GermSpeedAccumulated(germ.counts = y, intervals = int,
                                                    partial = FALSE))
  expect_identical(object = GermSpeedAccumulated(germ.counts = x, intervals = int,
                                                 percent = TRUE, total.seeds = 50),
                   expected = GermSpeedAccumulated(germ.counts = y, intervals = int,
                                                   partial = FALSE, percent = TRUE,
                                                   total.seeds = 50))

  expect_identical(object = GermSpeedCorrected(germ.counts = x, intervals = int,
                                               total.seeds = 50, method = "normal"),
                   expected = GermSpeedCorrected(germ.counts = y, intervals = int,
                                                 partial = FALSE, total.seeds = 50,
                                                 method = "normal"))
  expect_identical(object = GermSpeedCorrected(germ.counts = x, intervals = int,
                                               total.seeds = 50,
                                               method = "accumulated"),
                   expected = GermSpeedCorrected(germ.counts = y, intervals = int,
                                                 partial = FALSE, total.seeds = 50,
                                                 method = "accumulated"))

})

