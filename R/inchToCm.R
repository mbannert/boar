inchToCm <- function(size_in_inch,
                     meters = T,
                     digits=2){
  out <- size_in_inch * 2.54
  if(meters) out <- round(out/100,digits=2)
  out
}
