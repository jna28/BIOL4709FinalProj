#'@title Separate and Compare
#'@description This function is designed to run anova tests to analyze if there is a difference in a variable between genetic diversity levels. This function returns the anova results for all plots, then separates them by fertilization level.
#'@param data Data Frame, the data frame you want to alter or analyze 
#'@param fert Character, the name of the column that tells whether plots are fertilized or not (values in the column should be "F" and "C")
#'@param column1 Character, the name of the column with numeric values that you want to analyze in an anova test
#'@param column2 Character, the name of the column with factor values (2+ levels) you want to analyze in an anova test
#'@export

sep_and_compare<-function(data, fert, column1, column2){
  
  data[[column2]]<-as.factor(data[[column2]])
  
  split_data<- split(data, data[[fert]])
  fertdata<- split_data$F
  ctrldata<-split_data$C
  
  anova<-aov(data[[column1]]~data[[column2]])
  summary<-summary(anova)
  
  fertanova<- aov(fertdata[[column1]]~fertdata[[column2]])
  summary_fert<-summary(fertanova)
  
  ctrlanova<-aov(ctrldata[[column1]]~ctrldata[[column2]])
  summary_ctrl<-summary(ctrlanova)
  return(c(summary, summary_fert, summary_ctrl))
  
}
