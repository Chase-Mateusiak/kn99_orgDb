# Description

This has the genome annotations from the gff and the GO annotations from release 61 of FungiDB.  

[Source data is here](https://fungidb.org/common/downloads/release-61/CneoformansKN99/fasta/data/)  

I created this with the help of the friendly people at the bioinformatics 
facility at the Wellcome Centre for Integrative Parasitology, University of 
Glasgow, UK using [this repo](https://github.com/glaParaBio/utils) and this 
command:  

```bash
gla_para_bio_utils/makeBioconductorAnnotationDbi/makeBioconductorAnnotationDbi.r \
    --gff FungiDB-61_CneoformansKN99.gff \
    --gaf FungiDB-61_CneoformansKN99_GO.gaf \
    -g Cryptococcus \
    -s neoformans.var.grubii.KN99 \
    --install
```

# Installation

```R
devtools::install_github("https://github.com/Chase-Mateusiak/kn99_orgDb.git")
```
