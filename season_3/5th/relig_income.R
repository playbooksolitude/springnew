#24-0731 wedn

#
library(tidyverse)
library(treemapify)
library(nord)
library(tidyr)

#
smiths |> 
  pivot_longer(cols = c(time:height), 
               names_to = "type", values_to = "value") |> 
  ggplot(aes(x = subject, fill = type)) +
  geom_bar(stat = 'count', position = 'dodge')

#
relig_income$religion |> tibble()
relig_income$religion |> distinct_n()

# ----
tibble(
  eng = 
)
# Agnostic
# Atheist
# Buddhist
# Catholic
# Don’t know/refused
# Evangelical Prot
# Hindu
# Historically Black Prot
# Jehovah's Witness
# Jewish
# Mainline Prot
# Mormon
# Muslim
# Orthodox
# Other Christian
# Other Faiths
# Other World Religions
# Unaffiliated
# 
# 불가지론자
# 무신론자
# 불교
# 가톨릭
# 모름/거부
# 복음주의 개신교
# 힌두교
# 역사적으로 흑인 프로테스탄트
# 여호와의 증인
# 유대인
# 메인 라인 시위
# 몰몬교
# 무슬림
# 정교회
# 기타 기독교
# 기타 종교
# 기타 세계 종교
# 소속 없음

# ----
relig_income |> 
  pivot_longer(cols = c(2:11), 
               names_to = 'type', values_to = 'value') |> 
  ggplot(aes(x = religion, y = type, fill = value)) +
  geom_tile() +
  geom_text(aes(label = value), color = "white" ) +
  coord_flip()

#
(relig_income |> 
  pivot_longer(cols = c(2:11), 
               names_to = 'type', 
               values_to = 'value') -> relig_1pivot)

relig_1pivot |> 
  ggplot(aes(area = value, fill = religion, 
             label = type, 
             subgroup = religion, 
             subgroup2 = religion)) +
  geom_treemap() +
  geom_treemap_text() +
  geom_treemap_subgroup_border() +
  geom_treemap_subgroup2_text(alpha = .7, place = "center") +
  scale_fill_nord(palette = "aurora", discrete = T)

