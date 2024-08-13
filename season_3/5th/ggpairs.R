#24-0808 thu 20:28
library(tidyverse)
library(GGally)
iris |> head()
iris |> str()
ggpairs(data = iris, aes(color = Species))

#-----

#ggpairs()

#install.packages('GGally')
library(GGally)

ggpairs(iris, mapping = ggplot2::aes(color = Species))

iris |> select(1:4) |> head()
ggpairs(data = iris, columns = c(1:5), aes(color = Species))

ggpairs(data = vehicles, 
        columns = c('year','displ', 'hwy', 'cty', 'drive'),
        #aes(color = drive),
        title = 'vehicles')

mpg |> head()

ggpairs(data = mpg, columns = c('cty', 'hwy', 'drv'),
        aes(color = drv), title = 'mpg')


# exam
# 상관 행렬 시각화
#1 ggpairs ----
iris |> str()
mtcars
ggpairs(iris, aes(color = Species))
ggpairs(mtcars, aes(color = factor(cyl)))


#2 ggcorr ----
ggcorr(iris[, 1:4], label = TRUE, label_round = 2, label_alpha = TRUE)
ggcorr(mtcars, label = T, label_round = 2, label_alpha = T)
ggcorr(mtcars, low = '#252525', label = T, label_alpha = T)



#3 network  ----
#install.packages("network")
library(network)
install.packages("sna")
library(sna)

# 예제 네트워크 생성
(net <- network(matrix(sample(0:1, 25, replace = TRUE), 5, 5)))
# ggnet2()를 사용한 네트워크 시각화
ggnet2(net, size = 6, color = "blue")


#4 ggmatrix ----
# 여러 개의 ggplot 객체 생성
p1 <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point()
p2 <- ggplot(iris, aes(Sepal.Length, Petal.Length)) + geom_point()
p3 <- ggplot(iris, aes(Sepal.Length, Petal.Width)) + geom_point()
p4 <- ggplot(iris, aes(Sepal.Width, Petal.Length)) + geom_point()

# ggmatrix()를 사용하여 매트릭스로 배치
ggmatrix(list(p1, p2, p3, p4), nrow = 2, ncol = 2)


#
wesanderson::heatmap
?heatmap
ggplot(data = heatmap, 
       aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = round(value,2)), color = 'white')


# ----
library(GGally)
data(iris)

ggpairs(
  data = iris,
  columns = 1:4,
  mapping = ggplot2::aes(color = Species),
  title = "Iris Data Pair Plot",
  upper = list(continuous = "cor"),
  lower = list(continuous = "smooth"),
  diag = list(continuous = "blankDiag"),
  axisLabels = "internal",
  showStrips = F,
  labeller = label_both,
  cardinality_threshold = 10,
  progress = TRUE)
