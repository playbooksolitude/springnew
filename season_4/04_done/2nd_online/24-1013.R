#24-1013 sun 20:19

library(palmerpenguins)
library(tidyverse)
palmerpenguins::penguins

# str() ----
penguins |> str()
penguins |> glimpse()

# head() ----
penguins |> head() #(ctrl + shitf + m)

#
penguins |> tail()

# plot ----
ggplot(data = penguins |> 
    drop_na(species, sex, island), 
  mapping = aes(x = bill_length_mm,
    y = bill_depth_mm, 
    color = species)) +
  geom_point() + 
  geom_smooth(method = 'lm', se = F) -> p_1

p_1
# fcet_wrap ----
penguins |> glimpse()
p_1 +
  facet_wrap(.~island) -> p_2

p_2

# plot3 ----
p_1 +
  facet_grid(sex~island) +
  theme(legend.position = 'top')
  #theme(legend.position = 'bottom')
  #theme(legend.position = 'left')
  #theme(legend.position = 'right')

#
penguins |> head()

penguins |> 
  ggplot(aes(x = flipper_length_mm, 
    fill = species)) +
  geom_histogram(position = 'identity',
    alpha = .8) +
  theme_minimal() +
  labs(title = 'penguins flipper length', subtitle = 'histogram')


#
penguins
body_mass_g
penguins |> 
  #drop_na(species, body_mass_g, sex) |> 
  ggplot(aes(x = body_mass_g, 
    fill = species)) +
  geom_histogram(position = 'identity',
    alpha = .8) +
  theme_minimal() +
  labs(title = 'penguins flipper length', subtitle = 'histogram') +
  facet_wrap(.~sex)




