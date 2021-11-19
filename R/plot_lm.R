#' A Linear Models Visualization Function
#'
#' Select two columns from a data frame: two numeric columns for
#' fitting linear models and visualization.
#' You can also decide whether to remove N/A values from geom_point,
#' as well as choosing the color and size of axis titles.
#' The function must have numeric x and y arguments and will stop
#' if given other data types.
#'
#' @param data Tibble or data frame that you want to select from.
#'
#' @param x Numeric column name. This will be the `x` variable being
#' used for the model and the graph.
#'
#' @param y Numeric column name. This will be the `y` variable being
#' used for the model and the graph.
#'
#' @param na.rm Logical value to decide whether or not to
#' remove `NA` values when graphing.
#' This is named consistently with `ggplots` functions.
#' If `FALSE`, missing values are removed with a warning.
#' If `TRUE`, the default, missing values are silently removed.
#'
#' @return The model graph as an class of `ggplot` object.
#' This plot is determined by the selected numeric columns of the data.
#' Throws an error if `x` and `y` are not the numeric type.
#'
#' @examples
#' ## Analysis of the motor trend car road test data
#' ## Plot the linear model of number of cylinders and Miles/(US) gallon
#' plot_lm(mtcars, cyl, mpg, na.rm = T)
#'
#' @export

plot_lm <- function (data, x, y, na.rm = TRUE) {
  calculations <- dplyr::summarise(
    data,
    is_numeric_x = is.numeric({{ x }}),
    class_x = class({{ x }}),
    is_numeric_y = is.numeric({{ y }}),
    class_y = class({{ y }})
  )

  if (!calculations$is_numeric_x) {
    stop("The `x` column must be numeric, but is of class ",
         calculations$class_x)
  }

  if (!calculations$is_numeric_y) {
    stop("The `y` column must be numeric, but is of class ",
         calculations$class_y)
  }

  graph <- ggplot2::ggplot(data, ggplot2::aes({{ x }}, {{ y }}), na.rm = na.rm) +
    ggplot2::geom_point() +
    ggplot2::geom_smooth(method = "lm")

  return (graph)
}
