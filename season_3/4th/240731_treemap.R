# devtools ----
## install_github ----
### bbplot ----
#install.packages("devtools")
#library(devtools)
#install_github('bbc/bbplot', dependencies = )
devtools::install_github("ricardo-bion/ggradar", 
                         dependencies = TRUE, force = T)
#install.packages("treemapify")
library(treemapify)
library(gapminder)
library(showtext)
showtext_auto()

gapminder
gapminder |> 
  filter(year == "2007", continent == "Asia") |> 
  arrange(desc(lifeExp)) |> print(n = 33)
gapminder |>
  #count(year)
  filter(year == "2007") |> 
  ggplot(aes(area = pop, fill = lifeExp, 
             subgroup = continent, 
             label = country, 
             subgroup2 = round(lifeExp,1))) +
  geom_treemap() +
  geom_treemap_text(color = "blue") +
  geom_treemap_subgroup_text(place = 'center', 
                             alpha = .5, size = 40) +
  geom_treemap_subgroup_border(color = "#252525", alpha = .1) +
  geom_treemap_subgroup2_text(size = 14, place = "bottom") +
  #scale_fill_viridis(discrete = "F", option = "viridis") +
  scale_fill_nord('aurora', discrete = F) +
  #scale_fill_nord('snowstorm', discrete = F) +
  ggtitle(label = "2007년 142개국", subtitle = "넓이 = 인구, 농도 = 기대수명") +
  theme(legend.position = "right")

# option='viridis'
# option='magma'
# option='plasma'
# option='inferno'
# option='cividis'

#install.packages("viridis")
library(viridis)
install.packages("nord")
library(nord)
nord::nord_palettes
#https://cran.r-project.org/web/packages/nord/readme/README.html