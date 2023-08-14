x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("MeanGermRate works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = MeanGermRate(germ.counts = x, intervals = int),
               expected = 0.149253731343284, tolerance = 1e-12)
})

test_that("MeanGermRate works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = MeanGermRate(germ.counts = y, intervals = int,
                                     partial = FALSE),
               expected = 0.149253731343284, tolerance = 1e-12)
})

test_that("CVG works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = CVG(germ.counts = x, intervals = int),
               expected = 14.9253731343284, tolerance = 1e-12)
})

test_that("CVG works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = CVG(germ.counts = y, intervals = int,
                            partial = FALSE),
               expected = 14.9253731343284, tolerance = 1e-12)
})

test_that("VarGermRate works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = VarGermRate(germ.counts = x, intervals = int),
               expected = 0.000717654291368627, tolerance = 1e-12)
})

test_that("VarGermRate works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = VarGermRate(germ.counts = y, intervals = int,
                                   partial = FALSE),
               expected = 0.000717654291368627, tolerance = 1e-12)
})

test_that("SEGermRate works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = SEGermRate(germ.counts = x, intervals = int),
               expected = 0.00423572393862202, tolerance = 1e-12)
})

test_that("SEGermRate works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = SEGermRate(germ.counts = y, intervals = int,
                                   partial = FALSE),
               expected = 0.00423572393862202, tolerance = 1e-12)
})

test_that("GermRateRecip works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = GermRateRecip(germ.counts = x, intervals = int,
                                      method = "coolbear"),
               expected = 0.167487684729064, tolerance = 1e-12)
  expect_equal(object = GermRateRecip(germ.counts = x, intervals = int,
                                      method = "farooq"),
               expected = 0.168316831683168, tolerance = 1e-12)
})

test_that("GermRateRecip works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = GermRateRecip(germ.counts = y, intervals = int,
                                      method = "coolbear", partial = FALSE),
               expected = 0.167487684729064, tolerance = 1e-12)
  expect_equal(object = GermRateRecip(germ.counts = y, intervals = int,
                                      method = "farooq", partial = FALSE),
               expected = 0.168316831683168, tolerance = 1e-12)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = MeanGermRate(germ.counts = x, intervals = int),
                   expected = MeanGermRate(germ.counts = y, intervals = int,
                                           partial = FALSE))
  expect_identical(object = CVG(germ.counts = x, intervals = int),
                   expected = CVG(germ.counts = y, intervals = int,
                                  partial = FALSE))
  expect_identical(object = VarGermRate(germ.counts = x, intervals = int),
                   expected = VarGermRate(germ.counts = y, intervals = int,
                                          partial = FALSE))
  expect_identical(object = SEGermRate(germ.counts = x, intervals = int),
                   expected = SEGermRate(germ.counts = y, intervals = int,
                                         partial = FALSE))
  expect_identical(object = GermRateRecip(germ.counts = x, intervals = int,
                                          method = "coolbear"),
                   expected = GermRateRecip(germ.counts = y, intervals = int,
                                            method = "coolbear",
                                            partial = FALSE))
  expect_identical(object = GermRateRecip(germ.counts = x, intervals = int,
                                          method = "farooq"),
                   expected = GermRateRecip(germ.counts = y, intervals = int,
                                            method = "farooq",
                                            partial = FALSE))
})
