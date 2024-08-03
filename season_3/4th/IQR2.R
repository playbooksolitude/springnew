#24-0730 tuesday 00:02

#
library(tidyverse)

#
diamonds |> 
  count(carat, depth, x, sort = T) |> 
  ggplot(aes(x = x, y = depth, fill = n)) +
  #geom_tile()
  #geom_point(alpha = .1)
  geom_boxplot()

example("geom_boxplot")
example("stat_boxplot")
?geom_boxplot
?stat_boxplot()

#
diamonds |> 
  colnames()
diamonds

#
diamonds |> 
  ggplot(aes(x = x, y = x)) +
  geom_boxplot(outlier.colour = "red") +
  scale_y_continuous(breaks = c(0:12)) +
  geom_point()

diamonds$x |> IQR() #1.83
diamonds$x |> range()  #0 ~ 10.74
diamonds$x |> min()
diamonds$x |> max()
summary(diamonds) # 1st Q 4.710 3st Q 6.540
1.83 * (5.540)
6.540 + (1.83 * 1.5)
4.710 - (1.83 * 1.5)  

