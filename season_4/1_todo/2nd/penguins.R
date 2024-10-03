#24-0526 

#
if(!require(palmerpenguins))install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)

# ----
penguins

# palmerpenguins ----
#https://allisonhorst.github.io/palmerpenguins/

# 1 패키지::데이터 ----
palmerpenguins::penguins
penguins

# 1-1
str(penguins)
penguins |> str()

#
penguins |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm)) +
  geom_point() 



#
penguins #344
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm)

penguins |> 
  filter(is.na(bill_length_mm))

# penguins |> 
#   mutate(number = row_number(), .before = 1) -> penguins_2edit

# 2----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(bill_length_mm, bill_depth_mm)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) # -- 회귀선 (추세선))

# 3 species ----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             color = species)) +
  geom_point()


## 3-1 species ----
penguins |> 
  drop_na(bill_length_mm, bill_depth_mm) |> 
  ggplot(aes(x = bill_length_mm, 
             y = bill_depth_mm,
             color = species)) +
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

bbc_style

geom_
