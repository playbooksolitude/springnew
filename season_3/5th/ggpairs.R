#24-0808 thu 15:51

#ggpairs()

#install.packages('GGally')
#library(GGally)

#
vehicles |> select(year, cyl, displ, hwy, cty) -> vehicles2 
vehicles2 |> 
  pairs(panel = panel.smooth, 
        col = vehicles2$year)

ggpairs(vehicles2)
ggpairs(USArrests)
ggpairs(mtcars)
ggcorr(mtcars)

# exam
# 상관 행렬 시각화
#ggpairs ----
ggpairs(iris, aes(color = Species))
ggpairs(mtcars, aes(color = factor(cyl)))

#ggcorr ----
ggcorr(iris[, 1:4], label = TRUE, label_round = 2, label_alpha = TRUE)
ggcorr(mtcars, label = T, label_round = 2, label_alpha = T)

# network  ----
#install.packages("network")
library(network)
install.packages("sna")
library(sna)

# 예제 네트워크 생성
(net <- network(matrix(sample(0:1, 25, replace = TRUE), 5, 5)))
# ggnet2()를 사용한 네트워크 시각화
ggnet2(net, size = 6, color = "blue")


#ggmatrix ----
# 여러 개의 ggplot 객체 생성
p1 <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point()
p2 <- ggplot(iris, aes(Sepal.Length, Petal.Length)) + geom_point()
p3 <- ggplot(iris, aes(Sepal.Length, Petal.Width)) + geom_point()
p4 <- ggplot(iris, aes(Sepal.Width, Petal.Length)) + geom_point()

# ggmatrix()를 사용하여 매트릭스로 배치
ggmatrix(list(p1, p2, p3, p4), nrow = 2, ncol = 2)
