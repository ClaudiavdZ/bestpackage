#' Normalizer
#' 
#' Normalise data
#'
#' @param x 
#'
#' @return
#' @export
#'
#' @examples 
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}