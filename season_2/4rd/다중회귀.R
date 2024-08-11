#24-0801 thu 08:30

#
library(tidyverse)

#
 
lm(mpg ~ cyl + disp + hp +drat + wt, 
   data = mtcars |> 
     as_tibble(rownames = "cars")) |> 
  summary()

lm(mpg ~ wt + cyl + hp, data = mtcars) |> 
  summary()

mtcars |> head()
mpg
lm(hwy ~ displ + cyl + cty, data = mpg) |> 
  summary() -> temp1
temp1$r.squared
temp1 |> head()
temp1$terms


glm(hwy ~ trans + drv + class, data = mpg, family = gaussian) |> 
  summary()
mpg
?glm


