#24-0807 wedn 22:20 

#quiz

# 기본 ----
#install.packages("fueleconomy")
library(fueleconomy)
library(tidyverse)

## 데이터셋 확인 ----
#첫번째 6줄
head(vehicles)      

## 구조 ----
vehicles |> str()   
vehicles |> glimpse()

#character -> factor() 변경해 level 보기 
  #범주형 변수에 몇 종류의 관측값이 있는지 확인
  #charactor 자료형으로는 볼수 없음
vehicles |>         
  mutate_at(vars(make, model, class, trans, drive, fuel), factor) |> 
  str() 
  #drive factor w/ 7 levels 

# quiz ----
#1 평균 고속도로 연비 ----
# 제조사별 평균 고속도로 연비를 계산하시오.
# 평균 연비가 높은 순서로 정렬하시오.
# group_by(), reframe(), mean()
# hwy, make

vehicles  |> 
  group_by(make) |>
  reframe(avg_hwy = mean(hwy, na.rm = TRUE)) |>
  arrange(desc(avg_hwy))


#2 2015년 평균 도시 연비 ----
# 2015년 차량들의 평균 도시 연비를 계산하시오.
# filter(), reframe(), year, cty

vehicles |>
  filter(year == 2015) |>
  reframe(avg_cty = mean(cty, na.rm = TRUE))

vehicles  |> 
  group_by(make) |>
  reframe(avg_hwy = mean(hwy)) |>
  arrange(desc(avg_hwy)) |> view()



#3 goem_point ----
# x = displ, y = cty, goem_point 그래프를 그리시오.
  # NA값은 제외하시오 (57개)

vehicles |>
  drop_na(displ) |> 
  ggplot(aes(x = displ, y = cty)) +
  geom_point()


#4 제조사 top 3 ----
# 모델수가 가장 많은 제조사 3개의 모델수는 각각 몇개인지 계산하시오.
# 힌트: count(), arrange(), head(), desc(), make

vehicles |>
  count(make) |>
  arrange(desc(n)) |>
  head(3)


#5 연도별 Tesla  차량수 ----
# Tesla와 Toyota가 생산한 차량을 연도별로 계산하시오.
# filter(), count(), make, year 

vehicles |>
  filter(year >= 2010,
    make %in% c("Tesla", 'Toyota')) |>
  group_by(year) |> 
  count(make)


#6 pivot_wider ----
# 2010년부터 2013년까지 생산된 전기차량의 drive와 class를 pivot_wider()함수를 활용해 넓은 형식으로 표현하시오
# filter(), count(), pivot_wider(name_from = drive, value_from = n)
# Electricity #year #class #drive

vehicles |> 
  filter(year >= 2010, year < 2014, fuel %in% c('Electricity')) |> 
  count(drive, class) |> 
  pivot_wider(names_from = drive, values_from = n)


#7 연도별 Hyundai 자동차 모델 수----
# Hyundai의 자동차 생산 대수를 연도별 막대그래프로 시각화하시오
# 기간 : 2001년~ 2014년
# geom_label를 활용하세요
# group_by(), reframe(), year, make, n(), goem_bar()

vehicles |> 
  filter(make %in% c("Hyundai"), 
         year >= 2001, year <=2014) |> 
  group_by(year) |> 
  reframe(n = n()) |> 
  ggplot(aes(x = year, y = n)) +
  geom_bar(stat = 'identity') +
  geom_label(aes(label = n))
  

#8 4 레이블 및 제목 추가 ----
# Toyota 차량 중 도시연비가 가장 좋은 모델 10개를 시각화하시오
  # 내림차순으로 정렬하시오
  # xlab(), ylab()
  # make, model
  # geom_bar(), coord_flip(), geom_label(), mean(), fct_reorder()

vehicles |> 
  filter(make == 'Mercedes-Benz') |> 
  group_by(model, year, drive, fuel) |> 
  reframe(mean_cty = mean(cty)) |> 
  arrange(desc(mean_cty)) |> 
  head(5) |> 
  ggplot(aes(x = model |> fct_reorder(mean_cty), 
             y = mean_cty)) +
  geom_bar(stat = 'identity') +
  geom_label(aes(label = mean_cty), size = 6) +
  coord_flip() +
  ggtitle(label = 'Top5 Mercedes-Benz', subtitle = 'mean_cty') +
  bbc_style() 


