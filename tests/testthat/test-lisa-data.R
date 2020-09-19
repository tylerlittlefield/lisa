context("test-lisa-data")

test_that("lisa data", {

  # confirm that lisa is a list and artwork is a data.frame
  expect_true(class(lisa) == "list")
  expect_true(all(class(artwork) %in% c("data.frame", "tbl_df", "tbl")))

})
