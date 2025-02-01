#24-1004 

#install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
install.packages("writexl")
library(writexl)


#데이터셋 확인
ggplot2::mpg
data("mpg") #기본 데이터셋을 초기화
mpg

#가로(한줄, 한줄) = 행 = row     = 관측값
#세로(한열, 한열) = 열 = column  = 변수

#
view(mpg)
mpg |> view()

# 파생변수 
(mpg$cty + mpg$hwy)/2 -> mpg$total 
mpg

# 컬럼의 이름을 변경하고 싶어요 rename()
rename()
#new
mpg |> 
  rename(new = total)

mpg |> 
  rename(new = total) -> mpg

mpg
# mpg |> 
#   rename(new = total2)

#data() 메모를 남기는 용도 주석

# 엑셀 파일 출력
mpg |> 
  write_xlsx("./season_4/InProgress/mpg.xlsx")

#내장 데이터 보기
data()

#데이터셋 초기화
data(mpg)
mpg

# 변수 선택 후 삭제 #8행 6열
mpg[8:10,7] <- NA
mpg
mpg[8:10,7] <- NA

mpg[8,7] = NA
mpg[,1] <- NULL
mpg
mpg[,3] <- NULL

mpg$total <- NULL
mpg



#지우기
mpg$year <- NULL
NULL -> mpg$cyl
NULL -> mpg$drv
mpg

#
mpg
mpg[1,2] <- NA
mpg
mpg[1,3]

###
mpg$test <- ifelse(mpg$total > 20, 'pass', 'false')
mpg

#
barplot(test, data = mpg)
qplot(mpg$test)
barplot()

# iris
data()
head(iris)

#
iris |> 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, 
    color = Species)) +
  geom_point()

#
?barplot
data.frame(mpg) |> barplot(test)

# 초기화
data(mpg)
mpg

#
3+4 -> a
a+a

3+4 -> a
a <- 3+4
d = 3+4


# 1 qplot
mpg$fl
qplot(mpg$fl) #qplot을 활용해서 만든 막대그래프
qplot(mpg$drv)

# 2 barplot()

mpg$fl                 #낱개 하나하나
table(mpg$fl)          #표로 만들기
barplot(table(mpg$fl)) #표를 이용해서 막대 그래프 만들기

# 3 geom_bar()
geom_bar()
ggplot(data = mpg) +
  geom_bar(aes(x = fl, y = after_stat(count))) +
  geom_label(aes(
    x = fl, 
    y = after_stat(count), 
    label = after_stat(count)), 
    stat = 'count')

#
qplot(mpg$drv)
qplot(mpg$displ, mpg$cyl)
plot(mpg$displ, mpg$cyl)
plot(mpg$cyl)

#
barplot(mpg$drv)
barplot(table(mpg$drv))

#
qplot(mtcars$cyl)
qplot(mpg$manufacturer)
hist(mpg$hwy)

#
plot(mtcars$mpg, mtcars$wt, main = "MPG vs Weight", 
  xlab = "MPG", ylab = "Weight", type = "p")

#
plot(mtcars$cyl, mpg$cyl)
mtcars |> names()
mpg |> names()

mtcars
table

table(mtcars$cyl)
barplot(table(mtcars$cyl))

