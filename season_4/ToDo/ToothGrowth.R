#24-1009 wedn


library(tidyverse)
library(bbplot)
library(showtext)
showtext_auto()
#
data()
ToothGrowth
ToothGrowth |> head()

#
ToothGrowth |> summary()

#
# 공급 방식에 따른 치아 성장 길이의 차이
ggplot(ToothGrowth, aes(x = supp, y = len)) +
  geom_boxplot() +
  labs(title = "Tooth Growth by Supplement Type",
       x = "Supplement Type",
       y = "Tooth Length")

# 용량에 따른 치아 성장 길이의 차이
ggplot(ToothGrowth, aes(x = factor(dose), y = len)) +
  geom_boxplot() +
  labs(title = "Tooth Growth by Dose of Vitamin C",
       x = "Dose (mg/day)",
       y = "Tooth Length")

#
ToothGrowth |> 
  ggplot(aes(x = factor(dose), y = len)) +
  geom_boxplot(outlier.color = 'black') +
  geom_point(position = position_jitter(.1), aes(color = factor(dose)),
             show.legend = F) +
  #geom_point(alpha = .5) +
  facet_wrap(.~supp) +
  xlab(label = 'dose') +
  theme_minimal() +
  labs(caption = 'ToothGrowth', 
       tag = '', 
       title = '비타민 C 공급방식과 용량에 따른 기니피그의 치아성장', 
       subtitle = 'Orange Juice vs. Ascorbic acid') +
  theme(strip.text = element_text(size = 20),
        strip.background = element_rect(fill = 'grey'),
        axis.text = element_text(size = 16), 
        axis.title = element_text(size = 20)) 
  ggtitle(label = '기니피그의 치아성장', subtitle = '')
  bbc_style()

#기니피그
  # https://www.google.com/search?q=%EA%B8%B0%EB%8B%88%ED%94%BC%EA%B7%B8&sca_esv=0a650f077e31c052&sxsrf=ADLYWIL41IVvt2aMBefocLOyFE_HI1bq7Q%3A1728404861400&ei=fV0FZ6SUGPrc2roPi9SCyQQ&ved=0ahUKEwjkxqrumf-IAxV6rlYBHQuqIEkQ4dUDCA8&uact=5&oq=%EA%B8%B0%EB%8B%88%ED%94%BC%EA%B7%B8&gs_lp=Egxnd3Mtd2l6LXNlcnAiDOq4sOuLiO2UvOq3uDIIEC4YgAQYsQMyBRAAGIAEMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgAQyFxAuGIAEGLEDGJcFGNwEGN4EGN8E2AEBSLoRUNkHWOsNcAR4AZABA5gBkQGgAZ0IqgEDMC44uAEDyAEA-AEBmAIHoAKrA8ICChAAGLADGNYEGEfCAgoQIxiABBgnGIoFwgIEECMYJ8ICCxAuGIAEGLEDGIMBwgILEAAYgAQYsQMYgwHCAgUQLhiABMICERAuGIAEGLEDGNEDGIMBGMcBmAMAiAYBkAYKugYGCAEQARgUkgcDNC4zoAfFew&sclient=gws-wiz-serp
  # 
# t-test를 이용해 OJ와 VC의 치아 성장 길이 비교
t.test(len ~ supp, data = ToothGrowth)
t_test_result <- t.test(len ~ supp, data = ToothGrowth)
t_test_result