#9 동점처리 ----
# 연료별로 자동차 수가 많은 top 10를 조회하시오 (fuel)
# fuel, #count()
# top 10 안에 동점이 있을 경우 모두 포함하시오
# top_n(), arrange(), slice_max(with_ties = F)등을 사용하시오

vehicles |> count(fuel, sort = T) |> top_n(10)
vehicles |> count(fuel, sort = T) |> slice(1:10)
vehicles |> count(fuel, sort = T) |> head(10)
vehicles |> count(fuel, sort = T) |> slice_max(n, n = 10)


#10 관측값의 종류와 NA ----
# trans의 종류는 총 몇개인가?

vehicles |> 
  count(trans, sort = T) 


#11 na ----
# NA가 포함된 컬럼과 NA 개수를 계산하고 tibble 형태로 출력하시오.

vehicles |> 
  is.na() |> 
  colSums() |> 
  as_tibble(rownames = 'c')


#12 함정 ----
# 2010년부터 2015년까지 평균 도시연비가 높은 제조사 10개를 시각화하라
# geom_bar(), filter(), group_by(), reframe(), top_n(), geom_bar()


vehicles |>
  filter(year >= 2010, year <= 2015) |> 
  group_by(make) |>
  reframe(avg_cty = mean(cty, na.rm = TRUE), 
          n = n()) |>
  top_n(10, avg_cty) |>
  ggplot(aes(x = reorder(make, -avg_cty), y = avg_cty)) +
  geom_bar(stat = "identity") +
  ggtitle("Top 10 mean_cty") +
  xlab("make") +
  ylab("mean cty")


#13 함정2 ----
# 2010년부터 2015년까지 생산 모델수가 10개 이상인 제조사 중 평균 도시연비가 높은 제조사 10개를 시각화하고 12번과 목록을 비교하라
# geom_bar(), filter(), group_by(), reframe(), top_n(), geom_bar(), n()

vehicles |>
  filter(year >= 2010, year <= 2015) |> 
  group_by(make) |>
  reframe(avg_cty = mean(cty, na.rm = TRUE), 
          n = n()) |>
  filter(n >= 10) |> 
  top_n(10, avg_cty) |> 
  ggplot(aes(x = reorder(make, -avg_cty), y = avg_cty)) +
  geom_bar(stat = "identity") +
  ggtitle("n() 함수의 중요성") +
  xlab("make") +
  ylab("mean cty") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

  
# 14 cyl 비교 ----
# 4기통 자동차와 8기통 자동차의 도시 연비와 고속도로 연비를 시각화 하시오.
# geom_jitter(), filter(), factor(cyl), 
# cty, hwy

