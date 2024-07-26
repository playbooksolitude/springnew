#24-0708 mon 23:14

#
#install.packages("gt") # gt 라이브러리
library(gt)

#
library(ggplot2)
library(dplyr)
library(tidyverse)

#
mpg |> 
  count(manufacturer, model, drv)

# gt table
mpg |> 
  count(manufacturer, model, drv) |> 
  gt(caption = "mpg dataset gt")


#
mpg |> 
  count(manufacturer, model, drv) |> gt()
  pivot_wider(names_from = drv, 
              values_from = n) |> 
  gt()

#
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df


mpg
library(tidyverse)

mpg |> 
  ggplot(aes(x = 
               manufacturer, y = cty)) +
  geom_point()

#
