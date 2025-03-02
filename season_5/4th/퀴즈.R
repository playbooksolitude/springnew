오늘 퀴즈


#
#install.packages('fueleconomy')
library(fueleconomy)
library(tidyverse)
# install.packages('devtools')
#devtools::install_github('bbc/bbplot', force = T)
library(bbplot)
fueleconomy::vehicles

# factor() ----
vehicles |> 
  str()

vehicles |> 
  mutate_at(vars(make, model, class, trans, drive, fuel), factor) |> 
  str()

# 1 구조
#1-1 vehicles 데이터셋은 몇행 * 몇열인가?
vehicles

#1-2 'chr'열은 몇개인가?
vehicles |> glimpse()
vehicles |> str()

#1-3 cyl 열의 관측값 종류는 총 몇개인가?
#128개
vehicles$cyl |> table()
vehicles |> count(cyl)

#2 ggplot
#x = drive, y = 갯수, geom_bar, geom_label 그래프를 그리시오
vehicles |> 
  ggplot(aes(x = drive, y = after_stat(count))) +
  geom_bar() +
  bbc_style() +
  geom_label(stat = 'count', 
    aes(label = scales::comma(after_stat(count))), 
    size = 6) +
  #coord_flip() +
  theme(axis.text.x = element_text(angle = 30, 
    size = 16,
    hjust = .9)) +
  scale_y_continuous(limits = c(0,15000)) +
  labs(title = 'vehicles drive')


#2-2 maker와 model을 조합하면 몇개의 조합이 나오는가?  #model
#3,264
vehicles |> 
  count(model, make)


#3 make 열에서 '테슬라'자동차를 조회할 때 어떤 값으로 찾을 수 있는가?
#filter 사용
#Tesla #tesla
vehicles |> 
  filter(make %in% c("Tesla"))

#4  데이터셋
#4-1 'makes'라는 컬럼을 'model' 앞에 만들어 NA를 넣고 'vehicles_2na' 라고 저장하라
# mutate(makes = NA) 함수 사용
#
(vehicles |> 
    mutate(makes = NA, .before = 3) -> vehicles_2na)


#4-2 vehicles_2na의 make_2 값들을 모두 소문자로 바꿔 makes에 넣어라
#tolower, mutate 함수 사용
vehicles_2na |> 
  mutate(makes = tolower(make))

#4-3 (4-2)의 값을 vehicles_3tolower'이름으로 저장하라
#할당연산자 사용
vehicles_2na |> 
  mutate(makes = tolower(make)) -> vehicles_3tolower

#4-4 vehicles_3tolower에서 makes 열을 지우고 vehicles_4select 이름으로 저장하라 
(vehicles_3tolower |> 
    select(-make) -> vehicles_4select)


#5 vehicles 데이터셋으로 다시 돌아와서 Tesla의 자동차 모델은 총 몇개인가? (model)

#6개
vehicles |> 
  filter(make %in% c('Tesla'))

#6 Tesla와 Hyundai 자동차의 model을 동시에 조회하라 
#count
#%in% c('Hyundai', 'Tesla')
vehicles |> 
  filter(make %in% c('Hyundai', 'tesla')) 

#7 vehicles 데이터셋에 NA가 있는 컬럼은 무엇인가?



#8 vehicles의 NA 개수는 몇개인가?



# trans의 종류는 몇개인가? NA포함
# table()
vehicles$trans |> 
  table()


#8 #fuel의 종류는 총 몇개인가?
vehicles |> 
  count(fuel) 

#9
# model, make, class, trans, drive, fuel을 factor로 변경한 후
# vehicles_5factor 로 저장하라


vehicles |> glimpse()

(vehicles |> 
    mutate_at(vars(make, model, class, trans, drive, fuel), 
      factor) -> vehicles_5factor)

#10 geom_point
#10-1 x = cty, y = hwy, geom_point 그래프를 그려라
#vehicles_5factor
#alpha = .5


#10-2 drive컬럼으로 면분할 하라 
# facet_wrap(.~drive)

#10-3 fuel %in% c('Electricity')인 것만 색깔을 부여하라
vehicles_5factor |>   
  ggplot(aes(x = cty, y = hwy)) +
  geom_point(alpha = .5) +
  geom_point(data = vehicles_5factor |> 
      filter(fuel %in% c('Electricity')), 
    aes(color = fuel)) + 
  facet_wrap(.~drive)




