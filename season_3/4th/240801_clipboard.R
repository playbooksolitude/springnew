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
readr::clipboard()
clipboard() #readr()
read_clip() #clipr

## 3.1 윈도우 ----
### 2.1.1 클립보드에서 데이터 프레임 읽기 (기대되는 형식에 맞게 변환)

clip_data <- read_clip_tbl()
tibble(clip_data)

read_clip_tbl() -> temp1
tibble(temp1)

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










