#24-0817 sat 09:01

#
library(tidyverse)
library(GGally)

#GGally ----
GGally::baseball
australia_PISA2012
baseball
flea
happy
nasa
pigs
psychademic
tips
twitter_spambots



#1. 변수 간 관계를 시각화 ----
flea |> str()
ggpairs(flea, aes(color = species))
flea |> count(species)

#2. ggscatmat() - 간단한 산점도 행렬
ggscatmat(iris, columns = 1:4, color = "Species")

#3. ggcorr() - 상관 행렬 히트맵
ggcorr(mtcars, label = TRUE)

#4. ggnet2() - 네트워크 그래프
library(network)
net <- network(matrix(rbinom(25, 1, 0.2), nrow = 5))
ggnet2(net)

#5. ggduo() - 두 데이터 프레임 간 변수 쌍 비교
ggduo(iris, iris, columnsX = 1:3, columnsY = 4:5, mapping = aes(color = Species))

#
(pm <- ggpairs(iris, aes(color = Species)))
ggmatrix(list(pm, pm), 2, 1)


# ggparcoord() 함수 호출
ggparcoord(mtcars, columns = 1:5, groupColumn = "cyl", scale = "uniminmax")


#
#install.packages('survival')
library(survival)
fit <- survfit(Surv(time, status) ~ sex, data = lung)
ggsurv(fit)

#
ggbivariate(flea, x = "aedeagus", y = "tars1", group = "Species")

#
fit <- lm(mpg ~ wt + hp + factor(cyl), data = mtcars)
ggcoef(fit, exponentiate = FALSE)

#baseball -----

# 1. ggpairs() - 산점도 행렬 및 히스토그램
ggpairs(baseball[, c("year", "stint", "hr", "rbi")], 
        aes(color = factor(stint)))

# 2. ggscatmat() - 간단한 산점도 행렬
ggscatmat(baseball, columns = c("year", "stint", "hr", "rbi"), color = "team")

# 3. ggcorr() - 상관 행렬 히트맵
ggcorr(baseball[, c("year", "g", "ab", "r", "h", "hr", "rbi")], label = TRUE)

# 4. ggnet2() - 네트워크 그래프 (예시용 네트워크 데이터 필요)
library(network)
set.seed(123)
net_data <- network(matrix(rbinom(100, 1, 0.1), nrow = 10))
ggnet2(net_data)

# 5. ggduo() - 두 데이터 프레임 간 변수 쌍 비교
# 이 예시는 같은 데이터셋의 다른 부분을 비교합니다
ggduo(baseball, baseball, columnsX = c("year", "hr"), columnsY = c("rbi", "h"), mapping = aes(color = team))

# 6. ggmatrix() - ggplot 객체 행렬
pm <- ggpairs(baseball[, c("year", "hr", "rbi")], aes(color = factor(stint)))
ggmatrix(list(pm, pm), 2, 1)

# 7. ggparcoord() - 평행좌표 그래프

baseball
baseball$team <- as.factor(baseball$team)
ggparcoord(baseball, 
           columns = c("year", "hr", "rbi", "g"), 
           group = "team", 
           scale = "uniminmax")

(p_ <- GGally::print_if_interactive)
(p <- ggparcoord(data = diamonds.samp, columns = c(2, 5:10)))
diamonds.samp

#
ggparcoord(data = diamonds.samp, columns = c(2, 8,9,10))

#
mtcars |> 
  rownames_to_column('cars') |> 
  head(5) |> 
  ggparcoord(columns = c(1:5)) +
  facet_wrap(.~cars)


example(ggparcoord)
# 8. ggsurv() - 생존 분석 곡선 (생존 데이터 필요; baseball 데이터셋과 직접 연관 없음)
# 이 예시는 baseball 데이터셋에 적용할 수 없습니다. 생존 분석 데이터셋을 사용해야 합니다.

# 9. ggbivariate() - 이변량 분석 그래프
ggbivariate(baseball, x = "hr", y = "rbi", group = "team")

# 10. ggcoef() - 회귀 모델 계수 시각화
fit <- lm(hr ~ year + rbi + stint, data = baseball)
ggcoef(fit, exponentiate = FALSE)










