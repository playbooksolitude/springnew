#24-0817 sat 11:36

#
# 간단한 교차 분할표 생성
(data <- matrix(c(200, 150, 50, 100), nrow = 2, byrow = TRUE))
rownames(data) <- c("Male", "Female")
colnames(data) <- c("Yes", "No")
data
# 모자이크 플롯 그리기
data
mosaicplot(data, color = TRUE, main = "Gender vs Response")
#
?mosaicplot()

#
mpg
mpg |> 
  count(drv) |> 
  pivot_wider(names_from = drv, values_from = n) |> 
  mosaicplot()

data
mpg |> 
  count(class, drv) |> 
  pivot_wider(names_from = class, values_from = n) |> 
  is.na() |> 
  colSums() |> 
  mosaicplot()

#
mtcars |> 
  mosaicplot()

#
(data <- table(mtcars$cyl, mtcars$gear))
assocplot(data, main = "Association Plot")

#
library(gplots)
(data <- table(mtcars$cyl, mtcars$gear))
balloonplot(data, main = "Balloon Plot", xlab = "Cylinders", ylab = "Gears")

balloonplot(iris)
balloonplot(mtcars)
mtcars |> 
  rowid_to_column('cars') |> 
  select(-1) |> 
  as.matrix() |> 
  balloonplot()

#
data <- table(mtcars$cyl, mtcars$gear)
heatmap(as.matrix(data), Rowv = NA, Colv = NA, main = "Heatmap", xlab = "Gears", ylab = "Cylinders")
