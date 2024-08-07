#24-0807 wedn 22:20 

#quiz

# 기본
#install.packages("fueleconomy")
library(fueleconomy)
library(dplyr)
library(ggplot2)

# 데이터셋 확인
head(vehicles)

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
# 'cyl == 4' 차량들의 평균 고속도로 연비를 계산하세요.
# 힌트: filter()와 reframe() 함수를 사용하세요.
vehicles |>
  filter(cyl == 4) |>
  reframe(avg_hwy = mean(hwy, na.rm = TRUE))


#4 ----
# 가장 많은 모델을 보유한 제조사 3개를 찾으세요.
# 힌트: count() 함수와 arrange() 함수를 사용하세요.
# 가장 많은 모델을 보유한 제조사 찾기
vehicles |>
  count(make) |>
  arrange(desc(n)) |>
  head(3)


#5 ----
# Tesla의 모델 수를 계산하세요.
# 힌트: filter()와 count() 함수를 사용하세요.
vehicles |>
  filter(make == "Tesla") |>
  count(make)


#6 ----
# 2010년 이후 생산된 전기차량의 모델 수를 계산하세요.
# 힌트: filter()와 count() 함수를 사용하세요.
vehicles |> 
  filter(year > 2010, 
         fuel %in% c('Electricity')) |> 
  count()


#7 ----
# 연도별 평균 고속도로 연비의 변화를 시각화하세요.
# 힌트: group_by(), reframe(), ggplot(), geom_line()을 사용하세요.
vehicles |> 
  group_by(year) |> 
  reframe(mean_hwy = mean(hwy, na.rm = T)) |> 
  ggplot(aes(x = year, y = mean_hwy, fill = mean_hwy)) +
  geom_line() #+
  geom_area(alpha = .5)

fueleconomy::vehicles |> 
  count(drive)
#8 ----
# 2015년도 제조사별 평균 도시 연비를 막대 그래프로 시각화하세요.
# 내림차순으로 정렬하세요
# 힌트: group_by(), reframe(), ggplot(), 
  # geom_bar(), coord_flip(), geom_label()를 사용하세요.
vehicles |> 
    filter(year == '2015') |> 
    group_by(make) |> 
    reframe(mean_cty = mean(cty, na.rm = T)) |> 
    ggplot(aes(x = make |> fct_reorder(mean_cty), 
               y = mean_cty)) +
    geom_bar(stat = 'identity') +
    coord_flip() +
    geom_label(aes(label = round(mean_cty,1))) +
    xlab("Manufacturer") +
    ylab("Average City MPG")
  

#9 ----
# 제조사별 평균 도시 연비 상위 10개 제조사를 시각화하세요.
# 힌트: group_by(), reframe(), top_n(), ggplot(), geom_bar()를 사용하세요.
# 제조사별 평균 도시 연비 상위 10개 제조사 시각화
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


#10 ----
# 4기통이거나 6기통 엔진을 가진 차량의 고속도로 연비 분포를 히스토그램으로 시각화하세요.
#
# 힌트: filter(), ggplot(), geom_histogram()을 사용하세요.
# fill = factor(cyl)
# 6기통 엔진 차량의 고속도로 연비 분포 히스토그램 시각화

vehicles |> #str()
  filter(cyl %in% c(4,6)) |>
  ggplot(aes(x = hwy)) +
  geom_histogram(aes(fill = factor(cyl)), position = 'stack',
                 color = 'white',binwidth = 1) +
  ggtitle("Highway MPG Distribution for 6-cylinder Cars") +
  xlab("Highway MPG") +
  ylab("Frequency") #+
  facet_wrap(.~cyl)



#11 ----
# 연도별 생산된 모델 수를 geom_bar 그래프로 시각화하세요.
# 힌트: count(), ggplot(), geom_bar()을 사용하세요.
vehicles |>
  count(year) |>
  ggplot(aes(x = year, y = n)) +
  geom_bar(stat = 'identity') +
  ggtitle("Number of Models Produced Over Years") +
  xlab("Year") +
  ylab("Number of Models")


