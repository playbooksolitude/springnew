#24-1003 


#
library(fmsb)
library(showtext)
showtext_auto()
library(tidyverse)
library(googlesheets4)

#1 read_sheet
read_sheet("https://docs.google.com/spreadsheets/d/16ZgYbL6GeSn9vLEKz1rXu4afzRFG_ZfFJQw6_120Mao/edit?gid=876431959#gid=876431959", sheet = "DataAnalitics") -> t

#1 csv
max <- c(5,5,5,5,5,5,5,5,5)
min <- c(0,0,0,0,0,0,0,0,0)

(t |> 
  pivot_longer(cols = c(2:5),
    names_to = '구분', 
    values_to = 'value') |> 
    pivot_wider(names_from = '스펙',
    values_from = value) |> 
  select(-1) -> t2)

(rbind(max, min, t2) -> t3)

# t3 |> 
#   radarchart()

# 동시에 그리기 ----------------------------------
# t3 |> 
#   radarchart(pcol=colors_in, pfcol = colors_out,
#     title = "ML Engineer",
#     vlcex = 1.5) 

# 컬러 지정 #1 수동
c("#F76461", "#1B9E77", 
  "#E79C54", "#847574") -> colors_in #면적

c("#F764614c", "#1B9E774c", 
  "#E79C544c", "#8475744c") -> colors_out #테두리

#Data Analytics
t3 |> slice(1:3) |> 
  radarchart(pcol="#F76461", pfcol = "#F7646180",
    title = "Data Analytics",
    vlcex = 1.5, 
    cex.main = 2.5)

#Data Engineer
t3 |> slice(1,2,5) |> 
  radarchart(pcol="#E79C54", pfcol = "#E79C5480",
    title = "Data Engineer",
    vlcex = 1.5, 
    cex.main = 2.5)

#ML engineer
t3 |> slice(1,2,6) |> 
  radarchart(pcol="#847574", pfcol = "#84757480",
    title = "ML Engineer",
    vlcex = 1.5, 
    cex.main = 2.5)

#Data Scientist
t3 |> slice(1,2,4) |> 
  radarchart(pcol="#1B9E77", pfcol = "#1B9E7780",
    vlcex = 1.5,
    title = "Data Scientist", 
    cex.main = 2.5) 


# ----

#화면 4분할
#op <- par(mar=c(1, 2, 2, 1), mfrow=c(2, 2))
op <- par(mfrow=c(2, 2))
op
#par(mfrow = c(1,1))
#화면 분할 해제
dev.off()

#
t3 |>  
  radarchart(
    pcol = colors_in,           #테두리
    #pfcol = colors_in,       #면 채우기
    pfcol = colors_out,       #면 채우기
    plwd = 0.5,                #색칠 테두리 굵기
    plty = .5,                #테두리 점선
    cglcol = "grey",         #거미줄 색깔
    cglty = 1,               #거미줄 모양
    vlcex = 1.2)             #폰트 크기

#title(main="My Radar Chart", cex.main=2, font.main=4)

