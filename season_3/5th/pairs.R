#23-1127 mon

#
library(tidyverse)

#
?USArrests

ggplot(data = USArrests, 
       aes(x = Murder, 
           y = Rape)) +
  geom_point() + 
  geom_smooth(se = F)

iris[,1:4] |> 
  ggplot(aes(x = Sepal.Length, 
             y = Petal.Width)) +
  geom_point()

iris[,1:4] |> 
  ggplot(aes(x = Petal.Width, 
             y = Sepal.Length)) +
  geom_point()
