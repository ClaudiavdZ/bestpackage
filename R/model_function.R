#' Model function
#'
#' Build a model 
#'
#' @param learning_rate 
#' @param dropoutrate 
#' @param n_dense 
#'
#' @return a model
#' @export 
#'
#' @examples
#' 
model_function <- function(learning_rate = 0.001, 
                           dropoutrate=0.2, n_dense=1024){
  
  k_clear_session()
  #build model, append layers to exception model
  model <- keras_model_sequential() %>%
    mod_base %>% 
    layer_global_average_pooling_2d() %>% 
    layer_dense(units = n_dense) %>%
    layer_activation("relu") %>%
    layer_dropout(dropoutrate) %>%
    layer_dense(units=1, activation="sigmoid")
  #compile model
  #use binary_crossentropy loss
  #use adem optimizer https://arxiv.org/abs/1412.6980
  #keep track of accuracy metric
  model %>% compile(
    loss = "binary_crossentropy",
    optimizer = optimizer_adam(lr = learning_rate),
    metrics = "accuracy"
  )
  
  return(model)
  
}