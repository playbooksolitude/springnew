#25-0202 sun 08:13

#
library(tidyverse)
library(tidymodels)
pacman::p_load(tidymodels)

#
tribble(
  ~이름, ~식당,
  '요한', '감자탕',
  '윤식', '떡뽁이',
  '병현', '국수',
  '종우', '피자',
  '시현', '안먹음'
) -> a

a
sample_n(a, size = 1, replace = T, weight = c(0.6,0.1,0.1,0.1,0.1))
sample_n(a, size = 1, replace = T)
rep_sample_n(tbl = a, size = 1, reps = 10000, 
             prob = c(0.3,0.1,0.1,0.1,0.1)) |> 
  ungroup() |> 
  count(식당, sort = T)
  