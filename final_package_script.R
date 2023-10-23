setwd("/Users/jennaantonacci/Desktop/BIOL4709Final")
library(devtools)
library(roxygen2)

decomp_data<- read.csv("data.decomp.csv")

View(decomp_data)
clean_decomp_data<-decomp_data[complete.cases(decomp_data$gd_mean.y), ]
View(clean_decomp_data)

biomass_data<- read.csv("data.biomass.csv")
View(biomass_data)
clean_biomass_data<-biomass_data[complete.cases(biomass_data$Dry.Weight), ]
View(clean_biomass_data)

source("decomp_k_function.R")
source("matrix_mean_sd_function.R")
source("sep_and_compare_function.R")

#example of function 1: decomp_k
k_30<-decomp_k(clean_decomp_data, 4.000, "Litter.Bag.f30", 30)
View(k_30)

#example of function 2: matrix_mean_sd
matrix_decomp<-matrix_mean_sd(clean_decomp_data, "Fertilized.Control", "Genetic.Diversity.Level", "X..remaining30")
matrix_decomp

#example of function 3: sep_and_compare
sep_and_compare(clean_decomp_data, "Fertilized.Control", "X..remaining30", "Genetic.Diversity.Level")

#create package
create("Biol4709FinalPackage",
       rstudio=TRUE,
       roxygen=TRUE,
       open=FALSE)

setwd("Biol4709FinalPackage")

document()

setwd("..")
install("Biol4709FinalPackage")
library("Biol4709FinalPackage")

setwd("BIOL4709FinalPackage")
use_data(clean_decomp_data)
use_data(clean_biomass_data)

setwd("..")
use_vignette("Biol4709FinalPackage_Vignette")
install("Biol4709FinalPackage", build_vignettes=TRUE)