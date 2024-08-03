#24-0730 12:13


library(tidyverse)
library(patchwork)
#
storms |> glimpse()
storms |> str()

#
storms |> 
  count(name, year)

storms |> count(name)
storms$name |> table() |> data.frame()
storms$name |> n_distinct()
storms |> count(year) 
storms
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
