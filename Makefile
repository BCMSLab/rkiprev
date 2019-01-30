#!/bin/bash

R_OPT=--vanilla

SCRIPTS=scripts

MANUSCRIPT=manuscript
FIG_DIR=manuscript/figures
TAB_DIR=manuscript/tables

LOG=log

all: dir_tree \
	$(FIG_DIR)/gepia_exprs.png \
	$(FIG_DIR)/tcga_mutation.png \
	$(FIG_DIR)/tcga_alteration.png
	
dir_tree:
	test ! -d $(LOG) && mkdir $(LOG) || echo '$(LOG)/ is already there.'
	test ! -d $(MANUSCRIPT) && mkdir $(MANUSCRIPT) || echo '$(MANUSCRIPT)/ is already there.'
	test ! -d $(FIG_DIR) && mkdir $(FIG_DIR) || echo '$(FIG_DIR)/ is already there.'

$(FIG_DIR)/%.png: $(SCRIPTS)/%.R data/*
	R CMD BATCH $(R_OPT) $(SCRIPTS)/$(<F) $(LOG)/$(<F).Rout