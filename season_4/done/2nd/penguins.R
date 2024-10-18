#24-0526 

#
if(!require(palmerpenguins))install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)
library(showtext)
showtext_auto()
library(nord)

# ----
penguins

# palmerpenguins ----
#https://allisonhorst.github.io/palmerpenguins/

# 1 패키지::데이터 ----
palmerpenguins::penguins
penguins |> head()
penguins |> count(year)

# 1-1
str(penguins)
penguins |> str()

#
penguins |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm)) +
  geom_point(size = 3) +
  theme(axis.text = element_text(size = 16),
        axis.title = element_text(size = 18)) +
  labs(title = "x축: 부리 길이, y축: 부리 두께" )

# 2----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(bill_length_mm, bill_depth_mm)) +
  geom_point(size = 3) +
  theme(axis.text = element_text(size = 16),
        axis.title = element_text(size = 18)) +
  geom_smooth(method = "lm", se = F) +
  labs(title = "x축: 부리 길이, y축: 부리 두께" , 
       subtitle = "회귀선")

# 3 species ----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             color = species, 
             shape = species)) +
  geom_point(size = 3) +
  labs(title = "x축: 부리 길이, y축: 부리 두께" , 
       subtitle = "회귀선")

penguins$species |> table()
# Adelie Chinstrap    Gentoo 
# 152        68       124 


## 4 species ----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             color = species, 
             shape = species)) +
  geom_point(size = 3) +
  theme(axis.text = element_text(size = 16),
        axis.title = element_text(size = 18)) +
  geom_smooth(method = "lm", se = F) +
  labs(title = "x축: 부리 길이, y축: 부리 두께" , 
       subtitle = "회귀선")

#
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = flipper_length_mm, fill = species)) +
  geom_histogram(alpha = .7, position = 'identity') +
  #scale_fill_nord(palette = 'aurora') +
  theme_minimal()
  
colorspace::hcl_palettes(plot = T)


# check ----
penguins #344
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm)

penguins |> 
  filter(is.na(bill_length_mm))

# penguins |> 
#   mutate(number = row_number(), .before = 1) -> penguins_2edit


##  sex ----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             color = sex)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

## 3-3 isalnd ----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             color = island)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

## 3-4 year ----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             color = factor(year))) +
  geom_point() +
  geom_smooth(method = "lm", se = F)


# 4 smooth by island  ---- 
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             colour = island)) +
  geom_point()

# 4-1 island ----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             colour = island)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) #--회귀선 

# 5 sex ----
penguins |> 
  drop_na() |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             colour = sex)) +
  geom_point()

# 5-1 sex ----
penguins |> 
  drop_na() |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             colour = sex)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) #--회귀선 



# 6 면분할 ---- 
penguins |> 
  drop_na() |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm, 
             color = species)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) +
  facet_grid(sex~island) +
  theme(legend.position = "top")


#
penguins
?geom_violin

penguins |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm)) +
  geom_violin()

## 7-1 ----
penguins |> 
  drop_na() |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             color = species)) +
  geom_violin() +
  geom_smooth(method = "lm", se = F) +
  facet_grid(.~species) +
  theme(strip.background = element_rect(fill = "red"))

# facet_wrap(.~sex+species)
# facet_wrap(.~sex+species) 

#
library(nycflights23)
flights |> print(n = Inf)
