#24-1007 mon 22:32

#
library(tidyverse)

#
data()
Seatbelts
Seatbelts |> view()
Seatbelts |> head()
Seatbelts[,0]
Seatbelts[1:3,]
Seatbelts[,1:8]
Seatbelts |> str()
tibble(a = c(1:192))

#
Seatbelts |> tail()
data.frame(t1)
Seatbelts[,0]

#
# 운전자 사망자 수 시각화
plot(Seatbelts[, "DriversKilled"], 
     main = "Monthly Number of Drivers Killed", 
     ylab = "Number of Drivers Killed", xlab = "Time")

#
Seatbelts[,0] -> Seatbelts_time
Seatbelts_time |> as.vector()
Seatbelts_time |> dim()
Seatbelts |> tibble() -> Seatbelts_df

Seatbelts_time |> 
  bind_cols(Seatbelts_df) |> view()
  
#
Seatbelts
Seatbelts |> as.data.frame()
floor(time(Seatbelts))
cycle(Seatbelts)

#
t.test(DriversKilled ~ law, data = Seatbelts)

#
str(Seatbelts)
(Seatbelts |> data.frame()) |> tibble() -> t1

cor.test(t1$DriversKilled, t1$kms) -> t2
summary(t2)
cor(t1$DriversKilled, t1$kms)
t1 |> dim()

# NA 처리
t1[1,5,] <- NA
t1

#
# Seatbelts 데이터셋은 R 내장 데이터셋 중 하나로, 영국에서 1969년 1월부터 1984년 12월까지의 교통사고 데이터
#특히, 이 데이터셋은 1983년에 의무적으로 시행된 안전벨트 착용 법률이 교통사고 및 사망에 어떤 영향을 미쳤는지 분석할 때 유용

# 주요 정보:
#   데이터셋 구조: 월별(time series) 데이터로, 각 열은 특정 유형의 교통사고 관련 통계치를 나타냅니다.
# 관측값: 192개(1969년 1월부터 1984년 12월까지의 매월 데이터)
# 변수 설명:
#   drivers: 운전자 사망자 수
# front: 앞좌석 탑승자 사망자 수
# rear: 뒷좌석 탑승자 사망자 수
# kms: 교통량을 나타내는 킬로미터 수
# PetrolPrice: 휘발유 가격
# VanKilled: 상용차 운전자 사망자 수
# law: 안전벨트 착용 의무화 법률 시행 여부 (1: 법률 시행 후, 0: 법률 시행 전)

#
