# Print version information about R, the OS and attached or loaded packages
sessionInfo()

# Check if your installation is fully up-to-date
biocValid()

# Load library of full genome sequences for Mus musculus (Mouse) as provided by UCSC (mm10, Dec. 2011)
library(BSgenome.Mmusculus.UCSC.mm10)

# Inspect mouse genome
genome <- BSgenome.Mmusculus.UCSC.mm10

seqlengths(genome)

genome$chr11

class(genome)

# Check out package Biostrings
library(Biostrings)

dna <- DNAStringSet(c("AACAT", "GGCGCCT"))

reverseComplement(dna)

letterFrequency(genome$chr11, "GC", as.prob = TRUE) # Took a while to run!!
