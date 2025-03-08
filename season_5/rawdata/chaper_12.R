pacman::p_load(tidyverse, tidymodels)
set.seed(1234)

dt(x = 0, df = 1)

'19_20_uefa_big_5.csv' %>% 
  read.csv() %>% 
  as_tibble -> uefa_big5_match_results

uefa_big5_match_results %>%
  mutate(
    ��� = ��� %>% fct_relevel('�ȹ�', '�湮'),
    �ñ� = �ñ� %>% fct_relevel('BC', 'AC')
  ) -> uefa_big5_match_results

uefa_big5_match_results %>% 
  filter(��� == '�ȹ�' & ���� != '����1') -> uefa_big5_match_results_period  

uefa_big5_match_results_period %>% 
  group_by(��, �ñ�) %>% 
  summarise(�·� = mean(�¸�), .groups = 'drop') -> uefa_big5_results_period

uefa_big5_results_period %>% 
  group_by(�ñ�) %>% 
  summarise(�·� = mean(�·�), .groups = 'drop') 

uefa_big5_results_period %>% 
  t_test(formula =  �·�  ~  �ñ�,
         order = c('AC', 'BC'),
         alternative = 'less')

uefa_big5_results_period %>% 
  t_test(formula =  �·�  ~  �ñ�,
         order = c('AC', 'BC'),
         alternative = 'less',
         var.equal = TRUE)

uefa_big5_results_period  %>% 
  group_by(�ñ�) %>% 
  tally()

uefa_big5_results_period %>% 
  group_by(�ñ�) %>% 
  summarise(��ս·� = mean(�·�), 
            �л� = var(�·�),
            ���� = n(),
            .groups = 'drop')

uefa_big5_results_period %>% 
  t_test(formula =  �·�  ~  �ñ�,
         order = c('AC', 'BC'),
         alternative = 'less')

(.421 - .439) / sqrt(.07697/78 + .0337/78)

(.4213370 - .4388944) / sqrt(.07693693/78 + .03368264/78)

#uefa_big5_results_period %>% 
#  specify(�·� ~ �ñ�) %>%
#  hypothesize(null = 'independence') %>%
#  generate(reps = 1000, type = 'permute') %>%
#  calculate(stat = 'diff in means',
#            order = c('AC', 'BC'))

uefa_big5_results_period %>% 
  specify(�·� ~ �ñ�) %>%
  hypothesize(null = 'independence') %>%
  calculate(stat = 't',
            order = c('AC', 'BC')) -> uefa_big5_results_period_null_theoretical

uefa_big5_results_period_null_theoretical

uefa_big5_results_period_null_theoretical %>% 
  visualize(method = 'theoretical')

uefa_big5_results_period_null_theoretical %>% 
  visualize(method = 'theoretical') +
  shade_p_value(obs_stat = -.466, direction = 'less')

uefa_big5_results_period %>% 
  specify(�·� ~ �ñ�) %>%
  calculate(stat = 't',
            order = c('AC', 'BC')) 

uefa_big5_results_period %>% 
  specify(�·� ~ �ñ�) %>%
  hypothesize(null = 'independence') %>%
  generate(reps = 1000, type = 'permute') %>%
  calculate(stat = 't',
            order = c('AC', 'BC')) %>% 
  visualize(method = 'both') +
  shade_p_value(obs_stat = -.466, direction = 'less')

uefa_big5_results_period %>% 
  t_test(formula =  �·�  ~  �ñ�,
         order = c('AC', 'BC'),
         alternative = 'less', paired = TRUE)

uefa_big5_results_period %>% 
  pivot_wider(names_from='�ñ�', values_from='�·�') %>% 
  mutate(���� = AC - BC) %>% 
  summarise(����_��� = mean(����),
            ����_ǥ������ = sd(����),
            ����_ǥ�ؿ��� = ����_ǥ������ / sqrt(78))     
                 
-.0176 / .0286

uefa_big5_results_period %>% 
  specify(�·� ~ �ñ�) %>%
  hypothesize(null = 'point', mu = 0) %>%
  calculate(stat = 't',
            order = c('AC', 'BC')) %>% 
  visualize(method = 'theoretical') +
  shade_p_value(obs_stat = -.615, direction = 'less')

'19_20_nba.csv' %>% 
  read.csv() %>% 
  as_tibble -> nba_match_results

nba_match_results %>% 
  names()

nba_match_results %>% 
  mutate(
    ��� = ��� %>% fct_relevel('�ȹ�', '�湮'),
    �ñ� = �ñ� %>% fct_relevel('BC', 'AC'),
    ���� = ���� %>% fct_relevel('���Ը���', '�÷��̿���')
  ) -> nba_match_results

