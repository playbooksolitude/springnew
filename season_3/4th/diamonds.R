#24-0731 wedn 14:50

#
diamonds |> 
  ggplot(aes(x = x, y = y)) +
  geom_path()

diamonds |> 
  ggplot(aes(x = x, y = y)) +
  geom_qq()

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