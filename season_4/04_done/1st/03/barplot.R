# 24-0824 sat 09:46 

# dataset 조회
data()
mtcars

# table
table(mtcars$cyl) -> mtcars_cyl
mtcars_cyl

#
barplot(mtcars_cyl)

# barplot blue color
barplot(mtcars_cyl, main = "cyl of mtcars", 
        xlab = "Number of Cyl",
        ylab = "Frequency",
        col = "blue")
  
#
barplot(mtcars_cyl, 
        main = "cyl of mtcars", 
        xlab = "Number of Cyl",
        ylab = "Frequency",
        col = "skyblue")


#
library(ggplot2)
library(gganimate)

ggplot(mtcars, aes(factor(cyl), mpg)) + 
  geom_boxplot() + 
  # Here comes the gganimate code
  transition_states(
    gear,
    transition_length = 2,
    state_length = 1
  ) +
  enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

#
library(gapminder)

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

#