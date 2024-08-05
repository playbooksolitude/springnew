#24-0805 mon 21:41

#
#install.packages('reshape2')
library(reshape2)

reshape2::smiths
french_fries

#
reshape2::tips
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

# 필요한 패키지 설치 및 로드
#install.packages("ggplot2")
library(ggplot2)

# 팁 금액의 분포를 히스토그램으로 시각화
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

#
tips |> names()
tips$total_bill |> mean()
tips$tip |> mean()
tips |> head()
  ggplot(data = tips, 
         aes(x = tip, 
             y = total_bill, 
             color = sex)) +
    geom_point() +
    facet_grid(day~smoker) +
    geom_smooth(se = F, method = 'lm') +
    ggtitle(label = 'tips') +
    geom_vline(xintercept = mean(tips$tip),
               alpha = .5, linetype = 2) +
    geom_hline(yintercept = mean(tips$total_bill), 
               alpha = .5, linetype = 2)

    mean(filter(tips, smoker %in% c("Yes")) |> with(tip))
    
      