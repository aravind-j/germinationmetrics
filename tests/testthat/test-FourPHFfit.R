Sys.setenv(R_TESTS="")

x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)
total.seeds = 50

cols1 <- c("a", "b", "c", "y0", "lag", "Dlag50",
           "t50.total", "t50.Germinated",
           "TMGR", "AUC", "MGT", "Skewness")

fit_partial_fixa_fixy0 <-  FourPHFfit(germ.counts = x, intervals = int,
                                      total.seeds = 50,
                                      tmax = 20)
fit_cumulative_fixa_fixy0 <-  FourPHFfit(germ.counts = y, intervals = int,
                                         total.seeds = 50, tmax = 20,
                                         partial = FALSE)

test_that("FourPHFfit works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = fit_partial_fixa_fixy0[cols1],
               expected = list(a = 80, b = 9.88193689219798,
                               c = 6.03495355423453,
                               y0 = 0, lag = 0, Dlag50 = 6.03495355423453,
                               t50.total = 6.3551214973865,
                               t50.Germinated = 6.03495355423453,
                               TMGR = 5.91219440464896,
                               AUC = 1108.97550938733,
                               MGT = 6.63225196627282,
                               Skewness = 1.09897315806502),
               tolerance = 1e-6)
  expect_equal(object = fit_partial_fixa_fixy0[["txp.total"]],
               expected = c(`10` = 4.95626430994715, `60` = 6.7445983463311),
               tolerance = 1e-6)
  expect_equal(object = fit_partial_fixa_fixy0[["txp.Germinated"]],
               expected = c(`10` = 4.83180737938015, `60` = 6.28772357367537),
               tolerance = 1e-6)
  expect_equal(object = fit_partial_fixa_fixy0[["Uniformity"]],
               expected = c(`90` = 7.53768963497883, `10` = 4.83180737938015,
                            uniformity = 2.70588225559868 ),
               tolerance = 1e-6)
})

test_that("FourPHFfit works; Partial germination counts", {

  # From cumulative germination counts
  expect_equal(object = fit_cumulative_fixa_fixy0[cols1],
               expected = list(a = 80, b = 9.88193689219798,
                               c = 6.03495355423453,
                               y0 = 0, lag = 0, Dlag50 = 6.03495355423453,
                               t50.total = 6.3551214973865,
                               t50.Germinated = 6.03495355423453,
                               TMGR = 5.91219440464896,
                               AUC = 1108.97550938733,
                               MGT = 6.63225196627282,
                               Skewness = 1.09897315806502),
               tolerance = 1e-6)
  expect_equal(object = fit_cumulative_fixa_fixy0[["txp.total"]],
               expected = c(`10` = 4.95626430994715, `60` = 6.7445983463311),
               tolerance = 1e-6)
  expect_equal(object = fit_cumulative_fixa_fixy0[["txp.Germinated"]],
               expected = c(`10` = 4.83180737938015, `60` = 6.28772357367537),
               tolerance = 1e-6)
  expect_equal(object = fit_cumulative_fixa_fixy0[["Uniformity"]],
               expected = c(`90` = 7.53768963497883, `10` = 4.83180737938015,
                            uniformity = 2.70588225559868 ),
               tolerance = 1e-6)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = fit_partial_fixa_fixy0[cols1],
                   expected = fit_cumulative_fixa_fixy0[cols1])
  expect_identical(object = fit_partial_fixa_fixy0[["txp.total"]],
                   expected = fit_cumulative_fixa_fixy0[["txp.total"]])
  expect_identical(object = fit_partial_fixa_fixy0[["txp.Germinated"]],
                   expected = fit_cumulative_fixa_fixy0[["txp.Germinated"]])
  expect_identical(object = fit_partial_fixa_fixy0[["Uniformity"]],
                   expected = fit_cumulative_fixa_fixy0[["Uniformity"]])
})
