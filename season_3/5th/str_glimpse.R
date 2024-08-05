#24-0805 mon 21:03

#str vs glimpse

#
library(tidyverse)

#
starwars |> 
  is.na() |> 
  colSums()

starwars |> 
  #str()
  glimpse()


#
diamonds