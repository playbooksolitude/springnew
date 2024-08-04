library(tidyverse)
#install.packages("devtools")
library(devtools)
library(ggradar)
library(scales)
#devtools::install_github("ricardo-bion/ggradar", 
#                         dependencies = TRUE, 
#                         force = T)

mtcars$cyl |> table()

# basic not good
mtcars |> 
  as_tibble(rownames = 'cars') |> 
  tail(5) |> 
  ggradar()

# use to scales::rescale 
## mutate_at
mtcars |> 
  as_tibble(rownames = "cars") |> 
  mutate_at(vars(-cars), scales::rescale) |> 
  tail(5) |> 
  ggradar(font.radar = 'mtcars')

ggradar(temp1)

#
mtcars |> as_tibble(rownames = "cars")

#
mtcars %>% 
  as_tibble(rownames = "group") %>% 
  mutate_at(vars(-group), rescale) %>% 
  tail(4) %>% 
  #select(1:10) %>% 
  ggradar(font.radar = "Circular Air")

?scales::rescale()

mtcars %>% 
  as_tibble(rownames = "group") %>% 
  mutate_at(vars(-group), rescale) %>% 
  tail(4) %>% 
  select(1:10) %>% 
  ggradar(font.radar = "Circular Air")



msleep

smiths
smiths$time <- NULL

data("smiths")
smiths
