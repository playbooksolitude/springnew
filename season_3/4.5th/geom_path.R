#24-0730 12:13


library(tidyverse)
library(patchwork)

# ggplot2 패키지 로드
library(ggplot2)

# geom_path()는 데이터의 순서를 유지하면서 선을 그립니다.
# geom_line()은 x축 값에 따라 데이터를 정렬한 후 선을 그립니다.

# 데이터 프레임 생성
(data <- tibble(
  x = c(1, 2, 3, 4, 5, 4, 3, 2, 1),
  y = c(1, 2, 1, 2, 1, 0, 1, 0, 1)))

# ggplot을 사용하여 geom_path()로 선 그리기
(ggplot(data, aes(x = x, y = y)) +
  geom_path() +
  ggtitle("Example of geom_path()") +
  xlab("X axis") +
  ylab("Y axis") -> temp_p)

(ggplot(data, aes(x = x, y = y)) +
  geom_line() +
  ggtitle("Example of geom_line()") +
  xlab("X axis") +
  ylab("Y axis") -> temp_l)

library(patchwork)
temp_p / temp_l

data |> 
  count(x, y)

tibble(
  x = c(1, 2, 3, 4, 5, 4, 3, 2, 1),
  y = c(0.9, 1, 0, 2, 1, 1, 1.5, 1.5, 1.1)
) -> dt

(ggplot(dt, aes(x = x, y = y)) +
    geom_path() +
    ggtitle("Example of geom_path()") +
    xlab("X axis") +
    ylab("Y axis") -> temp_p1)

(ggplot(dt, aes(x = x, y = y)) +
    geom_line() +
    ggtitle("Example of geom_line()") +
    xlab("X axis") +
    ylab("Y axis") -> temp_t1)


#
storms |> glimpse()
storms |> str()

# 데이터 프레임 생성
data <- data.frame(
  x = c(1, 2, 3, 4, 5, 4, 3, 2, 1),
  y = c(1, 2, 1, 2, 1, 0, 1, 0, 1))

# ggplot을 사용하여 geom_path()로 선 그리기
ggplot(data, aes(x = x, y = y)) +
  geom_path() +
  ggtitle("Example of geom_path()") +
  xlab("X axis") +
  ylab("Y axis")


# 데이터 프레임 생성
data <- data.frame(
  x = c(1, 3, 2, 5, 4),
  y = c(1, 2, 1, 2, 1))

# ggplot을 사용하여 geom_line()으로 선 그리기
ggplot(data, aes(x = x, y = y)) +
  geom_path() +
  ggtitle("Example of geom_path()") +
  xlab("X axis") +
  ylab("Y axis") 

ggplot(data, aes(x = x, y = y)) +
  geom_line() +
  ggtitle("Example of geom_line()") +
  xlab("X axis") +
  ylab("Y axis")

# 이 예제에서는 x값이 1, 3, 2, 5, 4 순서로 주어졌지만, 
#geom_line()은 x값을 오름차순으로 정렬한 후 1, 2, 3, 4, 5 순서로 y값을 연결 
#따라서 x값이 증가하는 방향으로 선이 그려집니다.

#응용 geom_line 
#data2,data3 geom_line 바꿔보면 이해됨
data2 <- data.frame(
  x = c(1, 3, 2, 5, 4, 2, 4),
  y = c(1, 2, 1, 2, 1, 3, 0))

data3 <- data.frame(
  x = c(1, 3, 2, 5, 4, 2, 4),
  y = c(1, 2, 1, 2, 0, 3, 1))

# ggplot을 사용하여 geom_line()으로 선 그리기
ggplot(data2, aes(x = x, y = y)) +
  geom_line() +
  ggtitle("Example of geom_path()") +
  xlab("X axis") +
  ylab("Y axis") 

ggplot(data3, aes(x = x, y = y)) +
  geom_line() +
  ggtitle("Example of geom_line()") +
  xlab("X axis") +
  ylab("Y axis")

ggplot(data3, aes(x = x, y = y)) +
  geom_path() 
# ----


#
storms |> 
  count(name, year)

storms |> count(name)
storms$name |> table() |> data.frame()
storms$name |> n_distinct()
storms |> count(year) 
?storms

# geom_path year ----
storms %>%
  filter(year >= 2000) %>%
  ggplot(aes(long, lat, color = paste(year, name))) -> q

q + geom_path(show.legend = FALSE) + 
  ggtitle("path") +
  facet_wrap(~year)


q + geom_path(show.legend = FALSE) + 
  ggtitle("path") +
  facet_wrap(~month)


# path vs line ----
storms %>%
  filter(year >= 2000) %>%
  ggplot(aes(long, lat, color = paste(year, name))) -> q

#
  (q + geom_path(show.legend = FALSE) + 
    ggtitle("path") +
    facet_wrap(~year)) / 
  (q + geom_line(show.legend = FALSE) + 
     ggtitle("line") +
     facet_wrap(~year))


## month
storms |> count(year)
storms %>%
  filter(year >= 2001, year <= 2020) %>%
  ggplot(aes(long, lat, color = paste(month, name))) -> p2001

storms %>%
  filter(year >= 1981, year <= 2000) %>%
  ggplot(aes(long, lat, color = paste(month, name))) -> p1981


#
(p1981 + geom_path(show.legend = FALSE) + 
    ggtitle("1981~2000") +
    facet_wrap(~month)) / 
(p2001 + geom_path(show.legend = FALSE) + 
    ggtitle("2001~2020") +
    facet_wrap(~month))


#check
storms |> 
  filter(year >= 1981, year <= 2000) |> 
  count(month)



#
str(mtcars)
mtcars |> 
  as_tibble(rownames = "group") |> 
  mutate_at(vars(-group), rescale)

?across

iris |> head(20)
iris |> 
  mutate(across(1:Sepal.Length, round)) |> head(20)
?across
rnorm(1)
tibble(g = c(1,1,2,3), v1 = 10:13, v2 = 20:23) |> 
  group_by(g) -> gdf
set.seed(1)
rnorm(1) -> n
n
gdf 
gdf |> 
  mutate(across(v1:v2, ~ .x + n))

#
diamonds |> 
  group_by(cut, color, clarity) |> 
  reframe(mean_carat = mean(carat))

#
starwars |> 
  filter(species == "Droid")
starwars |> 
  count(species) |> print(n = Inf)