nba_match_results %>%
  filter(���� != '�÷��̿���') %>% 
  group_by(��, ���, �ñ�) %>%
  summarise(�·�  = mean(�¸�), .groups = 'drop') %>%
  ggplot(aes(x = ���, y = �·�)) +
  geom_boxplot() +
  facet_grid(. ~ �ñ�)

nba_match_results %>%
  filter(���� != '�÷��̿���') %>% 
  group_by(��, ���, �ñ�) %>%
  filter(��� == '�ȹ�') %>% 
  summarise(�·�  = mean(�¸�), .groups = 'drop') %>% 
  t_test(formula =  �·�  ~  �ñ�,
         order = c('BC', 'AC'),
         paired = TRUE)

nba_match_results %>%
  filter(���� != '�÷��̿���') %>% 
  group_by(��, ���, �ñ�) %>%
  filter(��� == '�ȹ�') %>% 
  summarise(�·�  = mean(�¸�), .groups = 'drop') %>% 
  pivot_wider(names_from = '�ñ�', values_from = '�·�') %>% 
  drop_na()

nba_match_results %>%
  filter(���� != '�÷��̿���') %>% 
  group_by(��, ���, �ñ�) %>%
  filter(��� == '�ȹ�') %>% 
  summarise(�·�  = mean(�¸�), .groups = 'drop') %>% 
  pivot_wider(names_from = '�ñ�', values_from = '�·�') %>% 
  drop_na() %>% 
  pivot_longer(BC:AC, names_to = '�ñ�', values_to = '�·�') %>% 
  t_test(formula =  �·�  ~  �ñ�,
         order = c('BC', 'AC'),
         paired = TRUE)

nba_match_results %>%
  filter(�ñ� == 'BC') %>% 
  group_by(��, ���) %>%
  summarise(�·�  = mean(�¸�), .groups = 'drop') %>% 
  specify(�·� ~ ���) %>% 
  hypothesize(null = 'independence') %>%
  generate(reps = 1000, type = 'permute') %>%
  calculate(stat = 'diff in means',
            order = c('�ȹ�', '�湮')) %>%
  select(stat) %>% 
  mutate(type = 'h0') -> nba_simulation_h0

nba_simulation_h0 %>%
  summarise(low = quantile(stat, .95))

nba_match_results %>%
  filter(�ñ� == 'BC') %>% 
  group_by(��, ���) %>%
  summarise(�·� = mean(�¸�),
              .groups = 'drop')  %>% 
  pivot_wider(names_from = '���',
              values_from = '�·�') %>% 
  mutate(���� = �ȹ� - �湮) %>% 
  rep_sample_n(reps = 1000, size = 30, replace = TRUE) %>% 
  group_by(replicate) %>% 
  summarise(stat = mean(����), .groups = 'drop') %>% 
  select(stat) %>% 
  mutate(type = 'h1') -> nba_simulation_h1

bind_rows(
  nba_simulation_h0,
  nba_simulation_h1
) %>% 
  ggplot(aes(x=stat, fill = type)) +
  geom_histogram(color = 'white',  
                 binwidth = .01, alpha = .5,
                 position = 'identity') +
  geom_vline(xintercept = .0747,
             linetype = 'dashed', lwd=1)

nba_simulation_h1 %>% 
  filter(stat > .0747) %>% 
  tally()

nba_match_results %>%
  filter(�ñ� == 'BC') %>% 
  group_by(��, ���) %>% 
  summarise(�·� = mean(�¸�),
              .groups = 'drop') %>% 
  t_test(�·� ~ ���, order = c('�ȹ�', '�湮'), paired = TRUE)

pacman::p_load(pwr)

args(power.t.test)

nba_match_results %>%
  filter(�ñ� == 'BC') %>%
  group_by(��, ���) %>%
  summarise(�·� = mean(�¸�), .groups = 'drop') %>%
  group_by(���) %>%
  summarise(�·� = mean(�·�), .groups = 'drop')

nba_match_results %>%
  filter(�ñ� == 'BC') %>%
  group_by(��, ���) %>%
  summarise(�·� = mean(�¸�), .groups = 'drop') %>%
  pivot_wider(names_from = '���', values_from = '�·�') %>%
  mutate(���� = �ȹ� - �湮) %>%
  summarise(sd = sd(����))

power.t.test(delta = .106, sd = .158,
             sig.level = .05,
             power = .8,
             type = 'paired',
             alternative = 'one.sided')