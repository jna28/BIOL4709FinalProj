#'@title Mean+SD Matrix
#'@description This function is designed to create a matrix of means and standard deviations of a column of the user's choosing. it compares the means between different fertilization and genetic diversity levels.
#'@param data Data Frame, the data frame you want to alter or analyze
#'@param fert Character, the name of the column that tells whether plots are fertilized or not (values in the column should be "F" and "C")
#'@param gdLev Character, the name of the column that tells the genetic diversity level of the plots
#'@param column Character, the name of the column with values you want to analyze in a matrix
#'@export

matrix_mean_sd<- function(data, fert, gdLev, column){
  
  aggregate<-aggregate(data[[column]],
                       list(fert=data[[fert]],
                            gdLev=data[[gdLev]]),
                       FUN= function(x) c(mean=mean(x), sd=sd(x)))
  matrix<-as.matrix(
    reshape(aggregate, idvar="fert", timevar="gdLev", direction = "wide"))
  
  return(matrix)
}