#23-0629 thu 1)00

#
#install.packages("fmsb")
library(fmsb)
library(showtext)
showtext_auto()
library(tidyverse)
library(googlesheets4)

#1 csv
(read_tsv("./season_3/4.5th/data_job8.tsv") -> thx4_csv)
(googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1HMr2YJlBkcAV8JkmQY31aL1oTNECO-LeB7MaUXHlHNQ/edit#gid=0") -> report_csv)

#
report_csv |> slice(1,2,4) |> 
  radarchart(pcol="#F76461", pfcol = "#F7646180",
             vlcex = 1.5,
             cex.main = 3,
             title = "영화형") 

report_csv |> slice(1:3) |> 
  radarchart(pcol="#1B9E77", pfcol = "#1B9E7780",
             title = "Data Engineer",
             cex.main = 3,
             vlcex = 1.5, )   

#Scientist
report_csv |> slice(1,2,5) |> 
  radarchart(pcol="#E79C54", pfcol = "#E79C5480",
             title = "드라마/예능형",
             cex.main = 3,
             vlcex = 1.5) 

#ML engineer
report_csv |> slice(1,2,6) |> 
  radarchart(pcol="#847574", pfcol = "#84757480",
             title = "ML Engineer",
             cex.main = 3,
             vlcex = 1.5) 

report_csv |> 
  radarchart(pcol="#847574", pfcol = "#84757480",
             title = "ML Engineer",
             cex.main = 3,
             vlcex = 1.5) 

report_csv |> 
  radarchart(pcol=colors_in, 
             pfcol = colors_out,
             title = "Data Job Skill",
             vlcex = 1.2)


# 데이터 분석 ----
#Analytics
thx4_csv |> slice(1,2,4) |> 
  radarchart(pcol="#F76461", pfcol = "#F7646180",
             vlcex = 1.5,
             title = "Data Analytics", 
             cex.main = 2.5) 

#Engineer
thx4_csv |> slice(1:3) |> 
  radarchart(pcol="#1B9E77", pfcol = "#1B9E7780",
             title = "Data Engineer",
             vlcex = 1.5, 
             cex.main = 2.5)   

#Scientist
thx4_csv |> slice(1,2,5) |> 
  radarchart(pcol="#E79C54", pfcol = "#E79C5480",
             title = "Data Scientist",
             vlcex = 1.5, 
             cex.main = 2.5) 

#ML engineer
thx4_csv |> slice(1,2,6) |> 
  radarchart(pcol="#847574", pfcol = "#84757480",
             title = "ML Engineer",
             vlcex = 1.5, 
             cex.main = 2.5) 



# 동시에 그리기 ----------------------------------
thx4_csv |> 
  radarchart(pcol="#847574", pfcol = "#84757480",
    title = "ML Engineer",
    vlcex = 1.5) 

  # 컬러 지정 #1 수동
c("#F76461", "#1B9E77", 
  "#E79C54", "#847574") -> colors_in #면적

c("#F764614c", "#1B9E774c", 
  "#E79C544c", "#8475744c") -> colors_out #테두리


  # 동시에 그리기 ---------------------------
thx4_csv |> 
  radarchart(pcol=colors_in,    #색 채우기
    pfcol = colors_out,         # 테두리 
    title = "Data Job Skill",   #제목
    vlcex = 1.2)                #글자 크기


# 컬러에 적용할 팔레트 보기
library(RColorBrewer)
brewer.pal.info
library(scales) #alpha 값 추출 함수


  #팔레트 이용하기
  (brewer.pal(4, "Set3") -> coul)
  (coul -> colors_border)
  (alpha(coul, 0.3) -> colors_in) #알파값 추출


#화면 4분할
#op <- par(mar=c(1, 2, 2, 1), mfrow=c(2, 2))
op <- par(mfrow=c(2, 2))
op
par(mfrow = c(1,1))
#화면 분할 해제
dev.off()

#
thx4_csv |>  
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


#
?radarchart

(data.frame(matrix(sample(2:20, 30, replace = T), 
                   ncol = 5)) -> df)
c('a', 'b', 'c', 'd','e') -> colnames(df)
df

data.frame(matrix(sample(2:20, 30, replace = T), 
                  ncol = 5)) -> df1

names(df1) <- c('A', 'B', 'C', 'D', 'E')
df1
rbind(rep(20,5), rep(0,5), df1)


#exam
(data <- as.data.frame(matrix(sample(2:20, 10, 
                                     replace=TRUE), ncol=5)))
(colnames(data) <- c("A", "B", "C", "D", "E"))

# 최솟값과 최댓값 설정
(data <- rbind(rep(20, 5), rep(0, 5), data))

# 레이더 차트 그리기
radarchart(data, 
           axistype=1, 
           pcol=rgb(0.2, 0.5, 0.5, 0.9),  # 폴리곤 테두리 색상 및 투명도
           pfcol=rgb(0.2, 0.5, 0.5, 0.5),  # 폴리곤 채우기 색상 및 투명도
           plwd=4,  # 폴리곤 테두리 두께
           cglcol="grey",  # 격자선 색상
           cglty=1,  # 격자선 유형
           axislabcol="grey",  # 축 레이블 색상
           cglwd=0.8,  # 격자선 두께
           vlcex=0.8  # 축 레이블 크기
)

#
rep(1:20)
seq(1:10)
seq(1,150,3)
matrix(sample(2:20, 60, replace = T),ncol = 2) |>
  data.frame() -> t1
t1 |> add_row(X1 = 100, X2 = 200)
(matrix(sample(3:4, 10, replace = T),ncol = 2) |> 
  data.frame() -> t2)
rbind(t1, t2)
