# loading required libraries
library(tidyverse)

# loading data

expr <- read_csv('gepia_exprs.csv')
alt <- read_csv('tcga_alt.csv')

(expr %>%
  gather(type, count, -study) %>%
  ggplot(aes(x = count, color = type)) +
  stat_ecdf() +
  theme_bw() +
  labs(x = 'Gene Epression', y = 'ECDF') +
  theme(legend.position = 'none')+
    annotate('text', c(50, 600),
             y = c(.95, .8),
             label = c('Tumor', 'Normal'),
             adj = 0)) %>%
  ggsave(plot = .,
         filename = 'manuscript/figures/gepia_exprs.png',
         width = 8, height = 8, units = 'cm')

cna <- alt %>%
  filter(cna != 'not profiled') %>%
  group_by(study, cna) %>%
  summarise(n = n())

cna %>%
  group_by(cna) %>%
  summarise(sum(n))

(cna %>%
  mutate(cna = ifelse(cna != 'no alteration', 'altered', cna)) %>%
  ggplot(aes(x = n, group = cna)) +
  stat_ecdf() +
  theme_bw() +
  labs(x = 'Number of cases (alteration)', y = 'ECDF') +
  theme(legend.position = 'none') +
  annotate('text', c(100, 600),
           y = c(.9, .8),
           label = c('Altered', 'Not altered'),
           adj = 0)) %>%
  ggsave(plot = .,
         filename = 'manuscript/figures/tcga_alteration.png',
         width = 8, height = 8, units = 'cm')

mut <- alt %>%
  filter(mut != 'not profiled') %>%
  group_by(study, mut) %>%
  summarise(n = n())

mut %>%
  group_by(mut) %>%
  summarise(n = sum(n)) %>%
  arrange(desc(n))

(mut %>%
  mutate(mut = ifelse(mut != 'no alteration', 'mutated', 'Not mutated')) %>%
  ggplot(aes(x = n, group = mut)) +
  stat_ecdf() +
  theme_bw() +
  labs(x = 'Number of cases (mutation)', y = 'ECDF') +
  theme(legend.position = 'none') +
    annotate('text', c(50, 500),
             y = c(.95, .8),
             label = c('Mutated', 'Not mutated'),
             adj = 0)) %>%
  ggsave(plot = .,
         filename = 'manuscript/figures/tcga_mutation.png',
         width = 8, height = 8, units = 'cm')



