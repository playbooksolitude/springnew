#24-0817

#
#install.packages('ggmosaic')
library(ggmosaic)
library(tidyverse)
#
example(ggmosaic)
?ggmosaic()
example("geom_mosaic")
?geom_mosaic_text

#titanic
ggplot(data = titanic) +
  geom_mosaic(aes(product(Class, Age), fill = Survived)) +
  scale_fill_nord(palette = 'aurora') +
  theme(axis.text = element_blank(), 
        axis.ticks = element_blank())

mpg
library(nord)
ggplot(data = mpg) +
  geom_mosaic(aes(product(drv),fill = class)) +
  #facet_wrap(.~year) +
  scale_fill_nord(palette = 'aurora') +
  geom_mosaic_text(aes(product(class,drv)), size = 4) +
  theme_minimal()

#
library(gapminder)
gapminder |> 
  ggplot() +
  geom_mosaic(mapping = aes(product(continent, year), 
                            fill = continent))

#
starwars |> 
  drop_na(sex, gender) |> 
  ggplot() + 
  geom_mosaic(aes(product(sex, gender), fill = sex))


#
library(nord)

# diamonds ----
diamonds |> 
  ggplot() +
  geom_mosaic(mapping = aes(product(cut, color), 
                            fill = color)) +
  #facet_wrap(.~cut) +
  scale_fill_nord(palette = 'aurora') +
  theme_minimal() +
  theme(legend.position = 'none')

#
diamonds |> 
  ggplot() +
  geom_mosaic(aes(x = product(cut, color), fill = cut)) +
  facet_wrap(.~clarity)


#
library(treemapify)
mpg |> 
  count(manufacturer, sort = T) |>
  ggplot(aes(area = n, 
             fill = manufacturer, 
             subgroup = manufacturer)) +
  geom_treemap() +
  geom_treemap_text(aes(label = n)) +
  geom_treemap_subgroup_text() +
  scale_fill_nord(palette = 'aurora')

mpg |> 
  count(manufacturer, sort = T) |>
  ggplot(aes(x = manufacturer, 
             y = manufacturer,
             fill = n)) +
  geom_tile()

#
mpg |> 
  count(manufacturer) |> 
  filter(manufacturer == 'subaru')

#
mpg |> 
  filter(drv == 'f', 
         class == 'subcompact')

example("geom_mosaic_text")
#


# 데이터 준비
mpg |> 
  count(class, drv) -> temp1

# 모자이크 플롯 생성과 텍스트 레이블 추가
ggplot(data = temp1) + 
  geom_mosaic_text(aes(x = product(class, drv), weight = n, label = n),
                   size = 4, fill = "blue", color = "white") +
  labs(title = "Mosaic Plot of Class vs Drive",
       x = "Class",
       y = "Count") +
  theme_minimal()

  

# 예시 데이터
data(Titanic)
(titanic_data <- as.data.frame(Titanic))

# 모자이크 플롯 생성
ggplot(data = titanic_data) +
  geom_mosaic(aes(weight = Freq, x = product(Class), fill = Survived)) +
  
  # 텍스트 레이블 추가
  geom_text(stat = "mosaic", 
            aes(weight = Freq, x = product(Class), label = Freq), 
            size = 3) +
  
  # 플롯의 제목과 테마 설정
  labs(title = "Titanic Survival by Class", x = "Class", y = "Count") +
  theme_minimal()

# 데이터 준비
titanic_data <- as.data.frame(Titanic)

ggplot(data = titanic_data) +
  geom_mosaic(aes(weight = Freq, x = product(Class), fill = Survived)) +
  
  # 텍스트 레이블 추가
  geom_text(stat = "mosaic", 
            aes(weight = Freq, x = product(Class), label = Freq), 
            position = position_mosaic(center = TRUE),
            size = 3) +
  
  labs(title = "Titanic Survival by Class", x = "Class", y = "Count") +
  theme_minimal()