vehicles |> #str()
  filter(cyl %in% c(4,8)) |>
  ggplot(aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter(alpha = .3) +
  ggtitle("cty x hwy") 


#15 면분할 ----
# 위 그래프를 drive 별로 면분할 하시오
# facet_wrap() 사용하시오.

vehicles |> #str()
  filter(cyl %in% c(4,8)) |>
  ggplot(aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter(alpha = .3) +
  facet_wrap(.~drive) +
  ggtitle("cty x hwy", subtitle = 'facet_wrap') 

#16 요약통계 ----
# cyl(실린더) 크기를 기준으로 displ(배기량)의 요약통계를 계산하시오
  # group_by, reframe, mean, median, sd, min, max 사용하시오.

(vehicles %>%
  group_by(cyl) |> 
  reframe(
    mean_displ = mean(displ, na.rm = TRUE),
    median_displ = median(displ, na.rm = TRUE),
    sd_displ = sd(displ, na.rm = TRUE),
    min_displ = min(displ, na.rm = TRUE),
    max_displ = max(displ, na.rm = TRUE)))


#17 축 레이블 회전 ----
# 2014년 기준 제조사별 평균 배기량(displ)을 막대 그래프로 시각화하시오.
# group_by(), reframe(), ggplot(), geom_bar()를 사용하시오.
# na 제거 
# theme(axis.text.x = element_text(angle = 90, hjust = 1))
vehicles |>
  filter(year == 2014) |> 
  drop_na(displ) |> 
  group_by(make) |>
  reframe(avg_displ = mean(displ, na.rm = TRUE)) |>
  ggplot(aes(x = reorder(make, -avg_displ), y = avg_displ)) +
  geom_bar(stat = "identity") +
  ggtitle("Average Displacement by Manufacturer") +
  xlab("make") +
  ylab("mean displ") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#18 히트맵 ----
# fuel, drive의 자동차 대수를 히트맵으로 시각화하시오
# x = fuel, y = drive
# count(), ggplot(), geom_tile()을 사용하시오.
  # theme_minimal() +
  # theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 12),
  #      axis.text.y = element_text(size = 12), 
  #      plot.title = element_text(size = 28)) 

vehicles |>
  drop_na(fuel, cyl) |> 
  count(fuel, cyl) |> 
  ggplot(aes(x = factor(cyl), y = fuel, fill = n)) +
  geom_tile() +
  geom_text(aes(label = n), color = 'white') +
  xlab('cyl') 


# 19 theme_minimal()
# 18번에서 만든 그래프에 theme_minimal을 적용하시오
# theme() 함수를 사용해 심미성을 높이시오

vehicles |>
  drop_na(fuel, cyl) |> 
  count(fuel, cyl) |> 
  ggplot(aes(x = factor(cyl), y = fuel, fill = n)) +
  geom_tile() +
  geom_text(aes(label = n), color = 'white') +
  xlab('cyl') +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 12),
        legend.position='none') 


#20 boxplot ----
# 연료 유형별 고속도로 연비 분포를 상자 그림으로 시각화하시오.
# x = fuel, y = hwy
# ggplot(), geom_boxplot()을 사용하시오.
# geom_jitter(width = .1, alpha = .1)을 덧붙이세요
# boxplot()과 geom_point()는 항상 같이

vehicles |>
  ggplot(aes(x = fuel, y = hwy)) +
  geom_jitter(width = .1, alpha = .1) +
  geom_boxplot() +
  ggtitle("Highway MPG Distribution by Fuel Type") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))




#21 mutate ----
# 고속도로 연비보다 도시연비가 좋은 차 5대,  도시연비보다 고속도로 연비가 좋은 차 5대를 한 화면에 출력하시오
# mutate(), arrange(), slice()

vehicles |>
  mutate(gap = hwy - cty, .before = 1) |> 
  arrange(gap) |> 
  slice(1:5, 33438:33442)
    

#22 histogram
vehicles |> 
  ggplot(aes(x = hwy)) +
  geom_histogram(binwidth = 3)


#23 선형 회귀 ----
# 도시 연비와 고속도로 연비를 선형회귀로 시각화 하시오.
# geom_smooth(), geom_point()을 사용하시오.
# 배기량별 평균 고속도로 연비 꺾은선 그래프 시각화

vehicles |>
  ggplot(aes(x = cty, y = hwy)) +
  geom_point(alpha = .1) +
  geom_smooth(method = 'lm')  +
  facet_wrap(fuel~., ncol = 3)

# CNG (압축 천연가스) - 천연가스를 압축한 연료
# Diesel - 디젤 연료
# Electricity - 전기
# Gasoline or E85 - 가솔린 또는 에탄올 혼합 연료 (E85)
# Gasoline or natural gas - 가솔린 또는 천연가스
# Gasoline or propane - 가솔린 또는 프로판
# Midgrade - 중간 등급 가솔린
# Premium - 고급 가솔린
# Premium Gas or Electricity - 고급 가솔린 또는 전기
# Premium and Electricity - 고급 가솔린과 전기 (하이브리드)
# Premium or E85 - 고급 가솔린 또는 에탄올 혼합 연료 (E85)
# Regular - 일반 가솔린
# Regular Gas and Electricity - 일반 가솔린과 전기 (하이브리드)

vehicles |> 
  count(fuel) |> select(1)
  with(fuel)
  


vehicles |> 
  count(cty, hwy) |> 
  ggplot(aes(x = hwy, cty)) +
  geom_point(position = position_jitter(.1), alpha = .3)
  

  
  