#24-0807 wedn 08:36

#
library(tidyverse)

#
?midwest
midwest |> glimpse(); midwest |> str()
midwest |> 
  colnames()

# 4. midwest
# midwest 데이터셋은 미국 중서부 지역의 인구 통계 데이터를 포함하고 있습니다.

# PID: 카운티의 고유 식별자입니다.
# county: 카운티의 이름입니다.
# state: 주의 이름입니다.
# area: 카운티의 면적을 백분율로 나타낸 값입니다.
# poptotal: 카운티의 총 인구 수입니다.
# popdensity: 인구 밀도입니다. (인구 수 / 면적)
# popwhite: 백인 인구 수입니다.
# popblack: 흑인 인구 수입니다.
# popamerindian: 아메리카 원주민 인구 수입니다.
# popasian: 아시아인 인구 수입니다.
# popother: 기타 인종 인구 수입니다.
# percwhite: 백인 인구 비율입니다. (백인 인구 수 / 총 인구 수 * 100)
# percblack: 흑인 인구 비율입니다. (흑인 인구 수 / 총 인구 수 * 100)
# percamerindan: 아메리카 원주민 인구 비율입니다. (아메리카 원주민 인구 수 / 총 인구 수 * 100)
# percasian: 아시아인 인구 비율입니다. (아시아인 인구 수 / 총 인구 수 * 100)
# percother: 기타 인종 인구 비율입니다. (기타 인종 인구 수 / 총 인구 수 * 100)
# popadults: 성인 인구 수입니다.
# perchsd: 고등학교 졸업 비율입니다. (고등학교 졸업 인구 수 / 총 인구 수 * 100)
# percollege: 대학 졸업 비율입니다. (대학 졸업 인구 수 / 총 인구 수 * 100)
# percprof: 전문직 인구 비율입니다. (전문직 종사자 수 / 총 인구 수 * 100)
# poppovertyknown: 빈곤 인구 수 (알려진)입니다.
# percpovertyknown: 빈곤 인구 비율 (알려진)입니다. (빈곤 인구 수 / 총 인구 수 * 100)
# percbelowpoverty: 빈곤선 이하 인구 비율입니다. (빈곤선 이하 인구 수 / 빈곤 인구 수 * 100)
# percchildbelowpovert: 빈곤선 이하 아동 비율입니다. (빈곤선 이하 아동 수 / 빈곤 인구 수 * 100)
# percadultpoverty: 성인 빈곤 인구 비율입니다. (빈곤 성인 수 / 빈곤 인구 수 * 100)
# percelderlypoverty: 고령 빈곤 인구 비율입니다. (빈곤 고령자 수 / 빈곤 인구 수 * 100)
# inmetro: 도시 지역 여부를 나타냅니다.
# category: 카테고리입니다. (인구 통계학적 분류)

# category
  # AAR 농업/시골 지역. 이 분류는 농업 중심의 시골 지역을 나타냅니다.
  # AHR 높은 소득의 시골 지역. 
  # ALU 낮은 소득의 도시 지역. 
  # ASR 낮은 소득의 시골 지역. 
  # LAR 낮은 교육 수준의 시골 지역. 
  # LHR 높은 소득의 도시 지역. 
  # LHU 낮은 소득의 도시 지역. 
  # LRS 시골 지역. 농업 중심의 일반적인 시골 지역
  # UAC 도시/비농업 중심 지역. 
  # UMC 중소 도시 지역. 
  # URB 대도시 지역. 

midwest |> 
  count(category)

#
midwest |> count(state) #5
midwest |> count(county) #320
midwest_2factor |> count(state, county, sort = T) #437
midwest_2factor |> count(county, state, sort = T) #437
midwest_2factor |>  
count(state, county) |> 
  pivot_wider(names_from = state, values_from = n)

midwest_2factor |>  # ----
  count(state, county) |> 
  pivot_wider(names_from = state, values_from = n) |> 
  reframe(across(c(IL, IN, MI, OH, WI), sum, na.rm = T)) 

midwest_2factor |> 
  group_by(state) |> 
  reframe(n = n()) |> 
  reframe(across(n, sum))
  

# midwest_2factor
(midwest |> 
  mutate_at(vars(county, state, category), 
            factor) -> midwest_2factor)

# midwest_3count ----
(midwest_2factor |> 
  count(county, state, sort = T) -> midwest_3count)

#error
colSums(midwest_3count);
?colSums

# geom_tile() ----
midwest_2factor |> 
  count(state, county) |> 
  ggplot(aes(x = state, y = county, fill = n)) +
  geom_tile()

# geom_tile() ----
midwest_2factor |> 
  #count(state, county) |> 
  ggplot(aes(x = state, y = after_stat(count))) +
  geom_bar(stat = 'count', aes(fill = category)) 


midwest_2factor |> 
  
#
midwest_2factor |> 
  count(state, county) |> 
  pivot_wider(names_from = state, values_from = n) |> 
  rowwise() |> 
  #across() |> 
  mutate(sum = sum(IL, IN, MI, OH, WI, na.rm = T)) |> 
  count(sum, sort = T)

#




