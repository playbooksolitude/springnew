#23-1127 mon

#
library(tidyverse)

#
USArrests |> head()

ggplot(data = USArrests, 
       aes(x = Murder, 
           y = Rape)) +
  geom_point() + 
  geom_smooth(se = F)

#pairs
pairs(USArrests, 
      #panel = panel.smooth, 
      #panel = points,
      panel = panel.smooth,
      main = "USArrests data", 
      col = USArrests$Rape)

#
diamonds |> 
  #pairs(panel = panel.smooth)
  pairs()
  

# ----
USArrests
# 내장 데이터셋 iris 사용
data(iris)

# 산점도 행렬 생성
pairs(iris[, 1:4], 
      main = "Iris 데이터셋의 산점도 행렬", 
      col = iris$Species)
iris[,1:4]



iris[,1:4] |> 
  ggplot(aes(x = Sepal.Length, 
             y = Petal.Width)) +
  geom_point()

iris[,1:4] |> 
  ggplot(aes(x = Petal.Width, 
             y = Sepal.Length)) +
  geom_point()

#pairs
pairs(USArrests, 
      #panel = panel.smooth, 
      #panel = points,
      panel = panel.smooth,
      main = "USArrests data", 
      col = USArrests$Rape)

#
USArrests
# 내장 데이터셋 iris 사용
data(iris)

# 산점도 행렬 생성
pairs(iris[, 1:4], 
      main = "Iris 데이터셋의 산점도 행렬", 
      col = iris$Species)
iris[,1:4]


mtcars |> 
  pairs(panel = panel.smooth, col = mtcars$mpg)
