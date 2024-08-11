#24-0807 wedn 11:46

# Titanic table -> as_tibble()
library(tidyverse)

# table
UCBAdmissions |> str()
UCBAdmissions |> view()

#
as_tibble(UCBAdmissions) |> print(n = 24)
dim(UCBAdmissions)

#합계
rowSums(UCBAdmissions); rowSums(UCBAdmissions, dims = 2)
rowSums(UCBAdmissions); rowSums(UCBAdmissions, dims = 2)
colSums(UCBAdmissions); colSums(UCBAdmissions, dims = 2)

#table 형식 보기
Titanic |> str()
Titanic |> as_tibble()
Titanic |> as_tibble() |> str()

#
Titanic |> as.tibble() |> 
  mutate_at(vars(Class, Sex, Age, Survived), factor) |> 
  mutate(num = row_number(), .before = 1) |> #str()
  pivot_longer(cols = c(Class, Sex, Age, Survived), 
               names_to = 'type', 
               values_to = 'value') |> 
  print(n = 50)

Titanic |> as_tibble() |> 
  filter(Class %in% c('1st')) |> 
  pivot_wider(names_from = Survived, values_from = n) |> 
  rename(Survived_No = No, Survived_Yes = Yes) 

#
ggplot(aes(x = Class)) +
  geom_bar(aes(y = after_stat(count)), stat = 'count') 
