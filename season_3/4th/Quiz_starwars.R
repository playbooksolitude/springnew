#24-0725 thu 

# starwars Quiz ----

#
library(dplyr)
library(ggplot2)
#library(tidyverse)

# starwars dataset
dplyr::starwars

#starwars, dim()
#1. starwars dataset은 몇행 몇열인가? ----


#select
#2.starwars 컬럼을 아래 순서로 변경하라 ----
#name, species, gender, sex, birth_year, everything() 


#3.starwars 에서 아래 6개 컬럼만 조회하라 (87행 6열)) ----
#name, height, mass, sex, species, birth_year


#4.위에서 만든 87행 6열의 데이터를 A라는 변수에 저장하라 ----


#arrange(), desc(), is.na()
#5. A 에서 가장 나이(birth_year)가 어린 배역의 이름은 무엇인가? ----


#6. A 에서 키가 크고 체중이 많이 나가는 순서로 내림차순하라----
#(내림차순) 큰 것부터 나오는 것, #(내림차순) 작은 것부터 나오는 것
#키가 동일할 경우 체중이 많이 나가는 사람이 먼저 나와야 한다


#!is.na(starwars$birth_year)
#7 A에서 birth_year 가 NA 아닌 사람 중에 가장 키가 큰 사람의 이름은 무엇인가? ----


#is.na(), sum(), NA가 몇명인가?
#8. starwars 출연 배우 중 나이를 알 수 없는 배역은 총 몇명인가?  ----


#8-1. starwarw 출연 배우 87명의 species, sex 구성을 표로 만드시오
table(starwars$sex, useNA = "always")
starwars |> count(sex)
table(starwars$sex)


#9. 나이를 알 수 없는 배역의 이름을 모두 출력하시오 ----
#starwars  |>  filter(birth_year = NA)


#10. 나이를 알 수 있는 배역의 이름을 모두 출력하시오 ----


#geom_bar() 
#11. starwars 출연 배우의 성별을 막대그래프로 그리시오 (x = gender) ----


#fill = sex
#12 위에서 그린 그래프에 성별을 색칠하시오  ----



#13 위 누적 막대그래프를 묶음막대 그래프로 변경하시오 ----



#14. group_by() |> summarise() 활용해 gender 구성표를 만들고 B라는 변수에 저장하시오 ----
starwars |> 
  group_by(gender) |> 
  reframe(n = n())


#geom_bar(stat = "identity)
#15 위에서 만든 표를 활용해 geom_bar() 막대 그래프를 그리시오 ----


#16 위에서 만든표에 geom_label()을 붙이시오 ----


#17 위의 그래프에서  NA를 제거하시오 ----


