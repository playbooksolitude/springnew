#24-0731 ggradar


# devtools ----
## install_github ----
#install.packages("devtools")
#library(devtools)
#install_github('bbc/bbplot', dependencies = T)
# devtools::install_github("ricardo-bion/ggradar", 
#                          dependencies = TRUE, force = T)

#
library(ggradar)
library(ggradar)
library(dplyr)
library(scales)
library(tibble)

#
mpg
mtcars |> 
  rownames_to_column('cars')

mtcars |> 
  as_tibble(rownames = 'cars')

(mtcars_radar <- mtcars %>% 
    as_tibble(rownames = "cars") %>% 
    mutate_at(vars(-cars), rescale) %>% 
    tail(2) %>% 
    select(1:10))

ggradar(mtcars_radar)

