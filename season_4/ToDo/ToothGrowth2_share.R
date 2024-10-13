#24-1009 wednday 08:34

#
# 아웃라이어 발견
# 면분할
# 신뢰구간과 두 평균의 비교 t.test()

#
library(tidyverse)
library(ggmosaic)

#
data()

# 용어 통일
  # 관측값 * 변수
  # 행 * 열

#1 ToothGrowth ----
ToothGrowth
ToothGrowth |> str()
ToothGrowth |> glimpse()
ToothGrowth |> head(10)

#2 도움말 ----
?ToothGrowth

#3 탐색 ----
# 비타민 투여 방법과 용량에 따른 기니피어의 이빨 길이 실험
ToothGrowth |> 
  count(supp)

ToothGrowth |> 
  count(dose)

ToothGrowth |> summary()

#4 산점도 ----
ToothGrowth |>
  ggplot(aes(x = dose, y = len)) +
  geom_point()

##4-1 x축 factor() ----
ToothGrowth |>
  ggplot(aes(x = factor(dose), y = len)) +
  geom_point()

##4-2 오버플로팅----
ToothGrowth |>
  ggplot(aes(x = factor(dose), y = len)) +
  geom_point(alpha = .5)

##4-3 오버플로팅2 ----
ToothGrowth |>
  ggplot(aes(x = factor(dose), y = len)) +
  geom_point(position = position_jitter(width = .05), 
             alpha = .5)

##4-4 box_plot()----
ToothGrowth |>
  ggplot(aes(x = factor(dose), y = len)) +
  geom_point(position = position_jitter(width = .05), 
             alpha = .5) +
  geom_boxplot(outlier.color = 'tomato')

##4-5 box_plot() 순서----
ToothGrowth |>
  ggplot(aes(x = factor(dose), y = len)) +
  geom_boxplot(outlier.color = 'tomato') +
  geom_point(position = position_jitter(width = .05), 
             alpha = .5)

##4-6 면분할----
ToothGrowth |>
  ggplot(aes(x = factor(dose), y = len)) +
  geom_boxplot(outlier.color = 'tomato') +
  geom_point(position = position_jitter(width = .05), 
             alpha = .5) +
  facet_wrap(.~supp)

#
ToothGrowth |>
  ggplot(aes(x = factor(dose), y = len)) +
  geom_boxplot(outlier.color = 'tomato') +
  geom_point(position = position_jitter(width = .05), 
             alpha = .5) +
  facet_wrap(.~supp)


#표준오차
3.7 - (1.9153*2.021) # -0.1708213
3.7 + (1.9153*2.021) #  7.570821
#신뢰구간
# 95 percent confidence interval:
#   -0.1710156  7.5710156



