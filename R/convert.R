#' Simple Converter Function
#' 
#' A function that converts stuff. 
#' 
#' @param df data.frame that contains cols to be modified
#' @param col position of the column, either name or integer
#' @param multi numeric multiplier
#' @examples 
convert_metric <- function(df,col,
                           multi){
  new_name <- sprintf("%s_converted",col)
  df[,new_name] <- df[,col] * multi
  df
}






load("data/mlb.RData")

mlb_neu <- convert_metric(mlb,"height",2.54)

e <- new.env()

e$mlb_neu <- mlb_neu
e$check <- check_ds

save("mlb_neu","check_ds",file="test.RData",FALSE)
