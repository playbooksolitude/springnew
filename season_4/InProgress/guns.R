#24-0925 

#
source("~/Documents/springnew/season_4/Done/p_load.R", echo = T)


# library(tidyverse)
# library(AER)
# library(GGally)
data("Guns")

#
Guns
?ggpairs
Guns |> head()
Guns |> str()
pairs(Guns)
ggpairs(Guns, c("violent", "murder", "robbery",
                "prisoners", "income", "population"))

pm <- ggpairs(flea, columns = 2:4, ggplot2::aes(colour = species))

Guns |> head()
ggpairs(data = Guns, 
        columns = c("violent", "murder", "robbery",
                    "prisoners", "income", "population"), 
        mapping = aes(color = law))

#
Guns |> str()
Guns |> head()

#
Guns |> 
  ggplot(aes(x = murder, y = violent, color = law)) + 
  geom_point() +
  facet_grid(year~.)

#exam
example("ggpairs")
ggpairs(Guns, c("violent", "murder", "robbery",
                "prisoners", "income", "population"))

mtcars |> pairs()
mtcars[,1:6] |> pairs(panel = panel.smooth)
ggpairs(mtcars, c('mpg', 'cyl', 'disp', 'hp'))

#
mpg
ggpairs(data = mpg,
        columns = c('displ', 'cyl', 'cty', 'hwy'), 
        aes(color = drv))

mpg |> 
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point()

