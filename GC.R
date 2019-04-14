# Rosalind ID: GC
# Title: Computing GC Content

library(Biostrings)

# Open dna file
dna <- readDNAStringSet("~/Rosalind_Python/rosalind_gc.txt", format = "fasta")
dna

# GC contents by the combined percentage of symbols in the string that are "G" or "C"
gc_contents <- as.data.frame(letterFrequency(dna, c("GC"), as.prob = TRUE))
gc_contents

# Extract the row with maximum GC content
gc_max <- subset(gc_contents, gc_contents == max(gc_contents))
gc_max

# Print the ID of the string having the highest GC content
print(names(dna)[as.numeric(rownames(gc_max))])

# Print GC-content of that string with 6 decimal places
sprintf(gc_max * 100, fmt = '%#.6f')


