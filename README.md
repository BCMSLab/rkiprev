# rkiprev

This repo contains data and scripts to generate figures for a book chapter titled:

**Anti-cancer effect of RKIP via modulating autophagy during metastasis**

The following is *Appendix A* from the text which describes the data sources and the method used to generate the figures

## Appendix A. RKIP profile in cancer data & method

### Gene expression in tumor \& normal tissues

The expression level of RKIP in different types of tumor and their corresponding normal tissue were obtained through GEPIA. The web server was accessed through the link [http://gepia.cancer-pku.cn](http://gepia.cancer-pku.cn). The term "PEBP1" was queried and relevant data were retrieved. The dataset consisted of the expression of RKIP in (n=31) tumor and normal tissues from which the cumulative distribution functions were calculated.

### Mutations & copy number alterations in cancer tissue

The mutations and copy number alterations data were obtained from cBioPortal. The web server was accessed through the link [http://www.cbioportal.org](http://www.cbioportal.org). The gene name "PEBP1" was used to query and download the genetic alterations for "All listed studies". The dataset consisted of RKIP mutations and copy number alterations in (n=240) cancer studies. The entries were classified into Altered vs Not altered and Mutated vs Not mutated and used to count the cumulative distribution function.

### Source code & reproducibility

The data were imported and processed in R software environment and used to generate the graph. The source code for reproducing the graph is available online [https://github.com/BCMSLab/rkiprev](https://github.com/BCMSLab/rkiprev).

To reproduce the figures, clone this repo and run `make`.

```bash
git clone https://github.com/BCMSLab/rkiprev
cd rkiprev
make
```

The only requirement in the for running the code properly in R, is the `tidyverse` package. The docker image `rocker/verse` can be used for this purpose.

```bash
docker pull rocker/verse
```

The *final* version of the book chapter can be viewed [here]()
