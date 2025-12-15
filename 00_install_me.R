## Key libraries to install
# tidyverse - focuses on reworking R coding clarity and logic flow
# patchwork - complex plot assembly functions
# DESeq2 - the RNA-seq statistical analysis framework
# DESeq2 is based on the limma R package, so will also install limma and related libraries


## Required packages can be installed with the following commands:
install.packages("rmarkdown")
install.packages("tidyverse")
install.packages("patchwork")
install.packages("BiocManager")
BiocManager::install("DESeq2")

## Check that the packages load without error by running the following commands:
library(tidyverse)
library(patchwork)
library(DESeq2)