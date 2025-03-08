pacman::p_load(tidyverse, tidymodels)

set.seed(1234)

'19_20_uefa_big_5.csv' %>% 
  read.csv() %>% 
  as_tibble -> uefa_big5_match_results

uefa_big5_match_results %>% 
  glimpse()

uefa_big5_match_results %>%
  mutate(
    ��� = ��� %>% fct_relevel('�ȹ�', '�湮'),
    �ñ� = �ñ� %>% fct_relevel('BC', 'AC')
  ) -> uefa_big5_match_results

uefa_big5_match_results %>%
  group_by(��, ���) %>%
  summarise(�·� = mean(�¸�), .groups = 'drop') -> uefa_big5_results

uefa_big5_results %>%
  ggplot(aes(x = ���, y = �·�)) +
  geom_boxplot()

uefa_big5_results %>%
  group_by(���) %>%
  summarise(�·� = mean(�·�), .groups = 'drop')

sample(100, 10)

tibble(
  x = 1:6
) %>% 
  mutate(rest = x %% 2)

uefa_big5_results %>%
  rowwise() %>%
  mutate(���� = sample(nrow(.), 1),
           ����_��� = if_else(���� %% 2 == 0, '�ȹ�', '�湮')
  ) -> uefa_big5_results_permutated

uefa_big5_results_permutated

uefa_big5_results_permutated %>%
  pivot_longer(cols = c('���', '����_���'),
               names_to = '����',
               values_to = '���') %>%
  group_by(��, ����, ���) %>%
  summarise(�·� = mean(�·�), .groups = 'drop') %>%
  ggplot(aes(x = ��� %>% fct_relevel('�ȹ�', '�湮'),
             y = �·�)) +
  geom_boxplot() +
  facet_grid(~����)

uefa_big5_results_permutated %>%
  group_by(����_���) %>%
  summarise(�·� = mean(�·�), .groups = 'drop')

uefa_big5_results %>%
  specify(response = �·�, explanatory = ���)

uefa_big5_results %>%
  specify(formula = �·� ~ ���)

uefa_big5_results %>%
  specify(�·� ~ ���) %>%
  hypothesize(null = 'independence')

uefa_big5_results %>%
  specify(�·� ~ ���) %>%
  hypothesize(null = 'independence') %>%
  generate(reps=1000, type='permute')

uefa_big5_results %>%
  specify(�·� ~ ���) %>%
  hypothesize(null = 'independence') %>%
  generate(reps = 1000, type = 'permute') %>%
  calculate(stat = 'diff in means',
            order = c('�ȹ�', '�湮')) -> uefa_big5_results_null

uefa_big5_results_null %>%
  visualize()

uefa_big5_results_null %>%
  visualize() +
  geom_vline(xintercept = .128,
             color = '#53bfd4',
             lwd = 1)

uefa_big5_results_null %>%
  visualize() +
  geom_vline(xintercept = .05,
             color = '#53bfd4',
             lwd = 1)

uefa_big5_results_null %>%
  filter(stat >= .05)

uefa_big5_results %>%
  specify(formula = �·� ~ ���) %>%
  calculate(stat = 'diff in means',
            order=c('�ȹ�', '�湮'))

uefa_big5_results_null %>%
  get_p_value(obs_stat = .128,
              direction = 'two-sided')

uefa_big5_results_null %>%
  visualize() +
  shade_p_value(obs_stat = .042,
                direction = 'two-sided')

uefa_big5_results_null %>%
  visualize() +
  shade_p_value(obs_stat = .128,
                direction = 'greater')

uefa_big5_results_null %>%
  visualize(fill = 'gray75') +
  shade_p_value(obs_stat = .05,
                direction = ��two-sided��,
                fill = '#53bfd4', color = '#53bfd4')

uefa_big5_results_null %>%
  get_confidence_interval() -> uefa_big5_ci_endpoints

uefa_big5_results_null %>%
  visualize() +
  shade_p_value(obs_stat = .128,
                direction = 'greater') +
  shade_confidence_interval(endpoints = uefa_big5_ci_endpoints)

uefa_big5_match_results %>%
  filter(��� == '�ȹ�' & ���� != '����1') -> uefa_big5_match_results_period

uefa_big5_match_results_period %>%
  group_by(��, �ñ�) %>%
  summarise(�·� = mean(�¸�), .groups = 'drop') -> uefa_big5_results_period

uefa_big5_results_period %>%
  ggplot(aes(x = �ñ�, y = �·�)) +
  geom_boxplot()

uefa_big5_results_period %>%
  group_by(�ñ�) %>%
  summarise(�·� = mean(�·�), .groups = 'drop')

uefa_big5_results_period %>%
  specify(�·� ~ �ñ�) %>%
  hypothesize(null = 'independence') %>%
  generate(reps = 1000, type = 'permute') %>%
  calculate(stat = 'diff in means',
            order = c('AC', 'BC')) -> uefa_big5_results_period_null

uefa_big5_results_period_null %>%
  visualize() +
  shade_p_value(obs_stat = -.018,
                direction = 'less')

uefa_big5_results_period_null %>%
  get_p_value(obs_stat = -.018, direction = 'less')

uefa_big5_results_period %>%
  t_test(formula = �·� ~ �ñ�,
         order = c('AC', 'BC'),
         alternative = 'less')