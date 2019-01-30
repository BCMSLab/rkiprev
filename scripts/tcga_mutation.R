# loading required libraries
library(tidyverse)

# loading data
alt <- read_csv('data/tcga_alt.csv')

# generating figure
(alt %>%
    filter(mut != 'not profiled') %>%
    group_by(study, mut) %>%
    summarise(n = n()) %>%
    mutate(mut = ifelse(mut != 'no alteration', 'mutated', 'Not mutated')) %>%
    ggplot(aes(x = n, linetype = mut)) +
    stat_ecdf() +
    theme_bw() +
    labs(x = 'Number of cases (mutation)', y = 'ECDF') +
    theme(legend.position = 'none',
          panel.border = element_rect(size = 1)) +
    annotate('text', c(50, 500),
             y = c(.95, .8),
             label = c('Mutated', 'Not mutated'),
             adj = 0)) %>%
  ggsave(plot = .,
         filename = 'manuscript/figures/tcga_mutation.png',
         width = 8, height = 8, units = 'cm')



