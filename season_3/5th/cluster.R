#24-0817 sat 13:47

#
library(cluster)
clusplot(x = iris_data, clus = cluster_result, color = TRUE, shade = TRUE, labels = 2, lines = 0)

#
# 예제 데이터로 kmeans 클러스터링 수행
data(iris)
(iris_data <- iris[, -5])
(kmeans_result <- kmeans(iris_data, centers = 3))

# 클러스터 결과 시각화
clusplot(iris_data, kmeans_result$cluster, 
         color = TRUE, shade = TRUE, labels = 2, lines = 0)

# 클러스터 결과 시각화
library(factoextra)
fviz_cluster(kmeans_result, data = iris_data, geom = "point", ellipse = TRUE, show.clust.cent = TRUE)

#
(mtcars |> 
  rowid_to_column('cars'))[,-1] -> mtcars_data
(kmeans(mtcars_data, centers = 3) -> mtcars_result)

#
fviz_cluster(mtcars_result, data = mtcars_data)
