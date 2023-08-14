x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("CUGerm works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = CUGerm(germ.counts = x, intervals = int),
               expected = 0.709219858156028, tolerance = 1e+12)
})

test_that("CUGerm works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = CUGerm(germ.counts = y, intervals = int,
                               partial = FALSE),
               expected = 0.709219858156028, tolerance = 1e+12)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = CUGerm(germ.counts = x, intervals = int),
                   expected = CUGerm(germ.counts = y, intervals = int,
                                     partial = FALSE))
})
