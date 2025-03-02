3 > 1
3 >= 1
3 => 1

a == a #변수
'a' == 'a'
"a" == "a"
'a' == "A"


ggplot2::ggplot()

3 -> A
4 -> B

c(1,2,3,4,5,6) -> A 
A
B <- c(1,2,3,4,5)

3 + 4 -> A
A

# install.package()
install.packages("ggplot2")
library(ggplot2)

'data'() #함수
'mpg'    #데이타셋

ggplot(data = mpg, mapping = aes(x = model, y = after_stat(count))) + 
  geom_bar() +
  coord_flip()

|> 
  ctrl + shift + m


View(mpg)

#
ggplot(data = mpg) +
  geom_point(mapping = aes(x = model, 
    y = hwy, 
    color = drv)) +
  coord_flip() +
  # facet_wrap(.~drv) +
  facet_grid(class~drv, scales = 'free_y')
  scale_color_brewer(palette = 'Dark2') +
  theme_minimal() +
  theme(legend.position = 'none')




