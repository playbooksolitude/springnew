#24-0804 sun 00:53

#
library(tidyverse)

# fivethirtyeight: FiveThirtyEight에서 사용된 여러 흥미로운 데이터셋을 포함합니다.
# 
# 패키지: fivethirtyeight
# 사용법: library(fivethirtyeight)
# gss_cat: 일반 사회 조사(GSS) 데이터를 포함하며, 다양한 인구 통계 및 태도 조사를 다룹니다.
# 
# 패키지: forcats
library(forcats); data(gss_cat)
# lahman: 야구 선수들의 기록 및 통계를 포함하는 데이터셋입니다.
# 
# 패키지: Lahman
# 사용법: library(Lahman); data(LahmanData)
# babynames: 미국 사회 보장국에서 제공하는 1880년부터 2017년까지의 아기 이름 데이터입니다.
# 
# 패키지: babynames
# 사용법: library(babynames); data(babynames)
# nasaweather: NASA에서 제공하는 날씨 데이터로, 지리적 정보와 함께 온도, 습도 등을 포함합니다.
# 
# 패키지: nasaweather
# 사용법: library(nasaweather); data(nasaweather)
# titanic: 타이타닉 탑승자 정보와 생존 여부를 포함하는 데이터셋입니다.
# 
# 패키지: titanic
# 사용법: library(titanic); data(titanic_train)
# spotifyr: Spotify의 음악 데이터베이스에서 가져온 다양한 음악 데이터셋입니다.
# 
# 패키지: spotifyr
# 사용법: library(spotifyr)
# worldfootballR: 축구 선수와 경기 기록 데이터를 포함하는 데이터셋입니다.
# 
# 패키지: worldfootballR
# 사용법: library(worldfootballR)

#
install.packages('fivethirtyeight')
install.packages('nasaweather')
library(nasaweather)
nasaweather::atmos
install.packages('spotifyr')
library(spotifyr)
data()
library(MASS)
MASS::Cars93

install.packages('Lahman')
library('Lahman')

#와인
library(rattle)
rattle::audit


# 영화
library(ggplot2movies)
ggplot2movies::movies

#자전거
library(bikeshare14)
bikeshare14::bastations

#뉴욕 대기 오염
library('airqualityES')
airqualityES::airqES

#아이오와 주택
library(AmesHousing)
AmesHousing::ames_geo

#nfl
library(nflfastR)
data()
nflfastR::field_descriptions
nflfastR::stat_ids
nflfastR::teams_colors_logos

#휴스턴 비행기
library(hflights)
hflights

library('COVID19')
COVID19::covid19()
covid19() |> str()

#wooldridge 다양한 경제 지표와 통계 정보를 포함
library('wooldridge')
wooldridge::apple

#mlbench
library('mlbench')
data("BostonHousing")

#library(fueleconomy)
library(fueleconomy)
fueleconomy::common
fueleconomy::vehicles

#
babynames::babynames |> 
  group_by(year, sex) |> 
  reframe(sum = sum(n)) |> 
  ggplot(aes(x = factor(year), y = sum)) +
  geom_bar(stat = 'identity') +
  coord_flip()
  
pivot_wider(names_from = 'sex', 
              values_from = 'sum') |> 
  rowwise() |> 
  mutate(sums = sum(F,M))

#
babynames::births
babynames::applicants
babynames::lifetables

#
fueleconomy::common
common |> 
  count(make)
fueleconomy::vehicles
fueleconomy::vehicles |> 
  filter(make %in% c('Acura')) |> 
  count(make)








