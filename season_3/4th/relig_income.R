#24-0731 wedn

#
library(tidyverse)
library(treemapify)
library(nord)


smiths |> 
  pivot_longer(cols = c(time:height), names_to = "type", values_to = "value")

#
relig_income
relig_income |> 
  pivot_longer(cols = c(2:11), names_to = 'type', values_to = 'value') |> 
  ggplot(aes(x = religion, y = type, fill = value)) +
  geom_tile() +
  geom_text(aes(label = value), color = "white" ) +
  coord_flip()

#
relig_income |> 
  pivot_longer(cols = c(2:11), 
               names_to = 'type', values_to = 'value') -> relig_1pivot

relig_1pivot
relig_1pivot |> 
  ggplot(aes(area = value, fill = religion, 
             label = type, 
             subgroup = religion, 
             subgroup2 = religion)) +
  geom_treemap() +
  geom_treemap_text() +
  geom_treemap_subgroup_border() +
  geom_treemap_subgroup2_text(alpha = .7, place = "center") +
  scale_fill_nord(palette = "aurora", discrete = T)


#
?USAccDeaths
?USArrests
USArrests |> 
  as_tibble(rownames = 'USA') |> 
  pivot_longer(cols = c(Murder:Rape), names_to = 'type', 
               values_to = 'value') |> 
  ggplot(aes(x = USA |> fct_reorder(desc(USA)), 
             y = value, 
             fill = type)) + 
  geom_bar(stat = 'identity') +
  coord_flip() +
  facet_wrap(.~type, scales = "free")


pairs(USArrests, panel = panel.smooth, main = "USArrests data")
