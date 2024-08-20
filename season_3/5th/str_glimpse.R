#24-0805 mon 21:03

#str vs glimpse

#
library(tidyverse)

#str
starwars |> 
  str()
  
# glimpse()  
starwars |> 
  glimpse()


#Titanic
Titanic

#Titanic |> str()
Titanic |> 
  str()

#Titanic glimpse()
Titanic |> 
  glimpse()

#
Titanic |> 
  as_tibble()

Titanic |> 
  as.data.frame()


#
starwars |> 
  is.na() |> 
  colSums()

#
diamonds