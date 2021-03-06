% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_lm.R
\name{plot_lm}
\alias{plot_lm}
\title{A Linear Models Visualization Function}
\usage{
plot_lm(data, x, y, na.rm = TRUE)
}
\arguments{
\item{data}{Tibble or data frame that you want to select from.}

\item{x}{Numeric column name. This will be the \code{x} variable being
used for the model and the graph.}

\item{y}{Numeric column name. This will be the \code{y} variable being
used for the model and the graph.}

\item{na.rm}{Logical value to decide whether or not to
remove \code{NA} values when graphing.
This is named consistently with \code{ggplots} functions.
If \code{FALSE}, missing values are removed with a warning.
If \code{TRUE}, the default, missing values are silently removed.}
}
\value{
The model graph as an class of \code{ggplot} object.
This plot is determined by the selected numeric columns of the data.
Throws an error if \code{x} and \code{y} are not the numeric type.
}
\description{
Select two columns from a data frame: two numeric columns for
fitting linear models and visualization.
You can also decide whether to remove N/A values from geom_point,
as well as choosing the color and size of axis titles.
The function must have numeric x and y arguments and will stop
if given other data types.
}
\examples{
## Analysis of the motor trend car road test data
## Plot the linear model of number of cylinders and Miles/(US) gallon
plot_lm(mtcars, cyl, mpg, na.rm = T)

}