# 1. t-통계량 (t = 1.9153):
#   t-통계량은 1.9153입니다. 두 그룹(OJ와 VC) 간 평균 차이를 비교하는 데 사용된 값입니다. t-통계량이 클수록 두 그룹 간 차이가 클 가능성이 높습니다.
# 2. 자유도 (df = 55.309):
#   Welch t-test의 경우, 두 그룹의 분산이 같지 않다고 가정하기 때문에 자유도가 소수점 값일 수 있습니다.
# 3. p-값 (p-value = 0.06063):
#   p-값이 0.06063으로 나왔습니다. 이는 유의 수준 0.05보다 약간 크므로, 두 그룹 간 평균 차이가 통계적으로 유의미하지 않다고 결론지을 수 있습니다. 즉, OJ 방식과 VC 방식 간의 차이가 있을 가능성이 있지만, 통계적으로 충분히 강한 증거는 없습니다.
# 4. 대립가설:
#   대립가설은 **"group OJ와 group VC 간의 평균 차이가 0이 아니다"**라는 가설입니다.
# 5. 95% 신뢰 구간 (95 percent confidence interval):
#   신뢰 구간은 -0.1710156에서 7.5710156 사이입니다. 이는 평균 차이에 대한 추정 범위입니다. 이 구간이 0을 포함하므로, OJ와 VC 간의 차이가 통계적으로 유의미하지 않음을 나타냅니다.
# 6. 평균 값 (sample estimates):
#   OJ 그룹의 평균: 20.66333
# VC 그룹의 평균: 16.96333
# OJ 방식으로 비타민 C를 공급했을 때 기니피그의 치아 성장 길이가 더 길었다는 것을 알 수 있습니다. 그러나 앞서 언급했듯이, p-값이 0.05보다 크기 때문에 이 차이가 유의미하다고 할 수 없습니다.
# 결론:
#   p-값이 0.06063으로 0.05보다 약간 크기 때문에 OJ와 VC 간의 치아 성장 차이가 있다고 볼 수는 있지만, 그 차이가 통계적으로 유의미하다고 확신할 수 없다는 결론입니다.
  
anova_result <- aov(len ~ factor(dose), data = ToothGrowth)

# 결과 확인
# summary(anova_result) 
# 1. Df (자유도, Degrees of Freedom):
#   factor(dose): 2개의 자유도를 가집니다. 이는 3개의 비타민 C 용량 그룹(0.5 mg/day, 1 mg/day, 2 mg/day)에서 1을 뺀 값입니다.
# Residuals: 57개의 자유도를 가집니다. 이는 총 60개의 관측값에서 그룹 수(3)를 뺀 값입니다.
# 2. Sum Sq (제곱합, Sum of Squares):
#   factor(dose): 2426. 이는 용량에 따른 치아 성장 차이의 총 변동을 나타냅니다.
# Residuals: 1026. 이는 용량 외의 요인에 의한 변동을 나타냅니다.
# 3. Mean Sq (평균 제곱, Mean Square):
#   factor(dose): 1213. 이는 각 그룹 간 변동을 나타냅니다. (2426 / 2)
# Residuals: 18. 이는 각 그룹 내 변동을 나타냅니다. (1026 / 57)
# 4. F value (F-값):
#   F-값은 67.42로, 그룹 간 변동이 그룹 내 변동에 비해 얼마나 큰지를 나타냅니다. 값이 클수록 그룹 간 차이가 크다는 것을 의미합니다.
# 5. Pr(>F) (p-값):
#   p-값은 9.53e-16으로, 이는 0.0000000000000953을 의미합니다. 이 값은 매우 작아서 유의수준 0.05보다 훨씬 작습니다. 즉, 용량에 따른 차이가 통계적으로 매우 유의미합니다.
# 6. Signif. codes:
#   세 개의 별표(‘*’**)는 p-값이 0.001보다 작다는 것을 나타내며, 이는 매우 유의미하다는 것을 뜻합니다.
# 결론:
#   비타민 C의 **용량(dose)**에 따른 치아 성장 길이의 차이는 통계적으로 매우 유의미합니다.
# F-값이 67.42로 매우 크고, p-값이 거의 0에 가까워, 세 가지 용량(0.5, 1, 2 mg/day) 간의 차이가 뚜렷하게 존재한다고 볼 수 있습니다.
# 추가적으로, **사후 검정(post-hoc test)**을 통해 용량별로 어떤 그룹 간 차이가 유의미한지 자세히 분석할 수 있습니다.
# 이 ANOVA 결과는 비타민 C의 용량이 증가함에 따라 기니피그의 치아 성장이 더 많이 일어난다는 것을 강하게 시사합니다.
  

# 실험의 결론
# ToothGrowth 데이터셋을 분석하면, 비타민 C 공급 방식(OJ와 VC)과 비타민 C의 용량이 기니피그의 치아 성장에 중요한 영향을 미친다는 것을 알 수 있습니다. OJ 방식이 VC보다 치아 성장을 촉진시키는 것으로 나타날 수 있으며, 용량이 증가할수록 치아 성장 길이도 증가합니다.
# 
# 이 데이터셋은 t-test 또는 ANOVA와 같은 통계적 방법을 통해 비타민 C 공급 방식과 용량의 차이가 통계적으로 유의미한지 분석하는 데도 자주 사용됩니다.