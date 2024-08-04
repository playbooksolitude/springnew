#24-0731 wedn 14:50

#
library(tidyverse)
diamonds
diamonds |> str()

babynames |> str()
babynames |> glimpse()
babynames$name |> as.factor() -> babynames$name
babynames |> str()


mpg |> 
  filter(drv == '4')


#
mpg |> 
  ggplot(aes(x = class, fill = drv)) +
  geom_bar(colour = "white", position = "dodge") +
  facet_grid(drv~year, scales = "free_y") +
  coord_flip()

#
diamonds |> 
  ggplot(aes(x = x, y = y)) +
  geom_point(aes(color = cut)) +
  facet_grid(color~cut) 

#str
#glimpse
diamonds |> 
  str()

#factor
