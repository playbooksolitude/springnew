#24-0919 thu 14:17

#
library(tidyverse)
library(plotly)
library(patchwork)

# 다이아몬드 설명
# https://www.tiffany.kr/engagement/diamond-education/carat.html?srsltid=AfmBOoq2Zrjjx5h4mH_5rAElBcrXLZgGQl-ze8_9IdBkD0Dn6ZjasB8J
#https://www.tiffany.kr/engagement/diamond-education/cut.html

#
diamonds |> 
  mutate(num = row_number(), .before = 1) |> 
  ggplot(aes(x = x, y = y, label = num)) +
  geom_point() -> edit_diamonds1

ggplotly(edit_diamonds1)

#
diamonds |> 
  mutate(num = row_number(), .before = 1) |> 
  ggplot(aes(x = x, y = z, label = num)) +
  geom_point() -> edit_diamonds2

ggplotly(edit_diamonds2)

edit_diamonds1 / edit_diamonds2

#
