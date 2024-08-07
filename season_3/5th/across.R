#24-0807 wedn 09:50
# across

# 
library(tidyverse)

# 여러열을 변환
# 데이터 프레임 예시
(df <- data.frame(
  var1 = c("a", "b", "c", "a"),
  var2 = c("x", "y", "z", "x"),
  var3 = c(1, 2, 3, 1)))
str(df)

# across()를 사용하여 여러 열을 factor로 변환
df %>%
  mutate(across(c(var1, var2), factor)) |> 
  str()

#
(df <- data.frame(
  group = c("A", "A", "B", "B"),
  var1 = c(1, 2, 3, 4),
  var2 = c(5, 6, 7, 8)))

# across()를 사용하여 여러 열의 합계를 계산
(summary_df <- df %>%
  group_by(group) %>%
  summarise(across(c(var1, var2), sum, na.rm = TRUE)))

#
df |> 
  reframe(across(c(var1, var2), sum))
