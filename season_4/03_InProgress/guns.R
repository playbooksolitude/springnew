#24-0925 

#
source("~/Documents/springnew/season_4/Done/p_load.R", 
  echo = T)

# library(tidyverse)
library(AER)
#library(GGally)
data("Guns")

#
?Guns
?ggpairs

# Guns ----
Guns |> head()
Guns |> str()

# Guns pairs ----
pairs(Guns)
ggpairs(Guns, c("violent", "murder", "robbery",
                "prisoners", "income", "population"))



Guns |> head()
ggpairs(data = Guns, 
        columns = c("violent", "murder", "robbery",
                    "prisoners", "income", "population"), 
        mapping = aes(color = law))

#
Guns |> str()
Guns |> head()

#
Guns |> 
  ggplot(aes(x = murder, y = violent, color = law)) + 
  geom_point() +
  facet_grid(year~.)

#exam
example("ggpairs")
ggpairs(Guns, c("violent", "murder", "robbery",
                "prisoners", "income", "population"))

mtcars |> pairs()
mtcars[,1:6] |> pairs(panel = panel.smooth)
ggpairs(mtcars, c('mpg', 'cyl', 'disp', 'hp'))

#
mpg
ggpairs(data = mpg,
        columns = c('displ', 'cyl', 'cty', 'hwy'), 
        aes(color = drv))

mpg |> 
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point()

#Guns 데이터는 1977년부터 1999년까지 50개 미국 주와 워싱턴 D.C.데이터
# 13개의 변수를 포함한 1,173개의 관측치를 가진 데이터 프레임입니다.
# state: 주를 나타내는 요인(factor).
# year: 연도를 나타내는 요인(factor).
# violent: 폭력 범죄율 (인구 10만 명당 발생 건수).
# murder: 살인율 (인구 10만 명당 발생 건수).
# robbery: 강도율 (인구 10만 명당 발생 건수).
# prisoners: 전년도 주의 수감율 
    #인구 10만 명당 유죄 선고를 받은 수감자 수, 전년도 값
  # afam: 주 인구 중 10~64세 아프리카계 미국인 비율.
  # cauc: 주 인구 중 10~64세 백인 비율.
  # male: 주 인구 중 10~29세 남성 비율.
# population: 주 인구 (백만 명 단위).
# income: 주의 1인당 실질 개인 소득 (미국 달러).
# density: 주의 토지 면적 1제곱마일당 인구 수 (1,000으로 나눈 값).
# law: 요인(factor). 해당 연도에 주에 ‘shall carry’ 법이 시행 중인지 여부.

ggpairs(Guns, c("violent", "murder", "afam",
                "cauc", "male", "law"))

ggpairs(Guns, c("violent", "murder", "afam",
                "cauc", "income", "law"))

Guns |> head()
#
Guns |> str()
ggpairs(Guns, c("violent", "murder", "robbery",
                "prisoners", "income", "population"))