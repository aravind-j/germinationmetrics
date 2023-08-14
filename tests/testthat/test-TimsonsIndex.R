x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("TimsonsIndex works; Partial germination counts", {

  # From partial germination counts; max specified
  expect_equal(object = TimsonsIndex(germ.counts = x, intervals = int,
                                     total.seeds = 50),
               expected = 664)
  expect_equal(object = TimsonsIndex(germ.counts = x, intervals = int,
                                     total.seeds = 50,
                                     modification = "none"),
               expected = 664)
  expect_equal(object = TimsonsIndex(germ.counts = x, intervals = int,
                                     total.seeds = 50,
                                     modification = "labouriau"),
               expected = 8.3)
  expect_equal(object = TimsonsIndex(germ.counts = x, intervals = int,
                                     total.seeds = 50,
                                     modification = "khanungar"),
               expected = 47.4285714285714, tolerance = 1e-12)

  # From partial germination counts; max not specified
  expect_equal(object = TimsonsIndex(germ.counts = x, intervals = int,
                                     total.seeds = 50, max = 10),
               expected = 344)
  expect_equal(object = TimsonsIndex(germ.counts = x, intervals = int,
                                     total.seeds = 50, max = 10,
                                     modification = "none"),
               expected = 344)
  expect_equal(object = TimsonsIndex(germ.counts = x, intervals = int,
                                     total.seeds = 50, max = 10,
                                     modification = "labouriau"),
               expected = 4.41025641025641, tolerance = 1e-12)
  expect_equal(object = TimsonsIndex(germ.counts = x, intervals = int,
                                     total.seeds = 50, max = 10,
                                     modification = "khanungar"),
               expected = 24.5714285714286, tolerance = 1e-12)
})

test_that("TimsonsIndex works; Cumulative germination counts", {

  # From cumulative germination counts; max specified
  expect_equal(object = TimsonsIndex(germ.counts = y, intervals = int,
                                     partial = FALSE, total.seeds = 50),
               expected = 664)
  expect_equal(object = TimsonsIndex(germ.counts = y, intervals = int,
                                     partial = FALSE,
                                     total.seeds = 50,
                                     modification = "none"),
               expected = 664)
  expect_equal(object = TimsonsIndex(germ.counts = y, intervals = int,
                                     partial = FALSE, total.seeds = 50,
                                     modification = "labouriau"),
               expected = 8.3)
  expect_equal(object = TimsonsIndex(germ.counts = y, intervals = int,
                                     partial = FALSE, total.seeds = 50,
                                     modification = "khanungar"),
               expected = 47.4285714285714, tolerance = 1e-12)

  # From cumulative germination counts; max not specified
  expect_equal(object = TimsonsIndex(germ.counts = y, intervals = int,
                                     partial = FALSE, total.seeds = 50,
                                     max = 10),
               expected = 344)
  expect_equal(object = TimsonsIndex(germ.counts = y, intervals = int,
                                     partial = FALSE, total.seeds = 50,
                                     max = 10, modification = "none"),
               expected = 344)
  expect_equal(object = TimsonsIndex(germ.counts = y, intervals = int,
                                     partial = FALSE, total.seeds = 50,
                                     max = 10, modification = "labouriau"),
               expected = 4.41025641025641, tolerance = 1e-12)
  expect_equal(object = TimsonsIndex(germ.counts = y, intervals = int,
                                     partial = FALSE, total.seeds = 50,
                                     max = 10, modification = "khanungar"),
               expected = 24.5714285714286, tolerance = 1e-12)
})

test_that("GermRateGeorge works; Partial germination counts", {

  # From partial germination counts; max specified
  expect_equal(object = GermRateGeorge(germ.counts = x, intervals = int),
               expected = 332)

  # From partial germination counts; max not specified
  expect_equal(object = GermRateGeorge(germ.counts = x, intervals = int,
                                       max = 10),
               expected = 172)
  expect_equal(object = GermRateGeorge(germ.counts = x, intervals = int,
                                       max = 14),
               expected = 332)
})

test_that("GermRateGeorge works; Cumulative germination counts", {

  # From cumulative germination counts; max specified
  expect_equal(object = GermRateGeorge(germ.counts = y, intervals = int, partial = FALSE),
               expected = 332)

  # From cumulative germination counts; max not specified
  expect_equal(object = GermRateGeorge(germ.counts = y, intervals = int,
                                       partial = FALSE, max = 10),
               expected = 172)
  expect_equal(object = GermRateGeorge(germ.counts = y, intervals = int,
                                       partial = FALSE, max = 14),
               expected = 332)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = TimsonsIndex(germ.counts = x, intervals = int,
                                         total.seeds = 50),
                   expected = TimsonsIndex(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50))
  expect_identical(object = TimsonsIndex(germ.counts = x, intervals = int,
                                         total.seeds = 50,
                                         modification = "none"),
                   expected = TimsonsIndex(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50,
                                           modification = "none"))
  expect_identical(object = TimsonsIndex(germ.counts = x, intervals = int,
                                         total.seeds = 50,
                                         modification = "labouriau"),
                   expected = TimsonsIndex(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50,
                                           modification = "labouriau"))
  expect_identical(object = TimsonsIndex(germ.counts = x, intervals = int,
                                         total.seeds = 50,
                                         modification = "khanungar"),
                   expected = TimsonsIndex(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50,
                                           modification = "khanungar"))

  expect_identical(object = TimsonsIndex(germ.counts = x, intervals = int,
                                         total.seeds = 50, max = 10),
                   expected = TimsonsIndex(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50,
                                           max = 10))
  expect_identical(object = TimsonsIndex(germ.counts = x, intervals = int,
                                         total.seeds = 50, max = 10,
                                         modification = "none"),
                   expected = TimsonsIndex(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50,
                                           max = 10, modification = "none"))
  expect_identical(object = TimsonsIndex(germ.counts = x, intervals = int,
                                         total.seeds = 50, max = 10,
                                         modification = "labouriau"),
                   expected = TimsonsIndex(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50,
                                           max = 10, modification = "labouriau"))
  expect_identical(object = TimsonsIndex(germ.counts = x, intervals = int,
                                         total.seeds = 50, max = 10,
                                         modification = "khanungar"),
                   expected = TimsonsIndex(germ.counts = y, intervals = int,
                                           partial = FALSE, total.seeds = 50,
                                           max = 10, modification = "khanungar"))

  expect_identical(object = GermRateGeorge(germ.counts = x, intervals = int),
                   expected = GermRateGeorge(germ.counts = y, intervals = int,
                                             partial = FALSE))

  expect_identical(object = GermRateGeorge(germ.counts = x, intervals = int,
                                           max = 10),
                   expected = GermRateGeorge(germ.counts = y, intervals = int,
                                             partial = FALSE, max = 10))
  expect_identical(object = GermRateGeorge(germ.counts = x, intervals = int,
                                           max = 14),
                   expected = GermRateGeorge(germ.counts = y, intervals = int,
                                             partial = FALSE, max = 14))
})
