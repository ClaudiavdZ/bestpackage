#' Find attributes
#'
#' find attributes in dataset, in the biomart database given a search string
#'
#' @param x string
#'
#' @return string
#' @export
#'
#' @examples
#' attributes("pfam")


attributes <- function(x){
  attributes <- listAttributes(h_sapiens) %>% as_tibble()
  result_name <- attributes[str_detect(string = attributes$name,
                                       pattern = stringr::str_c(".*",x,".*")),]
  result_description <- attributes[str_detect(string = attributes$description,
                                              pattern = stringr::str_c(".*",x,".*")),]
  result_page <- attributes[str_detect(string = attributes$page,
                                       pattern = stringr::str_c(".*",x,".*")),]
  result_tibble <- bind_rows(result_name , result_description, result_page)
  distinct(result_tibble, .keep_all = FALSE)}
