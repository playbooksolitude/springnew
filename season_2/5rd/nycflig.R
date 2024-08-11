#24-0803 sat 00:18

#
library(tidyverse)
#install.packages("nycflights23")
library(nycflights23)

#
mpg |> 
  count(class) |> 
  ggplot(aes(x = class)) +
  geom_dotplot(y = 'n')

example("geom_dotplot")

mpg |> 
  ggplot(aes(x = class)) +
  geom_dotplot()

mpg |> 
  ggplot(aes(x = hwy, y = cty)) +
  geom_point(color = "grey") + 
  geom_point(data = mpg |> 
               filter(drv %in% c("f", "r")), 
             mapping = aes(x = displ, y = cty), 
             color = "red") +
  facet_wrap(.~class)
mpg  

#
mpg |> 
  ggplot(aes(x = hwy, y = cty)) +
  geom_point(color = "grey") + 
  geom_point(data = mpg |> 
               filter(drv %in% c('4')), 
             mapping = aes(x = hwy, y = cty, 
                           color = drv)) +
  facet_wrap(.~manufacturer, scales = "free") +
  geom_hline(yintercept = 20, 
             linewidth = .3, 
             linetype = 2) #+
  # geom_vline(xintercept = 25, 
  #            linetype = 2, linewidth = .3) +
  #   coord_cartesian(xlim = c(20:30), ylim = c(15:25))

#
mpg |> 
  filter(cty == '21', hwy == '26') |> 
  print(width = Inf)

#
mpg |> 
  ggplot(aes(x = hwy, y = cty)) +
  geom_point(color = "grey") + 
  geom_point(data = mpg |> 
               filter(drv %in% c('4'),
                      manufacturer %in% c('audi', 
                                          'subaru')), 
             mapping = aes(x = hwy, y = cty, 
                           color = drv)) +
  facet_wrap(.~manufacturer) 

#
starwars |> 
  drop_na(height, mass, sex, species) |> 
  ggplot(aes(x = height, y = mass)) +
  geom_point(color = "grey") +
  geom_point(data = starwars |> 
               drop_na(height, mass, sex, species) |> 
               filter(species %in% c("Human")), 
             aes(x = height, y = mass)) +
  facet_wrap(.~sex)


## 어느 노선이였나?
library(nycflights23)
flights |> 
  count(origin)
flights |> 
  count(dest, origin) 

## 몇월 몇일에 지연이 가장 많았나?
flights
flights |> 
  group_by(month, day) |> 
  reframe(mean_arr_delay = mean(arr_delay, na.rm = T), 
          n = n()) |> 
  ggplot(aes(x = factor(month), 
             y = day |> factor() |> fct_reorder(desc(day)),
             fill = n)) +
  #geom_count(aes(size = mean_arr_delay))
  geom_tile() +
  geom_text(aes(label = n)) +
  scale_fill_gradient(low = "white", high = "red")
  
#어느 노선의 지연빈도가 많은가?
flights |> 
  group_by(dest, origin) |> 
  reframe(mean_arr_delay = mean(arr_delay, na.rm = T), 
          n = n()) |> 
  ggplot(aes(x = origin, 
             y = dest,
             fill = n)) +
  #geom_count(aes(size = mean_arr_delay))
  geom_tile() +
  geom_text(aes(label = n)) +
  scale_fill_gradient(low = "white", high = "red") +
  facet_wrap(.~origin, scales = "free")

# 표
library(gt)
(flights |> 
  #filter(month %in% c("4")) |> 
  group_by(dest, origin, month) |>
  #group_by(dest, origin) |> 
  reframe(mean_arr_delay = mean(arr_delay, na.rm = T), 
          n = n()) |> #dim()
  arrange(desc(mean_arr_delay), desc(n)) |> 
  #gt()
  ggplot(aes(x = mean_arr_delay, y = n)) +
  geom_count(alpha = .3, aes(size = mean_arr_delay)) -> temp_month)


 flights |> 
  #group_by(dest, origin, month) |>
  group_by(dest, origin) |> 
  reframe(mean_arr_delay = mean(arr_delay, na.rm = T), 
          n = n()) |> #dim()
  arrange(desc(mean_arr_delay), desc(n)) |> 
  #gt()
  ggplot(aes(x = mean_arr_delay, y = n)) +
  geom_count(alpha = .3, aes(size = mean_arr_delay)) -> temp_b

temp_month / temp_b

#install.packages('patchwork')
library(patchwork)

temp_month +
  facet_wrap(.~month)

#
temp_a |> 
  fac


# 그래프
flights |> 
  group_by(dest, origin) |> 
  reframe(mean_arr_delay = mean(arr_delay, na.rm = T), 
          n = n()) |> 
  ggplot(aes(x = origin, 
             y = dest,
             fill = n)) +
  #geom_count(aes(size = mean_arr_delay))
  geom_tile() +
  geom_text(aes(label = n)) +
  scale_fill_gradient(low = "white", high = "red") +
  facet_wrap(.~origin, scales = "free")


flights |> 
  count(tailnum)

flights |> 
  filter(month %in% c('1','2', '3')) |> 
  ggplot(aes(x = distance, y = arr_delay)) +
  geom_point(alpha = .3)


