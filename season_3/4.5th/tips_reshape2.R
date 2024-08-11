#24-0805 mon 21:41

#
# 필요한 패키지 설치 및 로드
#install.packages("ggplot2")
library(ggplot2)
#install.packages('reshape2')
library(reshape2)

reshape2::smiths
french_fries |> head()

#
reshape2::tips |> head()
tips |> 
  str()

# 데이터셋 구조
#미국의 한 식당에서 수집된 팁 데이터
  # total_bill: 식사 금액 (달러)
  # tip: 팁 금액 (달러)
  # sex: 고객의 성별 (Male/Female)
  # smoker: 흡연 여부 (Yes/No)
  # day: 요일 (Thur, Fri, Sat, Sun)
  # time: 식사 시간 (Lunch/Dinner)
  # size: 식사 인원


# 팁 금액의 분포를 히스토그램으로 시각화 ----
ggplot(tips, aes(x = tip)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black") +
  ggtitle("Distribution of Tip Amounts") +
  xlab("Tip Amount") +
  ylab("Frequency")

# 성별에 따른 팁 금액의 차이를 상자그림으로 시각화
ggplot(tips, aes(x = sex, y = tip)) +
  geom_boxplot(fill = c("lightblue", "darkred")) +
  ggtitle("Tip Amount by Gender") +
  xlab("Gender") +
  ylab("Tip Amount")

# 흡연 여부에 따른 팁 금액의 차이를 상자그림으로 시각화
ggplot(tips, aes(x = smoker, y = tip)) +
  geom_boxplot(fill = c("lightgreen", "lightcoral")) +
  ggtitle("Tip Amount by Smoking Status") +
  xlab("Smoking Status") +
  ylab("Tip Amount")

# ----
tips |> names()
tips$total_bill |> mean()
tips$tip |> mean()

# ----
tips |> head()
ggplot(data = tips, 
         aes(x = tip, 
             y = total_bill, 
             color = sex)) +
    geom_point() +
    facet_grid(day~smoker) +
    geom_smooth(se = F, method = 'lm') +
    ggtitle(label = 'tips') 

    # geom_vline(xintercept = mean(tips$tip),
    #            alpha = .5, linetype = 2) +
    # geom_hline(yintercept = mean(tips$total_bill), 
    #            alpha = .5, linetype = 2)

    mean(filter(tips, smoker %in% c("Yes")) |> with(tip))
    
# 
tips |> head()
ggplot(data = tips, 
       aes(x= tip, fill = sex)) +
  geom_density(alpha = .5)
  facet_grid(day~smoker) +
  geom_smooth(se = F, method = 'lm') +
  ggtitle(label = 'tips')  
    
# ggridges 패키지 설치 및 로드
#install.packages("ggridges")
library(ggridges)
?ggridges

# 릿지 플롯 시각화
ggplot(tips, aes(x = tip, y = day, fill = day)) +
  geom_density_ridges(alpha = .5) +
  ggtitle("Ridge Plot of Tip by Day") +
  xlab("Tip") +
  ylab("Day")
  
# ----
tips |> head()
tips |> glimpse()    
ggplot(tips, aes(x = tip)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black") +
  ggtitle("Histogram of Tip Amounts") +
  xlab("Tip Amount") +
  ylab("Frequency")

# 성별 팁의 총합 계산
tip_by_sex <- tips %>%
  group_by(sex) %>%
  summarise(total_tip = sum(tip))

# 파이 차트 시각화
ggplot(tip_by_sex, aes(x = "", y = total_tip, fill = sex)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  ggtitle("Pie Chart of Total Tips by Gender") +
  theme_void() # 축과 배경 제거

# 테이블 사이즈별 평균 팁 계산
avg_tip_by_size <- tips %>%
  group_by(size) %>%
  summarise(mean_tip = mean(tip))

# 선 그래프 시각화
ggplot(avg_tip_by_size, aes(x = size, y = mean_tip)) +
  geom_line() +
  geom_point() +
  ggtitle("Average Tip by Table Size") +
  xlab("Table Size") +
  ylab("Average Tip")

ggplot(tips, aes(x = tip, fill = sex)) +
  geom_density(alpha = 0.5) +
  ggtitle("Density Plot of Tip Amounts by Gender") +
  xlab("Tip Amount") +
  ylab("Density")

    
# 요일별 성별 팁의 총합 계산
tip_by_day_sex <- tips %>%
  group_by(day, sex) %>%
  summarise(total_tip = sum(tip))

# 누적 막대 그래프 시각화
ggplot(tip_by_day_sex, aes(x = day, y = total_tip, fill = sex)) +
  geom_bar(stat = "identity") +
  ggtitle("Total Tips by Day and Gender") +
  xlab("Day") +
  ylab("Total Tip")

# 요일별 팁의 총합 계산
tip_by_day <- tips %>%
  group_by(day) %>%
  summarise(total_tip = sum(tip))

# 누적 영역 그래프 시각화
ggplot(tip_by_day, aes(x = day, y = total_tip, group = 1, fill = day)) +
  geom_area() +
  ggtitle("Total Tips by Day") +
  xlab("Day") +
  ylab("Total Tip")

# 요일별 성별 평균 팁 계산
avg_tip_by_day_sex <- tips %>%
  group_by(day, sex) %>%
  summarise(mean_tip = mean(tip))

# 점 그래프 시각화
ggplot(avg_tip_by_day_sex, aes(x = day, y = mean_tip, color = sex)) +
  geom_point(size = 3) +
  ggtitle("Average Tip by Day and Gender") +
  xlab("Day") +
  ylab("Average Tip")

# 요일 및 시간대별 평균 팁 계산
avg_tip_by_day_time <- tips %>%
  group_by(day, time) %>%
  summarise(mean_tip = mean(tip))

# 히트맵 시각화
ggplot(avg_tip_by_day_time, aes(x = day, y = time, fill = mean_tip)) +
  geom_tile() +
  ggtitle("Heatmap of Average Tip by Day and Time") +
  xlab("Day") +
  ylab("Time") +
  scale_fill_gradient(low = "white", high = "red")


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    