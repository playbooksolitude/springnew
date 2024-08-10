#24-0805 mon 08:33

#
library(tidyverse)
library(babynames)
library(bbplot)

# 국가: 미국
# 연도 범위: 1880년부터 현재까지

#1 연도별로 태어난 아이의 수를 구하시오 ---- 
## group_by()
## 아이의 수 컬럼명 sum_n = sum(n)
babynames |> 
  group_by(year) |> 
  reframe(sum_n = sum(n))

#1-1 1884에 태어난 아이의 수는 몇명인가? ----


#2 연도별로 태어난 아이의 수를 
# 성별을 구분해 'baby_1groupby'라는 이름의 변수에 저장하시오 ----
## group_by()
(babynames |> 
  group_by(year, sex) |> 
  reframe(sum = sum(n)) -> baby_1groupby)

#2-1 1884년에 태어난 남자아이와 여자아이의 수는 몇명인가? ----


#3 
factor(baby_1groupby$sex) |> 
  fct_relevel(c('M', 'F')) -> baby_1groupby$sex

baby_1groupby |> 
  ggplot(aes(x = year, y = sum)) +
  geom_line(aes(color = sex)) +
  geom_area(alpha = .5, position = 'identity', aes(fill = sex)) +
  bbc_style() +
  ggtitle(label = 'USA Babynames') +
  scale_y_continuous(labels = scales::comma) 

# ----
baby_1groupby |> 
  ggplot(aes(x = year, y = sum)) +
  #geom_bar(stat = 'identity')
  geom_line(aes(color = factor(sex,levels = c('F', 'M')), 
                fill = factor(sex,levels = c('F', 'M')))) +
  geom_area(alpha = 1, position = 'identity', 
            aes(fill = factor(sex,levels = c('F', 'M')))) +
  bbc_style() +
  ggtitle(label = 'USA Babynames') +
  scale_y_continuous(labels = scales::comma) +
  scale_fill_manual(values = c('M' = 'lightblue',
                               'F' = 'lightpink')) +
  scale_color_manual(values = c('M' = 'lightblue',
                                'F' = 'lightpink'))

?relevel()

#female 순서 변경----
baby_1groupby |> 
  ggplot(aes(x = year, y = sum)) +
  #geom_bar(stat = 'identity')
  geom_line(aes(color = factor(sex,levels = c('M', 'F')), 
                fill = factor(sex,levels = c('M', 'F')))) +
  geom_area(alpha = .5, position = 'identity',
            aes(fill = factor(sex,levels = c('M', 'F')))) +
  bbc_style() +
  ggtitle(label = 'USA Babynames') +
  scale_y_continuous(labels = scales::comma) +
  scale_fill_manual(values = c('M' = 'lightblue',
                               'F' = 'lightpink')) +
  scale_color_manual(values = c('M' = 'lightblue',
                               'F' = 'lightpink'))

?geom_area()
baby_1groupby |> 
  ggplot(aes(x = year, y = sum)) +
  #geom_bar(stat = 'identity')
  geom_line(aes(color = factor(sex,levels = c('F', 'M')), 
                fill = factor(sex,levels = c('F', 'M')))) +
  geom_area(alpha = .5, position = 'identity', 
            aes(fill = factor(sex,levels = c('F', 'M')))) +
  bbc_style() +
  ggtitle(label = 'USA Babynames') +
  scale_y_continuous(labels = scales::comma)


?babynames
  #pivot_wider(names_from = sex, values_from = sum) |> 
  # ggplot(aes(x = sex, y = year, fill = sum)) +
  # geom_tile() +
  # geom_text(aes(label = sum))

#
babynames::applicants
babynames::babynames
babynames::births
babynames::lifetables

#
babynames |> str()
babynames |> 
  filter(is.na(year))

starwars |> 
  is.na() |> 
  colSums() |> 
  data.frame() |> 
  rownames_to_column('starwars')

colSums(is.na(starwars)) |> 
  as.data.frame() |> 
  as_tibble(rownames = "col")

is.na(babynames) |> sum()


huron <- data.frame(year = 1875:1972, level = as.vector(LakeHuron))
h <- ggplot(huron, aes(year))

h + geom_ribbon(aes(ymin=0, ymax=level))
