x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("MeanGermTime works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = MeanGermTime(germ.counts = x, intervals = int),
               expected = 6.7, tolerance = 1e-12)
})

test_that("MeanGermTime works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = MeanGermTime(germ.counts = y, intervals = int,
                                     partial = FALSE),
               expected = 6.7, tolerance = 1e-12)
})

test_that("VarGermTime works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = VarGermTime(germ.counts = x, intervals = int),
               expected = 1.44615384615385, tolerance = 1e-12)
})

test_that("VarGermTime works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = VarGermTime(germ.counts = y, intervals = int,
                                     partial = FALSE),
               expected = 1.44615384615385, tolerance = 1e-12)
})

test_that("SEGermTime works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = SEGermTime(germ.counts = x, intervals = int),
               expected = 0.239478102514824, tolerance = 1e-12)
})

test_that("SEGermTime works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = SEGermTime(germ.counts = y, intervals = int,
                                    partial = FALSE),
               expected = 0.239478102514824, tolerance = 1e-12)
})

test_that("CVGermTime works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = CVGermTime(germ.counts = x, intervals = int),
               expected = 0.179486771488981, tolerance = 1e-12)
})

test_that("CVGermTime works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = CVGermTime(germ.counts = y, intervals = int,
                                   partial = FALSE),
               expected = 0.179486771488981, tolerance = 1e-12)
})

