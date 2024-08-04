#24-0731 wedn 17:07

#
library(tidyverse)

#
msleep |> 
  colnames() |> 
  tibble()


?msleep
# name: 동물의 이름
# genus: 속(genus) 명칭
# vore: 식습성 (육식성, 초식성, 잡식성 등)
# order: 분류학적 목(order)
# conservation: 보존 상태 (보호 필요성 등)
# sleep_total: 하루 총 수면 시간 (시간 단위)
# sleep_rem: 하루 REM 수면 시간 (시간 단위)
# sleep_cycle: 한 수면 주기의 길이 (시간 단위)
# awake: 하루 깨어 있는 시간 (시간 단위)
# brainwt: 뇌의 무게 (킬로그램 단위)
# bodywt: 몸무게 (킬로그램 단위)


#
msleep |> colnames()
msleep |> 
  count(genus)
 
colnames(msleep) |> 
  as_vector() -> temp2

msleep |> 
  count(genus, vore, order, conservation)
msleep |> 
  count(conservation)

#
msleep |> 
  count(genus, vore, order, conservation, sort = T) |> 
  pivot_wider(names_from = vore, values_from = vore)

#
msleep
