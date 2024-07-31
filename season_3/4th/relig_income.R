#

smiths

smiths |> 
  pivot_longer(cols = c(time:height), names_to = "type", values_to = "value")



relig_income |> 
  ggplot(aes(x = religion, y = `$10-20k`, fill = `$10-20k`)) +
  geom_tile()

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
  
