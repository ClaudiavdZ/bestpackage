#' flu_plot
#'
#'makes a line graph of flu data
#'
#' @param dataframe 
#' @param land 
#'
#' @return
#' @export
#'
#' @examples
#' flu_plot(alltogether,"Netherlands")
flu_plot <- function(dataframe, land){
  dataframe %>% filter(country == land) %>% 
    ggplot(aes(x = year, y = flu)) +
    geom_line() +
    geom_point() 
}

