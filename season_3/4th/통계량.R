#24-0729 mon 10:38

#
library(tidyverse)
install.packages('gapminder')
library(gapminder)
library(ggrepel)
library(gt)
data()
lakers |> glimpse()
lakers

# band_instruments              Band membership
# band_instruments2             Band membership
# band_members                  Band membership
# starwars                      Starwars characters
# storms                        Storm tracks data

#
example("geom_point")
example("mtcars")

pairs(mpg)
pairs(mtcars)
diamonds |> pairs()
mpg
pairs(mpg)
mpg
example("pairs")

#
gapminder::country_colors
gapminder
gapminder::continent_colors
gapminder |> 
  ggplot(aes(x = continent, y = after_stat(count))) +
  geom_bar(stat = "count")


#identity, stack, 
diamonds |> 
  count(cut,color,clarity) |> 
  ggplot(aes(x = cut, y = n, fill = color)) +
  #geom_bar(stat = "identity", position = "dodge") +
  geom_bar(stat = "identity", position = "identity") 
  #scale_x_discrete(limits = c("Good","Ideal","Fair", "Premium", "Very Good"))
  #scale_x_discrete(limits = c("Good","Ideal","Fair", "Premium", "Very Good"))
  



  scale_x_discrete(limits = c("D", "I", "J", "E", "F", "H", "G"))
  ?scale_x_discrete
  
levels(diamonds$color)
diamonds |> 
relevel(color, c("D", "I", "J", "E", "F", "H", "G"))
exp(relevel())
?relevel
warpbreaks

(lm(diamonds$x ~ diamonds$y) |> summary() -> temp_diamonds)
temp_diamonds

#
diamonds -> diamonds2
lm(diamonds2$x ~ diamonds$y) -> diamonds2_model

#
diamonds2 |> 
  ggplot(aes(x = x, y = y)) +
  geom_point()

summary(diamonds2_model)

#
(mpg |> 
  group_by(manufacturer, model) |> 
  reframe(mean_cty = mean(cty), 
          mean_hwy = mean(hwy)) |> 
  mutate(num = row_number(), .before = 1) -> temp1)

temp1


#도시 연비를 예측변수로 고속도로 연비를 예측하는 회귀모델
(lm(temp1$mean_hwy ~ temp1$mean_cty) -> temp2.model)

#통계량
summary(temp2.model)
temp2.model


#통계량을 보기 좋게 dataset에 추가하기
(fitted(temp2.model) -> temp1$predicted)   #기울기의 fit point
(resid(temp2.model) -> temp1$resid)        #잔차 (관측값과 기울기의 차이)
(rstandard(temp2.model) -> temp1$standard) #표준화잔차
(rstudent(temp2.model) -> temp1$student)   #스튜던트 잔차

#
temp1 |> 
  ggplot(aes(x = mean_cty, y = mean_hwy)) +
  #geom_point(alpha = .3, color = "red") + 
  geom_smooth(method = "lm", se = F) +
  geom_text(aes(label = round(predicted,1))) +
  geom_text_repel(aes(y = 12, label = num))

#
temp1$resid |> min()
temp1$resid |> max()

#
diamonds |> 
  ggplot(aes(x = cut, y = x)) +
  geom_boxplot()


#

(mpg |> 
    group_by(manufacturer, model, cyl) |> 
    reframe(mean_cty = mean(cty), 
            mean_hwy = mean(hwy), 
            n = n()) |> 
    mutate(num = row_number(), .before = 1) -> temp1)

temp1


#도시 연비를 예측변수로 고속도로 연비를 예측하는 회귀모델
(lm(temp1$mean_hwy ~ temp1$mean_cty) -> temp2.model)

#통계량
summary(temp2.model)
temp2.model


#통계량을 보기 좋게 dataset에 추가하기
(fitted(temp2.model) -> temp1$predicted)   #기울기의 fit point
(resid(temp2.model) -> temp1$resid)        #잔차 (관측값과 기울기의 차이)
(rstandard(temp2.model) -> temp1$standard) #표준화잔차
(rstudent(temp2.model) -> temp1$student)   #스튜던트 잔차

#
temp1 |> 
  ggplot(aes(x = mean_cty, y = mean_hwy)) +
  #geom_point(alpha = .3, color = "red") + 
  geom_smooth(method = "lm", se = F) +
  geom_text(aes(label = round(predicted,1))) +
  geom_text_repel(aes(y = 12, label = num))

#
colSums((is.na(starwars))) |> 
  as_tibble_row() 

#