#12 ----
# Ford 모델의 도시연비와 고속도로 연비를 geom_point으로 시각화하세요.
# 힌트: filter(), ggplot()을 사용하세요.
vehicles |>
  filter(make == "Ford") |>
  ggplot(aes(x = cty, y = hwy)) +
  geom_point(alpha = .5) + 
  ggtitle("Highway MPG for Ford Models Over Years") +
  xlab("Year") +
  ylab("Highway MPG")


#13 ----
# 제조사별 평균 배기량을 막대 그래프로 시각화하세요.
# 힌트: group_by(), reframe(), ggplot(), geom_bar()를 사용하세요.
# 제조사별 평균 배기량 막대 그래프 시각화
vehicles |>
  group_by(make) |>
  reframe(avg_displ = mean(displ, na.rm = TRUE)) |>
  ggplot(aes(x = reorder(make, -avg_displ), y = avg_displ)) +
  geom_bar(stat = "identity") +
  ggtitle("Average Displacement by Manufacturer") +
  xlab("Manufacturer") +
  ylab("Average Displacement") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))



#14 ----
# 2010년 이후 생산된 차량의 연도별 평균 도시 연비 변화를 시각화하세요.
# 힌트: filter(), group_by(), reframe(), ggplot(), geom_line()을 사용하세요.
# 2010년 이후 생산된 차량의 연도별 평균 도시 연비 변화 시각화
vehicles |>
  filter(year >= 2010) |>
  group_by(year) |>
  reframe(avg_cty = mean(cty, na.rm = TRUE)) |>
  ggplot(aes(x = year, y = avg_cty)) +
  geom_line() +
  ggtitle("Average City MPG for Cars Produced After 2010") +
  xlab("Year") +
  ylab("Average City MPG")



#15 ----
# 연료 유형별 고속도로 연비 분포를 상자 그림으로 시각화하세요.
# 힌트: ggplot(), geom_boxplot()을 사용하세요.
# 연료 유형별 고속도로 연비 분포 상자 그림 시각화
vehicles |>
  ggplot(aes(x = factor(fuel), y = hwy)) +
  geom_boxplot() +
  ggtitle("Highway MPG Distribution by Fuel Type") +
  xlab("Fuel Type") +
  ylab("Highway MPG")


#16 ----
# 제조사별 총 모델 수를 파이 차트로 시각화하세요.
# 힌트: count(), ggplot(), geom_bar(), coord_polar()를 사용하세요.
# 제조사별 총 모델 수 파이 차트 시각화
vehicles |>
  count(make) |>
  ggplot(aes(x = "", y = n, fill = make)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  ggtitle("Number of Models by Manufacturer") +
  theme_void()


#17 ----
# 연료 유형별 평균 도시 연비를 막대 그래프로 시각화하세요.
# 힌트: group_by(), reframe(), ggplot(), geom_bar()를 사용하세요.
# 연료 유형별 평균 도시 연비 막대 그래프 시각화
vehicles |>
  group_by(fuel) |>
  reframe(avg_cty = mean(cty, na.rm = TRUE)) |>
  ggplot(aes(x = reorder(fuel, -avg_cty), y = avg_cty)) +
  geom_bar(stat = "identity") +
  ggtitle("Average City MPG by Fuel Type") +
  xlab("Fuel Type") +
  ylab("Average City MPG")

#18 ----
# 배기량과 고속도로 연비 간의 관계를 산점도로 시각화하세요.
# 힌트: ggplot(), geom_point()를 사용하세요.
# 배기량과 고속도로 연비 간의 관계 산점도 시각화
vehicles |>
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(alpha = 0.5) +
  ggtitle("Displacement vs Highway MPG") +
  xlab("Displacement") +
  ylab("Highway MPG")



#19 ----
# 배기량별 평균 고속도로 연비를 꺾은선 그래프로 시각화하세요.
# 힌트: group_by(), reframe(), ggplot(), geom_line()을 사용하세요.
# 배기량별 평균 고속도로 연비 꺾은선 그래프 시각화
vehicles |>
  group_by(displ) |>
  reframe(avg_hwy = mean(hwy, na.rm = TRUE)) |>
  ggplot(aes(x = displ, y = avg_hwy)) +
  geom_line() +
  ggtitle("Average Highway MPG by Displacement") +
  xlab



#20 ----
# 연료 유형별 연비 상관관계를 산점도로 시각화하세요.
# 힌트: ggplot(), geom_point(), facet_wrap()을 사용하세요.


