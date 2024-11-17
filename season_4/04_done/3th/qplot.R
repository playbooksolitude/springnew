#24-1006

#
library(tidyverse)

#
chickwts |> head()
chickwts |> str()
chickwts |> 
  ggplot(aes(x = feed, y = weight)) +
  geom_boxplot() +
  geom_point(position = position_jitter(.1))

chickwts |> count(feed)

#
plot(mtcars$cyl, mtcars$mpg)
plot(mtcars$disp, mtcars$mpg)
ChickWeight |> head()
plot(ChickWeight$Chick, ChickWeight$weight)
exam(barplot())
example("barplot")
# 막대
qplot(x = drv, data = mpg, geom = "bar")

# 산점도
qplot(x = displ, y = hwy, data = mpg, geom = "point")

# 선 그래프
qplot(x = displ, y = hwy, data = mpg, geom = "line")

# 히스토그램
qplot(x = displ, data = mpg, geom = "histogram")

# 상자그림
qplot(x = cyl, data = mpg, geom = "boxplot")

# 히스토그램
qplot(x = displ, data = mpg, geom = "histogram")

#
pairs(mpg)

#
pairs(mtcars)

#
