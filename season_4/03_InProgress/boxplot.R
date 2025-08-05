#24-1022 tues

#
library(tidyverse)

(tibble(
  a = 0,
  b = c(51,52,53,54,55,56,57,58,59)) -> t1)

t1 |> 
  ggplot(aes(x = a, y = b)) +
  geom_point()


t1 |> 
  ggplot(aes(x = a, y = b)) +
  geom_boxplot() +
  geom_point()
  
  
t1 |> 
  ggplot(aes(x = a, y = b)) +
  geom_boxplot() +
  geom_point(aes(x = a + .1), size = 3, color = 'green3') +
  geom_label(aes(x = a + .2, label = b)) 

#t2
tibble(
  a = 0,
  b = c(51,52,53,54,65,76,77,78,79)) -> t2

t2 |> 
  ggplot(aes(x = a, y = b)) +
  geom_boxplot() +
  geom_point(aes(x = a + .1), size = 3, color = 'green3') +
  geom_label(aes(x = a + .2, label = b))

#t3
tibble(
  a = 0,
  b = c(41,52,53,54,65,76,92,98,99)) -> t3

t3 |> 
  ggplot(aes(x = a, y = b)) +
  geom_boxplot(outlier.colour = 'tomato') +
  geom_point(aes(x = a + .1), size = 3, color = 'green3') +
  geom_label(aes(x = a + .2, label = b))

#t4 ----
tibble(
  a = 0,
  b = c(41,52,53,54,65,76,77,78,119)) -> t4

t4 |> 
  ggplot(aes(x = a, y = b)) +
  geom_boxplot(outlier.color = 'tomato3', outlier.size = 4) +
  geom_point(aes(x = a + .1), size = 3, color = 'green3') +
  geom_label(aes(x = a + .2, label = b))

#t5 ----
tibble(
  a = 0,
  b = c(41,52,53,54,65,76,77,98,119)) -> t5

(t5 |> 
  ggplot(aes(x = a, y = b)) +
  geom_boxplot(outlier.color = 'tomato3', outlier.size = 4) +
  geom_point(aes(x = a + .1), size = 3, color = 'green3') +
  geom_label(aes(x = a + .2, label = b)) -> plot_1)

#t6 ----
tibble(
  a = 0,
  b = c(41,52,53,54,65,76,97,98,119)) -> t6

(t6 |> 
  ggplot(aes(x = a, y = b)) +
  geom_boxplot(outlier.color = 'tomato3', outlier.size = 4) +
  geom_point(aes(x = a + .1), size = 3, color = 'green3') +
  geom_label(aes(x = a + .2, label = b)) -> plot_2)

library(patchwork)
plot_1 
plot_2
