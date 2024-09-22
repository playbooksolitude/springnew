# 패키지 다운로드와 실행

#tidyverse 설치
#install.packages('tidyverse')

#tidyverse 실행
library(tidyverse)


#
#install.packages('ggplot2')
library(ggplot2)

#install.packages('babynaems')
library(babynames)
babynames


#install.packages('gapminder')
library(gapminder)
gapminder

barplot(table(mtcars$cyl))

ggplot(data = mtcars, 
       mapping = aes(x = factor(cyl))) +
  geom_bar()

#
babynames |> 
  count(year, sex) 
  ggplot(aes(x = year, fill = sex)) +
  geom_histogram()

example("babynames")

#
babynames |> 
  count(year, sex) |> 
  ggplot(aes(x = year, y = n)) +
  geom_line()
  geom_path()

  
#
colors()
  