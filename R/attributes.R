attributes <- function(x){
  result_name <- attributes[str_detect(string = attributes$name,
                                       pattern = stringr::str_c(".*",x,".*")),]
  result_description <- attributes[str_detect(string = attributes$description,
                                              pattern = stringr::str_c(".*",x,".*")),]
  result_page <- attributes[str_detect(string = attributes$page,
                                       pattern = stringr::str_c(".*",x,".*")),]
  result_tibble <- bind_rows(result_name , result_description, result_page)
  distinct(result_tibble, .keep_all = FALSE)}
