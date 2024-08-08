#24-0807 wedn 22:20 

#quiz

# 기본
#install.packages("fueleconomy")
library(fueleconomy)
library(dplyr)
library(tidyverse)

#0 데이터셋 확인 ----
head(vehicles)
vehicles |> 
  mutate_at(vars(make, model, class, trans, drive, fuel), factor) |> 
  str()

#1 ----
# 제조사별 평균 고속도로 연비를 계산하세요.
# 결과는 평균 연비가 높은 순서로 정렬하세요.
# 힌트: group_by()와 reframe() 함수를 사용하세요.
vehicles  |> 
  group_by(make) |>
  reframe(avg_hwy = mean(hwy, na.rm = TRUE)) |>
  arrange(desc(avg_hwy))


#2 ----
# 2015년 차량들의 평균 도시 연비를 계산하세요.
# 힌트: filter()와 reframe() 함수를 사용하세요.
# 2015년 차량들의 평균 도시 연비 계산
vehicles |>
  filter(year == 2015) |>
  reframe(avg_cty = mean(cty, na.rm = TRUE))


#3 ----
# x = displ, y = cty, goem_point 그래프를 그리세요.
  # NA값은 제외하세요 (57개)
  # fuel 단위로 면분할 (facet_wrap) 하세요
vehicles |>
  drop_na(displ) |> 
  ggplot(aes(x = displ, y = cty)) +
  geom_point() +
  facet_wrap(.~fuel)


#4 ----
# 가장 많은 모델을 보유한 제조사 3개를 찾으세요.
# 힌트: count() 함수와 arrange() 함수를 사용하세요.
vehicles |>
  count(make) |>
  arrange(desc(n)) |>
  head(3)


#5 ----
# Tesla가 생산한 모델 수를 계산하세요.
# 힌트: filter()와 count() 함수를 사용하세요.
vehicles |>
  filter(make == "Tesla") |>
  count(make)


#6 ----
# 2010년 이후 생산된 전기차량을 제조사, 모델별로 계산하세요.
# 힌트: filter()와 count() 함수를 사용하세요.
vehicles |> 
  filter(year > 2010, 
         fuel %in% c('Electricity')) |> 
  count(make, model, sort = T)


#7 ----
# 연도별 평균 고속도로 연비의 변화를 시각화하세요.
# 힌트: group_by(), reframe(), geom_line(), geom_bar()를 사용하세요.
vehicles |> 
  group_by(year) |> 
  reframe(mean_hwy = mean(hwy, na.rm = T)) |> 
  ggplot(aes(x = year, y = mean_hwy, fill = mean_hwy)) +
  geom_bar(stat = 'identity') +
  geom_line(size = 2) 



#8 ----
# 도시연비 평균이 가장 좋은 자동차 모델 20개를 시각화하세요
  # 내림차순으로 정렬하세요
  # geom_bar(), coord_flip(), geom_label()를 사용하세요.
vehicles |> 
    group_by(make, model) |> 
    reframe(mean_cty = mean(cty, na.rm = T)) |> 
  arrange(desc(mean_cty)) |> 
  head(20) |> 
    ggplot(aes(x = model |> fct_reorder(mean_cty), 
               y = mean_cty)) +
    geom_bar(stat = 'identity') +
    coord_flip() +
    geom_label(aes(label = round(mean_cty,1))) +
    xlab("model") +
    ylab("Average City MPG") +
  ggtitle(label = 'Top20 mean_cty')
  

#9 ----
# 연료별 자동차 수 top 10를 조회하세요 (fuel)
# 동점일 경우 top_n(), arrange(), slice_max(with_ties = F)등을 사용하세요.
#
vehicles |> count(fuel, sort = T) |> top_n(10)
vehicles |> count(fuel, sort = T) |> head(10)
vehicles |> count(fuel, sort = T) |> 
  slice_max(order_by = n, n = 10, with_ties = F)

#10 ----
# trans별 자동차 수를 조회하세요
# 힌트: group_by(), reframe(), top_n(), ggplot(), geom_bar()를 사용하세요.
# 제조사별 평균 도시 연비 상위 10개 제조사 시각화
vehicles |> 
  count(trans, sort = T)
vehicles$trans |> 
  table() |> 
  data.frame()


#11 ----
# NA포함된 컬럼과 NA 개수를 조회하시오
# 힌트: colsSums(), is.na(),
vehicles |> 
  is.na() |> 
  colSums()


vehicles |>
  group_by(make) |>
  reframe(avg_cty = mean(cty, na.rm = TRUE)) |>
  top_n(10, avg_cty) |>
  ggplot(aes(x = reorder(make, -avg_cty), y = avg_cty)) +
  geom_bar(stat = "identity") +
  ggtitle("Top 10 Manufacturers by Average City MPG") +
  xlab("Manufacturer") +
  ylab("Average City MPG") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#12 ----
