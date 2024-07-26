#24-0725 thu 08:15

#
library(dplyr)
library(ggplot2)
#library(tidyverse)
data()

#
diamonds |> 
  ggplot(aes(x = cut)) +
  geom_boxplot(aes(y = y)) +
  facet_wrap(.~color)

#
diamonds |> summary()
IQR(diamonds$y)
quantile(diamonds$y)
6.54-4.72
4.72 - (1.82*1.5)

