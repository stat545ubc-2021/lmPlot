testthat::test_that("Graph can be generated successfully", {
  p <- plot_lm(mtcars, cyl, mpg, na.rm = T)
  expect_s3_class(p, "ggplot")
  expect_identical(p$labels$x, "cyl")
  expect_identical(p$labels$y, "mpg")
})

## Expect different results when specifying whether to remove `NA` values
testthat::test_that("Graph is different when NA values are removed", {
  p1 <- plot_lm(gapminder, year, lifeExp, na.rm = T)
  p2 <- plot_lm(gapminder, year, lifeExp, na.rm = F)
  expect_false(identical(p1, p2))
})

## Incorrect column types throw an error
testthat::test_that("Non-numeric values for x axis", {
  expect_error(plot_lm(gapminder, continent, lifeExp)) # x is factor type
  expect_error(plot_lm(gapminder, lifeExp, continent)) # y is factor type
  expect_error(plot_lm(gapminder, continent, country)) # both factor types
})

## Incorrect label name of the data columns
testthat::test_that("Columns are selected incorrectly",{
  expect_error(plot_lm(gapminder, yeer, lifeExp)) # x is wrongly spelled
  expect_error(plot_lm(gapminder, year, lifeAxp)) # y is wrongly spelled
})
