#25-0119 sun 15:00

#
library(tidyverse)

#
tribble(
  ~이름, ~피자, ~사이즈,
  '최요한', '치즈피자','하프',
  '종우님', '허리케인골드', '하프',
  '윤식님', '페퍼로니피자','하프',
  '병현님','포테이토피자','하프',
  '시현님', '페퍼로니피자', 
  '하프') -> pizza

pizza |> 
  sample_n(2)

set.seed(123)
pizza |> 
  sample_n(2)


set.seed(1234)
pizza |> 
  sample_n(2)

# 엑셀의 셀 숨기기 ----
batting[batting$rank == 1,] %>%
  ggplot(aes(x = year,
    y = avg)) +
  geom_line() +
  coord_cartesian(ylim=c(.350, .420))

# 특정 부분만 포커싱
mpg |> 
  count(cty) |> 
  ggplot(aes(x = cty, y = n)) +
  geom_point() +
  coord_cartesian(xlim = c(20,35))

#
library(tidyverse)


















