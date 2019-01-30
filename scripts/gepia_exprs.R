# loading required libraries
library(tidyverse)

# loading data
expr <- read_csv('data/gepia_exprs.csv')

# generating figure
(expr %>%
    gather(type, count, -study) %>%
    ggplot(aes(x = count, linetype = type)) +
    stat_ecdf() +
    theme_bw() +
    labs(x = 'Gene Epression', y = 'ECDF') +
    theme(legend.position = 'none',
          panel.border = element_rect(size = 1))+
    annotate('text', c(50, 750),
             y = c(.95, .8),
             label = c('Tumor', 'Normal'),
             adj = 0)) %>%
  ggsave(plot = .,
         filename = 'manuscript/figures/gepia_exprs.png',
         width = 8, height = 8, units = 'cm')