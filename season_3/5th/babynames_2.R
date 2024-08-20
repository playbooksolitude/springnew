#24-0803

#
library(tidyverse)
library(babynames)
babynames::babynames

#
librarians

#

ChickWeight |> 
  str()

airquality
txhousing |> 
  count(year, month) |> 
  pivot_wider(names_from = month, values_from = n)

txhousing
babynames |> 
  count(year) |> tail()

#연도별 남녀수 및 성별 비율
babynames |> 
  group_by(year, sex) |> 
  reframe(sum = sum(n)) |>
  #reframe(sum = sum(n), n = n()) |> 
  pivot_wider(names_from = sex, values_from = sum) |> 
  rowwise() |> 
  mutate(sum = sum(F,M),
    prop_f = F/sum, 
    prop_m = M/sum)

#연도별 성별 글자수
babynames |> 
  #filter(year == 2010) |> 
  mutate(name_char = nchar(name)) |> 
  group_by(year, sex) |> 
  reframe(mean_char = mean(name_char)) |> 
  ggplot(aes(x = year, y = mean_char, color = sex)) +
  geom_point()

#
babynames |> 
  filter(year == 1909) |> with(n) |> sum()

#
babynames::babynames
babynames::lifetables
babynames::applicants
babynames::births
library(fivethirtyeight)
vcdExtra
avengers |> 
  count(name_alias) |> print(n = 200)
avengers |> 
  count(gender, current)
library(vcdExtra)
vcdExtra::Vote1980


#
library(fueleconomy)
fueleconomy::common
fueleconomy::vehicles
?vehicles
vehicles |> 
  count(class, drive) |> print(n = 200)

vehicles |> 
  count(year) |> tail()

vehicles |> 
  count(make) |> print(n = Inf)

vehicles |> 
  filter(make == 'Tesla')

vehicles |> 
  filter(year > 2010) |> 
  ggplot(aes(x = hwy, y = cty)) +
  geom_point() +
  facet_grid(factor(cyl)~fuel)


??Librarians
library(fivethirtyeight)
librarians
