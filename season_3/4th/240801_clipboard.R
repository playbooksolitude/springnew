#24-0731 wedn

# 0 library ----
#install.packages("clipr")
library(clipr)
library(readr)
library(tidyverse)
library(readxl)

# 1 clipboard ----
#msleep.xlsx


## 2.1 맥북 ----
### 2.1.1 표 ----
read_table(clipboard())
read_table(pipe("pbpaste")) #mac only


### 2.1.2 문장----
clipboard() #dplyr
read_clip() #clipr
# 무라카미 하루키의 신작 장편소설 『도시와 그 불확실한 벽』은 집필과 출간에 얽힌 이야기가 특별하다. 1979년 데뷔 이래, 하루키는 각종 문예지에 소설을 비롯한 다양한 글을 발표했고, 대부분 그 글들을 책으로 엮어 공식 출간했다. 그중 유일하게 단행본으로 출간되지 않아 팬들 사이에서도 오랜 미스터리로 남은 작품이 문예지 <문학계>에 발표했던 중편소설 「도시와, 그 불확실한 벽」(1980)이었다.
# 
# 코로나19로 사람들 사이에 벽이 세워지기 시작한 2020년, 그는 사십 년간 묻어두었던 작품을 새로 다듬어 완성할 수 있겠다고 생각했다. 그리고 삼 년간의 집필 끝에 총 3부 구성의 장편소설 『도시와 그 불확실한 벽』을 세상에 내놓았다. 매 작품을 발표할 때마다 ‘하루키 신드롬’을 일으키며 전 세계 독자들의 사랑을 받고 있는 70대의 작가가 청년 시절에 그렸던 세계를 43년 만에 마침내 완성한 것이다.
# 
# 『도시와 그 불확실한 벽』은 무라카미 하루키에게 자신의 작가 인생과 작품세계를 수확하는 뜻깊은 완성이자 하나의 매듭이며, 이후의 하루키를 기대하게 하는 또다른 시작을 의미한다. 현실과 비현실을 다채롭게 넘나드는 하루키적 상상력을 더욱 원숙한 세계로 만나볼 수 있는 이번 장편은 그의 신작을 기다려온 팬들에게 ‘하루키 세계를 집약한 결정적 작품’으로, 이제 막 무라카미 하루키라는 작가를 접하는 독자들에게는 ‘하루키 세계로 들어가는 완벽한 입문작’으로 자리매김할 것이다.


## 3.1 윈도우 ----
### 2.1.1 클립보드에서 데이터 프레임 읽기 (기대되는 형식에 맞게 변환)
clip_data <- read_clip_tbl()
tibble(clip_data)

### 3.1.2 클립보드에서 텍스트 읽기
clip_text <- read_clip()
print(clip_text)

### 3.1.3  텍스트를 클립보드에 복사 ----
write_clip("Hello, this is a test string!")

### help ----
?clipr

# 4 dplyr ----
clipboard()
read_table(clipboard())

pipe()

clipr_available()
readr::clipboard()

#str
#glimpse
starwars |> glimpse()
starwars |> str()

diamonds |> glimpse()
diamonds |> str()

#factor vs chr
fueleconomy::vehicles
#install.packages('fueleconomy')
library(fueleconomy)










