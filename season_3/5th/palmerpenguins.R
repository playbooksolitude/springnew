#24-0731 wedn 

#
library(palmerpenguins)
library(patchwork)

palmerpenguins::penguins_raw
palmerpenguins::penguins

# species by ----
(penguins |> 
  drop_na(flipper_length_mm, body_mass_g, sex, island) |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  facet_grid(island~sex) +
  geom_smooth(se = F, method = "lm") +
  ggtitle(label = "species_all") -> species_all)

#
(penguins |> 
  drop_na(flipper_length_mm, body_mass_g, sex, island) |> 
  #filter(year == '2007') |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  facet_grid(island~sex) +
  geom_smooth(se = F, method = "lm") +
  ggtitle(label = "species_by") -> species_by)

species_all / species_by

# Adelie ----
(penguins |> 
  drop_na(species, flipper_length_mm, body_mass_g, sex, island) |> 
  filter(species %in% c('Adelie')) |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g, color = factor(year))) +
  geom_point() +
  geom_smooth(se = F, method = "lm") +
  facet_grid(sex~island) + 
  ggtitle(label = "yearly") -> Adelie_yearly)

(penguins |> 
  drop_na(species, flipper_length_mm, body_mass_g, sex, island) |> 
  filter(species %in% c('Adelie')) |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth(se = F, method = "lm") +
  facet_grid(sex~island) + 
  ggtitle(label = "All") -> Adelie_allyear)

Adelie_yearly / Adelie_allyear

# 연도별 비교 ----
(penguins |> 
  drop_na(species, flipper_length_mm, body_mass_g, sex, island) |> 
  filter(species %in% c('Adelie'),
         year %in% c("2007")) |> #44
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth(se = F, method = "lm") +
  facet_grid(sex~island) + 
  ggtitle(label = "2007") -> Adelie_2007year)

#
(penguins |> 
  drop_na(species, flipper_length_mm, body_mass_g, sex, island) |> 
  filter(species %in% c('Adelie'),
         year %in% c("2008")) |> #50
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth(se = F, method = "lm") +
  facet_grid(sex~island) + 
  ggtitle(label = "2008") -> Adelie_2008year)

#
(penguins |> 
  drop_na(species, flipper_length_mm, body_mass_g, sex, island) |> 
  filter(species %in% c('Adelie'),
         year %in% c("2009")) |> #52
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth(se = F, method = "lm") +
  facet_grid(sex~island) + 
  ggtitle(label = "2009") -> Adelie_2009year)

Adelie_2007year / Adelie_2008year / Adelie_2009year

# 회귀계수 ----
penguins |> 
  drop_na(species, flipper_length_mm, body_mass_g, sex, island) |> 
  filter(species %in% c('Adelie'),
         year %in% c("2007")) -> Adelie_2007_cor
cor(Adelie_2007_cor$flipper_length_mm, Adelie_2007_cor$body_mass_g) #0.44
#sqrt(cor(Adelie_2007_cor$flipper_length_mm, Adelie_2007_cor$body_mass_g)) #0.66
lm(Adelie_2007_cor$flipper_length_mm ~ Adelie_2007_cor$body_mass_g) |> 
  summary() #R-squared : 0.1966

penguins |> 
  drop_na(species, flipper_length_mm, body_mass_g, sex, island) |> 
  filter(species %in% c('Adelie'),
         year %in% c("2008")) -> Adelie_2008_cor
cor(Adelie_2008_cor$flipper_length_mm, Adelie_2008_cor$body_mass_g) #0.57
#sqrt(cor(Adelie_2008_cor$flipper_length_mm, Adelie_2008_cor$body_mass_g)) #0.75
lm(Adelie_2008_cor$flipper_length_mm ~ Adelie_2008_cor$body_mass_g) |> 
  summary() #0.3297

penguins |> 
  drop_na(species, flipper_length_mm, body_mass_g, sex, island) |> 
  filter(species %in% c('Adelie'),
         year %in% c("2009")) -> Adelie_2009_cor
cor(Adelie_2009_cor$flipper_length_mm, Adelie_2009_cor$body_mass_g) #0.50.5
#sqrt(cor(Adelie_2009_cor$flipper_length_mm, Adelie_2009_cor$body_mass_g)) #0.71
lm(Adelie_2009_cor$flipper_length_mm ~ Adelie_2009_cor$body_mass_g) |> 
  summary() #0.2558


# summary ----
lm(Adelie_2009_cor$flipper_length_mm ~ Adelie_2009_cor$body_mass_g) |> 
  summary()

#2007 ~ 2008 ----
(penguins |> 
  drop_na(species, flipper_length_mm, body_mass_g, sex, island) |> 
  filter(species %in% c('Adelie'),
         year %in% c("2007", "2008")) |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth(se = F, method = "lm") +
  facet_grid(sex~island) + 
  ggtitle(label = "2007~2008") -> Adelie_2008_2009year)


(Adelie_2008year / Adelie_yearly / Adelie_allyear)

# 연습 ----
penguins |> 
  drop_na(flipper_length_mm, body_mass_g, sex, island) |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  #geom_point() +
  geom_path() +
  #geom_line() +
  facet_grid(island~sex) +
  #geom_smooth(se = F, method = "lm") +
  ggtitle(label = "species_all")


#
