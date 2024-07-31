#24-0731 ggradar

# devtools ----
## install_github ----
### bbplot ----
#install.packages("devtools")
#library(devtools)
#install_github('bbc/bbplot', dependencies = )
devtools::install_github("ricardo-bion/ggradar", 
                         dependencies = TRUE, force = T)
#
library(ggradar)
example("ggradar")
?ggradar

library(ggradar)
library(dplyr)
library(scales)
library(tibble)

(mtcars_radar <- mtcars %>% 
    as_tibble(rownames = "group") %>% 
    mutate_at(vars(-group), rescale) %>% 
    tail(4) %>% 
    select(1:10))

ggradar(mtcars_radar)
mtcars |> tail(4)

mpg |> 
  #count(drv)
  count(manufacturer, class)

mpg |> 
  group_by(manufacturer, class) |> 
  reframe()
  #count(manufacturer) |> 
  arrange(desc(cty),desc(hwy)) #|> 
  head()

(mpg |> 
  group_by(manufacturer) |> 
  reframe(mean_cty = mean(cty), mean_hwy = mean(hwy),
    n = n()) |> 
  filter(n > 10) |> 
  arrange(desc(n)) -> temp1)

ggradar(temp1)


mpg |> 
  arrange(hwy) |> 
  tail(3)

mtcars
mpg |> 
  group_by(manufacturer, model, trans) |> 
  reframe(mean_cty = mean(cty), mean_hwy = mean(hwy))

mpg |> 
  filter(drv == '4') |> 
  count(manufacturer)

mtcars |> tail(4)
mtcars |> 
  as_tibble(rownames = "cars") |> 
  mutate_at(vars(-cars), rescale) |> 
  tail(4)


msleep$name |> 
  #data.frame() |> 
  as_tibble(rownames = "name") |> slice(61:83) |> print(n = Inf)



ssh-keygen -t rsa -b 4096 -C "slatopr@gmail.com"
