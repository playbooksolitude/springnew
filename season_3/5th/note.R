#24-0818 sun 06:59

# 데이터 준비
if(!require(ggforce)) install.packages('ggforce')
library(ggforce)

# 샘플 데이터
(data <- data.frame(
  A = sample(letters[1:3], 100, replace = TRUE),
  B = sample(letters[4:6], 100, replace = TRUE),
  C = sample(letters[7:9], 100, replace = TRUE)))

# 평행 세트 시각화
ggplot(data) +
  geom_parallel_sets(aes(x = A, y = B, id = C), fill = "lightblue") 

library(devtools)
install_github("jokergoo/ComplexHeatmap")
library(ComplexHeatmap)
library(circlize)  # 색상 팔레트

# 샘플 데이터
set.seed(123)
mat <- matrix(rnorm(100), 10, 10)
rownames(mat) <- paste("Gene", 1:10)
colnames(mat) <- paste("Sample", 1:10)


# 기본 히트맵
Heatmap(mat, name = "expression", 
        col = colorRamp2(c(-2, 0, 2), c("blue", "white", "red")))


#ggalluvial
install.packages('ggalluvial')
library(ggalluvial)

# 샘플 데이터
data <- data.frame(
  time = rep(c("2019", "2020", "2021"), each = 3),
  category = c("A", "B", "C"),
  freq = c(5, 10, 15, 7, 14, 21, 6, 12, 18))

# alluvial plot
ggplot(data, aes(axis1 = category, axis2 = time, y = freq)) +
  geom_alluvium(aes(fill = category)) +
  geom_stratum() +
  geom_text(stat = "stratum", aes(label = after_stat(stratum))) +
  theme_void()

