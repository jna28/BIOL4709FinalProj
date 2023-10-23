#'@title Decomposition K
#'@description This function is designed to handle litter bag data from fertilized and non-fertilized plots. It calculates k values from inital and final masses of litter bags.
#'@param data Data Frame, the data frame you want to alter or analyze
#'@param initial Numeric, the initial mass of the plots analyzed (grams)
#'@param final Character, the name of the column with final litter bag mass values after a certain amount of time
#'@param time Numeric, the number of days the litter bags decomposed
#'@export

decomp_k<- function(data, initial, final, time){
  pct.remain<- data[[final]]/initial
  time<- time/365
  k<- -log(pct.remain)/time
  
  df<- data.frame(data["Plot"], data["Genetic.Diversity.Level"], data["Fertilized.Control"], initial, data[[final]], time, pct.remain, k)
  return(df)
}
