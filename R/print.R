#' Print Generic for Break Down Objects
#'
#' @param x the model model of `break_down` class
#' @param ... other parameters
#' @param digits number of decimal places (round) or significant digits (signif) to be used.
#' See the \code{rounding_function} argument
#' @param rounding_function function that is to used for rounding numbers.
#' It may be \code{signif()} which keeps a specified number of significant digits.
#' Or the default \code{round()} to have the same precision for all components
#'
#' @return a data frame
#'
#' @export
print.break_down <- function(x, ..., digits = 3, rounding_function = round) {
  broken_cumm <- x
  class(broken_cumm) = "data.frame"
  broken_cumm$contribution <- rounding_function(broken_cumm$contribution, digits)
  rownames(broken_cumm) <- paste0(broken_cumm$label, ": ", broken_cumm$variable)
  print(broken_cumm[, "contribution", drop = FALSE])
  cat("baseline: ", attr(broken_cumm, "baseline"), "\n")
}
