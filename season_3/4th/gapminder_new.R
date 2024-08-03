#24-0801 thu 09:24

#
library(gapminder)
library(bbplot)

#

multiple_line_df <- gapminder %>%
  filter(country == "China" | country == "United States") 

#Make plot
ggplot(multiple_line_df, aes(x = year, y = lifeExp, colour = country)) +
  geom_line(size = 1) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  scale_colour_manual(values = c("#FAAB18", "#1380A1")) +
  bbc_style() +
  labs(title="Living longer",
       subtitle = "Life expectancy in China and the US") -> multiple_line

multiple_line

gapminder |> 
  filter(country %in% c("Korea, Dem. Rep.", "Japan")) |> #tail()
  ggplot(aes(x = year, y = gdpPercap, color = country)) +
  geom_line(size = 1) +
  bbc_style() +
  scale_color_manual(values = c("#252525", "#1380bb"))
str_detect(gapminder$country, "Korea, Dem. Rep.")
gapminder |> slice(833)


#
gapminder |> 
  filter(country %in% c("Korea, Dem. Rep."))

#
(read_csv("./season_3/5th/gdp_pcap.csv") -> gapminder_1gdp)
(read_csv("./season_3/5th/pop.csv") -> gapminder_1pop)
(read_csv("./season_3/5th/lex.csv") -> gapminder_1life)

#pivot gapminder_2pop_pivot ----
(gapminder_1pop |> 
  pivot_longer(cols = !1, 
               names_to = "year", 
               values_to = "population") |> 
  filter(year %in% c(1951:2022)) -> gapminder_2pop_pivot)
  
# gapminder_1continent ----
(gapminder |> 
  count(country, continent) -> gapminder_1continent)

#
(gapminder_2pop_pivot |> 
  left_join(gapminder_1continent, by = "country") |> 
  select(-n) -> gapminder_3pop_join)

gapminder_3pop_join |> 
  str_trim(side = right, string = population, 1)
  separate(col = population, into = c('population_new'), sep = 'M')

?str_trim
  

gapminder_3pop_join |> 
  ggplot(aes(x = year, y = ))

