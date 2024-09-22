#24-0916 mon 10:10

#
library(tidyverse)

#
diamonds |> pairs()
mpg

# 데이터셋 불러오기
data("BJsales")

# 데이터 구조 확인
str(BJsales)

# 처음 몇 개의 데이터 확인
head(BJsales)

# 시계열 데이터 플롯
plot(BJsales, 
  main="Monthly Sales Data", 
  ylab="Sales ($1,000)", xlab="Month") -> temp1

# CO2 농도와 흡수량 간의 관계 플롯
plot(CO2$conc, CO2$uptake, 
  main="CO2 Concentration vs Uptake", 
  xlab="CO2 Concentration (μmol/m^3)", 
  ylab="CO2 Uptake (μmol/m^2/sec)",
  pch=19, col="blue")

plot(JohnsonJohnson)
data()


mtcars$disp
