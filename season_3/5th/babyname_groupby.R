#24-0805 mon 08:33

#
library(tidyverse)
library(babynames)
library(fueleconomy)
library(bbplot)

# 국가: 미국
# 연도 범위: 1880년부터 현재까지

#
babynames |> 
  group_by(year, sex) |> 
  reframe(sum = sum(n)) -> baby_1groupby

factor(baby_1groupby$sex) |> 
  fct_relevel(c('M', 'F')) -> baby_1groupby$sex

baby_1groupby |> 
  ggplot(aes(x = year, y = sum, 
             fill = sex)) +
  #geom_bar(stat = 'identity')
  geom_line(aes(color = sex)) +
  geom_area(alpha = .5, position = 'identity', aes(fill = sex)) +
  bbc_style() +
  ggtitle(label = 'USA Babynames') +
  scale_y_continuous(labels = scales::comma)

?babynames
  #pivot_wider(names_from = sex, values_from = sum) |> 
  # ggplot(aes(x = sex, y = year, fill = sum)) +
  # geom_tile() +
  # geom_text(aes(label = sum))
