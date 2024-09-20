#24-0807 wedn 08:31

#
library(ggplot2)
library(dplyr)

data(package = .packages(all.available = TRUE))

#
# 1. mpg
# mpg 데이터셋은 자동차 연비에 관한 정보를 포함하고 있습니다. 이 데이터셋은 ggplot2의 기능을 시연하는 데 자주 사용됩니다.
# 
# 변수:
#   manufacturer: 제조사
# model: 모델명
# displ: 엔진 배기량 (리터 단위)
# year: 제조 연도
# cyl: 실린더 수
# trans: 변속기 종류
# drv: 구동 방식 (f = 앞바퀴, r = 뒷바퀴, 4 = 4륜 구동)
# cty: 시내 연비 (mpg)
# hwy: 고속도로 연비 (mpg)
# fl: 연료 종류
# class: 자동차 종류


# 2. diamonds
# diamonds 데이터셋은 다이아몬드의 가격과 품질에 관한 정보를 포함하고 있습니다.
# 
# 변수:
#   carat: 캐럿 무게
# cut: 컷 품질 (Fair, Good, Very Good, Premium, Ideal)
# color: 색상 (D, E, F, G, H, I, J)
# clarity: 투명도 (I1, SI2, SI1, VS2, VS1, VVS2, VVS1, IF)
# depth: 깊이 퍼센트
# table: 테이블 퍼센트
# price: 가격 (미국 달러)
# x: 길이 (mm)
# y: 폭 (mm)
# z: 깊이 (mm)

# 3. economics
# economics 데이터셋은 미국 경제에 관한 시계열 데이터를 포함하고 있습니다.
# 
# 변수:
# date: 날짜
# pce: 개인 소비 지출 (억 달러)
# pop: 인구 (천 명)
# psavert: 개인 저축률
# uempmed: 실업 기간 (주 단위)
# unemploy: 실업자 수 (천 명)

# 4. midwest
# midwest 데이터셋은 미국 중서부 지역의 인구 통계 데이터를 포함하고 있습니다.
# 
# 변수:
# PID: 지역 ID
# county: 카운티 이름
# state: 주 이름
# area: 면적
# poptotal: 총 인구
# popdensity: 인구 밀도
# popwhite: 백인 인구
# popblack: 흑인 인구
# popamerindian: 아메리카 원주민 인구
# popasian: 아시아 인구
# popother: 기타 인종 인구
# perchsd: 고등학교 졸업 비율
# percollege: 대학교 졸업 비율
# percprof: 전문직 비율
# percpovertyknown: 빈곤 비율


# 5. txhousing
# txhousing 데이터셋은 텍사스 주의 주택 판매 데이터를 포함하고 있습니다.
# 
# 변수:
#   city: 도시 이름
# year: 연도
# month: 월
# sales: 판매 수
# volume: 판매 금액 (천 달러)
# median: 중간 가격
# listings: 리스트 수
# inventory: 재고
# date: 날짜

#6 boot
#부트스트래핑


