#24-0807 wedn 

# t-test

#
sleep
t.test(extra)

t.test(extra ~ group, data = sleep, paired = T)
t.test(extra ~ group, data = sleep, paired = F)
?t.test()



# 예제 데이터 생성
group1 <- c(10, 12, 14, 15, 16, 20)
group2 <- c(22, 24, 25, 26, 27, 30)

# 독립 표본 t-test 수행
group1;group2
(t_test_result <- t.test(group1, group2)) #t = -6.2154

# 대응 표본
t.test(group1, group2, paired = T) #t = -36.336


t.test(group1, group2)
t.test(group2, group1)
#t 값 (t-statistic):
# t = -6.2154: 이 값은 두 그룹 간의 평균 차이가 표준 오차의 몇 배인지를 나타냅니다
# 음수인 이유는 group3의 평균이 group4의 평균보다 작기 때문입니다.

## ----
group3 <- c(10, 12, 14, 15, 16, 20)
group4 <- c(30, 27, 25, 26, 24, 22)
(t.test(group3, group4, ) -> t_test_result2)

mean(group1) #14.5
mean(group2) #25.7

((var(group1)/length(group1)) -> A) #1.983333
((var(group2)/length(group2)) -> B) #1.244444
(sqrt(A+B) -> C)
((mean(group1) - mean(group2))/C) # t = -6.215438

14.5-25.7 == -11.2
25.7-14.5 == 11.2
11.2/6






#표준오차
sd(group1)/sqrt(n_group1) #1.408
sd(group2)/sqrt(n_group2) #1.115


#before vs after
# 예제 데이터 생성
before <- c(140, 138, 150, 145, 142)
after <- c(135, 136, 148, 143, 140)

# 대응 표본 t-test 수행
t.test(before, after, paired = TRUE) #t 4.33 p-value 0.01

# 독립표본 비교
t.test(before, after)                #t 0.81 p-value 0.43


# 예제 데이터 생성
before <- c(140, 138, 150, 145, 142)
after <- c(135, 136, 148, 143, 140)

# 대응 표본 t-test 수행
t_test_result <- t.test(before, after, paired = TRUE)
print(t_test_result)




