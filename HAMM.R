# Rosalind ID: HAMM
# Title: Counting Point Mutations

library(Biostrings)
library(stringr)

# Open dna file
dna <- readChar("~/Rosalind_Python/rosalind_hamm.txt", nchars = file.info("~/Rosalind_Python/rosalind_hamm.txt")$size)
dna

# Split into two 
dna_list <- strsplit(dna, "\r\n")

dna_list

# Store as two DNA strings
seq1 <- DNAString(dna_list[[1]][1])
seq2 <- DNAString(dna_list[[1]][2])

# Compare DNA strings
seq_align <- compareStrings(seq1, seq2)

seq_align

# Mismatched symbols are calculated as whole seq length minus the sum of valid DNA alphabets
str_length(seq_align) - sum(str_count(seq_align, c("A", "T", "G", "C")))


