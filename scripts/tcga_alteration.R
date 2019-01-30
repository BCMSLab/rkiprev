# loading required libraries
library(tidyverse)

# loading data
alt <- read_csv('data/tcga_alt.csv')

# generating figures
(alt %>%
   filter(cna != 'not profiled') %>%
   group_by(study, cna) %>%
   summarise(n = n()) %>%
   mutate(cna = ifelse(cna != 'no alteration', 'altered', cna)) %>%
   ggplot(aes(x = n, linetype = cna)) +
   stat_ecdf() +
   theme_bw() +
   labs(x = 'Number of cases (alteration)', y = 'ECDF') +
   theme(legend.position = 'none',
         panel.border = element_rect(size = 1)) +
   annotate('text', c(100, 600),
             y = c(.95, .8),
             label = c('Altered', 'Not altered'),
             adj = 0)) %>%
  ggsave(plot = .,
         filename = 'manuscript/figures/tcga_alteration.png',
         width = 8, height = 8, units = 'cm')