# 4기통 자동차와 8기통 자동타의 도시 연비와 고속도로 연비를 시각화해 비교하세요.
# 힌트: filter(), geom_jitter을 사용하세요.
# cty, hwy

vehicles |> #str()
  filter(cyl %in% c(4,8)) |>
  ggplot(aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter(alpha = .3) +
  ggtitle("cty x hwy by cyl") +
  xlab("cty MPG") +
  ylab("why MPG")



#13 ----
# 위 그래프에서 drive 별로 면분할 하시오
# 힌트: count(), ggplot(), geom_bar()을 사용하세요.
vehicles |> #str()
  filter(cyl %in% c(4,8)) |>
  ggplot(aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter(alpha = .3) +
  facet_wrap(.~drive) +
  ggtitle("cty x hwy by cyl") +
  xlab("cty MPG") +
  ylab("why MPG")


#14 ----
# cyl(실린더) 크기를 기준으로 displ(배기량)의 요약통계를 계산하시오
# 힌트: group_by, reframe, mean, median, sd, min, max 사용하세요.
(vehicles %>%
  group_by(cyl) |> 
  reframe(
    mean_displ = mean(displ, na.rm = TRUE),
    median_displ = median(displ, na.rm = TRUE),
    sd_displ = sd(displ, na.rm = TRUE),
    min_displ = min(displ, na.rm = TRUE),
    max_displ = max(displ, na.rm = TRUE)))


#15 ----
# 제조사별 평균 배기량(displ)을 막대 그래프로 시각화하세요.
# 힌트: group_by(), reframe(), ggplot(), geom_bar()를 사용하세요.
# theme(axis.text.x = element_text(angle = 90, hjust = 1))
vehicles |>
  group_by(make) |>
  reframe(avg_displ = mean(displ, na.rm = TRUE)) |>
  ggplot(aes(x = reorder(make, -avg_displ), y = avg_displ)) +
  geom_bar(stat = "identity") +
  ggtitle("Average Displacement by Manufacturer") +
  xlab("Manufacturer") +
  ylab("Average Displacement") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#16 ----
# fuel, drive의 자동차 대수를 히트맵으로 시각화하세요
# 힌트: count(), ggplot(), geom_tile()을 사용하세요.
# theme_minimal() 덧붙여 보세요
# theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 12))

vehicles |>
  drop_na(fuel, drive) |> 
  count(fuel, drive) |> 
  ggplot(aes(x = drive, y = fuel, fill = n)) +
  geom_tile() +
  geom_text(aes(label = n), color = 'white') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 12),
        axis.text.y = element_text(size = 12), 
        plot.title = element_text(size = 28)) +
  labs(title = 'drive x fuel', x = 'Drive',  y= 'Fuel')


#17 geom_tile() ----
# 연료 유형별 고속도로 연비 분포를 상자 그림으로 시각화하세요.
# 힌트: ggplot(), geom_boxplot()을 사용하세요.
# geom_jitter(width = .1, alpha = .1)을 덧붙이세요
vehicles |>
  ggplot(aes(x = factor(fuel), y = hwy)) +
  geom_jitter(width = .1, alpha = .1) +
  geom_boxplot() +
  ggtitle("Highway MPG Distribution by Fuel Type") +
  xlab("Fuel Type") +
  ylab("Highway MPG") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#18 ----
# 실린터 크기와 고속도로 연비간의 관계를 산점도로 시각화하세요
# 힌트: ggplot(), geom_point()를 사용하세요.
vehicles |>
  drop_na(cyl) |> 
  ggplot(aes(x = cyl, y = hwy)) +
  geom_point(position = position_jitter(.2), alpha = .1) +
  ggtitle("cyl x hwy")

    
#19 ----
# 배기량과 고속도로 연비 간의 관계를 산점도로 시각화하세요.
# 힌트: ggplot(), geom_point()를 사용하세요.
# facet_wrap(drive) 적용해보세요
# 배기량과 고속도로 연비 간의 관계 산점도 시각화
vehicles |>
  drop_na(displ) |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(alpha = 0.1) +
  ggtitle("Displacement vs Highway MPG") +
  xlab("Displacement") +
  ylab("Highway MPG") +
  facet_wrap(.~drive)


#20 ----
# 도시 연비와 고속도로 연비를 선형회귀로 시각화 하세요.
# 힌트: geom_smooth(), geom_point()을 사용하세요.
# 배기량별 평균 고속도로 연비 꺾은선 그래프 시각화
vehicles |>
  ggplot(aes(x = cty, y = hwy)) +
  geom_point(alpha = .1) +
  geom_smooth(method = 'lm')  +
  facet_wrap(.~fuel)

