#24-0916 mon 

#
if(!require(pacman))install.packages("pacman")
#install.packages('pacman')
pacman::p_load('dplyr', 'ggplot2', 'showtext', 
               'patchwork', 'ggmosaic')
showtext_auto()


#
ChickWeight |> head()
ChickWeight |> str()
ChickWeight |> glimpse()

ChickWeight |> 
  ggplot() +
  geom_mosaic(aes(product(Chick, Diet), fill = Diet))

# 전체 plot ----
## 일반 ----
(ChickWeight |> 
  ggplot(aes(x = Time, 
                        y = weight, color = factor(Diet))) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE) +
  labs(title = "병아리 체중 변화 실험", 
       x = "Time (days)", 
       y = "Weight (grams)", 
       color = "Diet") -> plot_chik1)

##면분할 ----
(ggplot(ChickWeight, aes(x = Time, 
                        y = weight, color = factor(Diet))) +
  geom_point() +
  labs(title = '전체') +
  geom_smooth(method = "loess", se = FALSE) +
  facet_wrap(.~Diet) -> plot_facet_chik1)

### boxplot Chick----
ChickWeight |> #head()
  #filter(!Chick %in% c(18,16,15,44,8)) |> 
  ggplot(aes(x = Chick, y = weight)) +
  geom_boxplot(outlier.color = 'tomato2') +
  geom_point()

### boxplot Diet ----
ChickWeight |> #head()
  #filter(!Chick %in% c(18,16,15,44,8)) |> 
  ggplot(aes(x = Diet, y = weight)) +
  geom_boxplot(outlier.color = 'tomato2') +
  geom_point()


# 개체수 ----
ChickWeight |> count(Diet)
ChickWeight |> 
  group_by(Chick, Diet) |> 
  reframe(n = n()) |>  #개체수가 서로 다름
  arrange(n) |> 
  print(n = 50) #Chick 18,16,15,44,8

ChickWeight |> 
  filter(Chick %in% c(18,1))

ChickWeight |> head(60)

# 21일 미만 제거 ----
## plot----
(ChickWeight |> 
  filter(!Chick %in% c(18,16,15,44,8)) |> 
  ggplot(aes(x = Time, 
                        y = weight, color = factor(Diet))) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE) +
  labs(title = "병아리 체중 변화 실험", 
       x = "Time (days)", 
       y = "Weight (grams)", 
       color = "Diet") -> plot_chik2)

## 면분할 ----
(ChickWeight |> 
  filter(!Chick %in% c(18,16,15,44,8)) |> 
  ggplot(aes(x = Time, 
                        y = weight, color = factor(Diet))) +
  geom_point() +
  labs(title = "21일 제거") +
  geom_smooth(method = "loess", se = FALSE) +
  facet_wrap(.~Diet) -> plot_facet_chik2)

# patchwork ----
plot_chik1 / plot_chik2
plot_facet_chik1 / plot_facet_chik2


# boxpot plot ----
ChickWeight |> head()
ChickWeight |> filter(Chick == 24)
ChickWeight |> #head()
  #filter(!Chick %in% c(18,16,15,44,8)) |> 
  ggplot(aes(x = Chick, y = weight)) +
  geom_boxplot(outlier.color = 'tomato2') +
  geom_point() +
  facet_wrap(.~Diet, scales = 'free_x')



# ----
ChickWeight$Chick |> as.integer()
ChickWeight |> 
  count(Chick) |> 
  tibble() |> 
  arrange(Chick)

ChickWeight |> 
  mutate(num = as.integer(ChickWeight$Chick))

plot(ChickWeight$weight, ChickWeight$Diet)

# t.test ----
?t.test()
# t.test(x, y = NULL,
#   alternative = c("two.sided", "less", "greater"),
#   mu = 0, paired = FALSE, var.equal = FALSE,
#   conf.level = 0.95, ...)

#
## Formula interface
sleep
sleep |> str()
t.test(extra ~ group, data = sleep)

#t.test(weight ~ Diet, data = ChickWeight)
## Formula interface to one-sample test ----
t.test(extra ~ 1, data = sleep)

## t.test paired ----
## Formula interface to paired test
## The sleep data are actually paired, so could have been in wide format:
sleep
(sleep2 <- reshape(sleep, direction = "wide", 
                   idvar = "ID", timevar = "group"))
t.test(Pair(extra.1, extra.2) ~ 1, data = sleep2)
sleep2
sleep |> 
  pivot_wider(names_from = group, values_from = extra)

# ----
extra
plot(extra ~ group, data = sleep)
with(sleep, t.test(extra[group == 1], extra[group == 2]))
str(sleep)

#
sleep2
ChickWeight |> head()
ChickWeight |> 
  pivot_wider(names_from = Chick, values_from = weight)

# Time == 21인 데이터만 필터링
(chick_21 <- ChickWeight[ChickWeight$Time == 21, ])

# Diet 1과 Diet 2 그룹으로 나누기
(diet1 <- chick_21[chick_21$Diet == 1, "weight"])
(diet2 <- chick_21[chick_21$Diet == 2, "weight"])

# 두 그룹 간의 t-test 수행 ----
t.test(diet1, diet2)
ChickWeight |> 
  filter(Diet %in% c(1,2)) -> temp1

temp1 |> head()
t.test(weight ~ Diet, data = temp1)


#
#
(ChickWeight |> 
    filter(Diet %in% c(1,2)) -> ChickWeight_edit12)

#
ChickWeight_edit12 |> head()
t.test(data = ChickWeight_edit12, weight ~ Diet)


t.test(ChickWeight$weight, ChickWeight$Diet)
ChickWeight |> head() |> str()
sleep |> str()
?t.test































