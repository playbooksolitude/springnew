#24-0804 sun 14:14
#geom_point_aes

#
library(tidyverse)
library(ggradar)

#geom_point() aes() ----
mpg |> 
  ggplot(aes(x = hwy)) +
  geom_point(aes(y = cty))


mpg |> 
  mutate_at(vars(displ, cyl, cty, hwy), scales::rescale) |> 
  ggplot(aes(x = hwy, y = cty)) +
  geom_point(aes(color = drv)) +
  facet_wrap(.~class)


#x = cty, y = hwy, geom_point(), cyl (실린더크기)
mpg
mpg |> 
  ggplot(aes(x = cty, y = hwy)) +
  geom_point()

#
mpg |> 
  ggplot(aes(x = cty)) +
  geom_point(aes(y = hwy), color = "red") +
  geom_point(aes(y = cyl), color = "blue") +
  geom_point(aes(y = displ), color = "brown") +
  facet_grid(trans~class)

#
mpg |> 
  ggplot() +
  geom_point(aes(x = displ, y = cty), color = "grey") +
  geom_point(data = mpg |> 
               filter(drv %in% c('4')), 
             aes(x = displ, y = cty), color = "red") +
  facet_wrap(.~cyl, scales = "free") +
  bbc_style()
