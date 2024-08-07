#24-0805 mon 22:55

#
#install.packages('fueleconomy')
library(fueleconomy)
library(tidyverse)
fueleconomy::vehicles

vehicles |> 
  mutate_at(vars(make, model, class, trans, drive, fuel), factor) |> 
  str()

# 0
vehicles 
#1 자동차 maker(제조사)는 총 몇개 회사인가? #make
#128개
vehicles |> 
  count(make)

#2 자동차의 종류는 총 몇개인가? #model
#3,198
vehicles |> 
  count(model, sort = T)

#2-1 5번째로 많은 model의 수량과 이름은? 
#Mustang #154개 
vehicles |> 
  count(model, sort = T)

#3 make 열에서 '테슬라'자동차를 조회할 때 어떤 값으로 찾을 수 있는가?
#filter 사용
#Tesla #tesla
vehicles |> 
  filter(make %in% c("Tesla"))

#4  'makes'라는 컬럼을 'model' 앞에 만들어 NA를 넣고 'vehicles_2na' 라고 저장하라
# mutate(makes = NA) 함수 사용
#
(vehicles |> 
  mutate(makes = NA, .before = 3) -> vehicles_2na)


#4-1 vehicles_2na의 make_2 값들을 모두 소문자로 바꿔 makes에 넣어라
#tolower, mutate 함수 사용
vehicles_2na |> 
  mutate(makes = tolower(make))

#4-2 (4-1)의 값을 vehicles_3tolower'이름으로 저장하라
#할당연산자 사용
vehicles_2na |> 
  mutate(makes = tolower(make)) -> vehicles_3tolower

#4-3 vehicles_3tolower에서 makes 열을 지우고 vehicles_4select 이름으로 저장하라 
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

#10 x = cty, y = hwy, geom_point 그래프를 그려라
#vehicles_5factor
#alpha = .5


#11 drive컬럼으로 면분할 하라 
# facet_wrap(.~drive)

#12 fuel %in% c('Electricity')인 것만 색깔을 부여하라
vehicles_5factor |>   
  ggplot(aes(x = cty, y = hwy)) +
  geom_point(alpha = .5) +
  geom_point(data = vehicles_5factor |> 
               filter(fuel %in% c('Electricity')), 
             aes(color = fuel)) + 
  facet_wrap(.~drive)
  



























