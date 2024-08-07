#24-0804 sun 10:55

#
#install.packages("png")
library(png)

#
# PNG 파일 읽기
(img <- readPNG("./season_3/4.5th/smiths.png"))


# 이미지를 그래픽 장치에 플로팅
plot(1:2, type = 'n', xlab = '', ylab = '', xaxt = 'n', yaxt = 'n', bty = 'n')
rasterImage(img, 1, 1, 2, 2)
