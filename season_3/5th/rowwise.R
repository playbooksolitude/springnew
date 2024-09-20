#24-0802 

library(tibble)
library(dplyr)
library(ggplot2)
library(ggplot2movies)

movies |> 
  slice(1:100) |> 
  rowwise() |> 
  mutate(sum = sum(c_across(r1:r10)), .before = 1)


(data <- tibble(
  name = c("Alice", "Bob", "Charlie"),
  score1 = c(85, 92, 88),
  score2 = c(90, 85, 91)))

# rowwise를 사용하여 각 행에 대해 계산 수행
(data2 <- data %>% 
  rowwise() %>% 
  mutate(mean_score = mean(c(score1, score2))))

(data3 <- data %>% 
    #  rowwise() %>% 
    mutate(mean_score = mean(c(score1, score2))))

(data4 <- data %>% 
    rowwise() |> 
    mutate(mean_score = mean(c(score1, score2))))


print(data)
(85+90)/2
(85+92+88)/3
(90+85+91)/3
(85+92+88+90+85+91)/6

mtcars |> distinct(gear)
mtcars |> count(gear)
mpg |> 
  distinct(manufacturer, model)
mpg |> count(manufacturer)
mpg |> 
  add_row(list(1:11))


cars |> 
  add_row(speed = 1, dist = 1)
mpg |> 
  add_row(manufacturer = 'c') |> tail()
mtcars |> pull(wt, hp)
mtcars
mtcars$wt

(df <- tibble(x_1 = c(1, 2), x_2 = c(3, 4), y = c(4, 5)))
df |> 
  summarize(across(everything(), mean))


#
starwars |>
  mutate(type = case_when(
    height > 200 | mass > 200 ~ "large",
    species == "Droid" ~ "robot",
    TRUE ~ "other"))
?case_when

starwars |> 
  ggplot(aes(x = sex, y = after_stat(count))) +
  #geom_bar() +
  geom_point(stat = "count") +
  geom_label(aes(label = after_stat(count)), 
    stat = "count", position = "nudge")

#
mpg |> 
  count(drv, class) |> 
  ggplot(aes(x = class)) +
  geom_dotplot()
?geom_dotplot
example("geom_dotplot")
