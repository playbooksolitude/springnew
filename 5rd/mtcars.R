library(tidyverse)
#install.packages("devtools")
library(devtools)
devtools::install_github("ricardo-bion/ggradar", 
                         dependencies = TRUE, 
                         force = T)

library(ggradar)

#
mtcars |> 
  as_tibble(rownames = "cars") |> 
  arrange(mpg) |> 
  mutate_at(vars(-cars), scales::rescale)
  tail(5) |> 
  select(cars, mpg, disp, hp, wt, qsec) -> temp1

ggradar(temp1)
mtcars |> as_tibble(rownames = "cars")
mtcars %>% 
  as_tibble(rownames = "group") %>% 
  mutate_at(vars(-group), rescale) %>% 
  tail(4) %>% 
  select(1:10) %>% 
  ggradar(font.radar = "Circular Air")

?scales::rescale()

mtcars %>% 
  as_tibble(rownames = "group") %>% 
  mutate_at(vars(-group), rescale) %>% 
  tail(4) %>% 
  select(1:10) %>% 
  ggradar(font.radar = "Circular Air")



msleep
dput(mtcars)

smiths$time <- NULL
smiths
dput(smiths) -> temp1
smiths <- temp1
data("smiths")
smiths
