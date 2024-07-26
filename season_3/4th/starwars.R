#24-0725 thu 

#
install.packages("foreign")
library(foreign)
library(tidyverse)
library(readxl)
library(ggrepel)
#

#
starwars |> 
  write_csv("./season_3/4th/starwras.csv")
starwars |> 
  write_excel_csv()

starwars |> 
  write_excel_csv("./season_3/4th/starwars.xlsx")

starwars
table(starwars$birth_year, useNA = "always")

read.spss("./season_3/4th/Koweps_hpc10_2015_beta1.sav") -> raw_welfare
raw_welfare |> str()
table(raw_welfare$h10_g3)

#diamonds
diamonds |> 
  ggplot() +
  geom_point(aes(x = x, y = y), color = "red", alpha = .5) +
  geom_point(aes(x = x, y = z), color = "blue", alpha = .5) +
  facet_grid(cut~color)

#
diamonds
starwars
#
starwars |> 
  count(skin_color) |> print(n = Inf)
starwars |> 
  count(sex, species) |> 
  pivot_wider(names_from = sex, values_from = n) |> 
  arrange(desc(male))

#starwars 
starwars |> 
  group_by(species, sex) |> 
  reframe(mean_mass = mean(mass, na.rm = T), 
          mean_height = mean(height, na.rm = T),
          n = n()) |> 
  drop_na(mean_mass, mean_height, species) |> 
  ggplot(aes(x = mean_mass, y = mean_height)) +
  geom_point() +
  geom_text_repel(aes(label = species, color = sex)) +
  facet_wrap(.~sex) +
  ggtitle(label = "starwars mean mass/height")

#
starwars |> 
  drop_na(mass, height, species, sex) |> 
  ggplot(aes(x = mass, y = height)) +
  geom_point() +
  geom_text_repel(aes(label = species))

#
diamonds |> 
  ggplot() +
  geom_point(aes(x = depth, y = table), alpha = .5) +
  #geom_point(aes(x = depth, y = price)) +
  facet_grid(cut~color)

#
data()

#gss_cat
gss_cat |> 
  summary()

#world bank
install.packages("showtext")
library(showtext)
showtext_auto()

#
world_bank_pop |> 
  filter(country %in% c("KOR"), 
         indicator %in% c("SP.POP.TOTL", "SP.URB.TOTL")) |> 
  pivot_longer(cols = c(`2000`:`2017`), 
               names_to = "year", values_to = "pop") |> #print(n = Inf)
  ggplot(aes(x = year, y = pop/1000000)) +
  geom_bar(stat = "identity", 
           position = "stack",
           aes(fill = indicator)) + 
  geom_text(aes(label = scales::comma(pop/1000000)), 
            position = position_stack(.5), stat = "identity") +
  ggtitle(label = '대한민국 인구', subtitle = "단위 : 백만명") +
  labs(y = '인구') +
  theme(legend.position = "none")

#
world_bank_pop |> glimpse()
world_bank_pop$indicator |> factor() -> world_bank_pop$indicator
contrasts(world_bank_pop$indicator)
relevel(x = world_bank_pop$indicator, ref = "SP.URB.TOTL") -> world_bank_pop$indicator


#
?world_bank_pop
world_bank_pop |> 
  pivot_longer(cols = c(`2000`:`2017`), 
               names_to = "year", values_to = "pop") 
