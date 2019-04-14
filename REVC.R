# Rosalind ID: REVC
# Title: Complementing a Strand of DNA

library(Biostrings)

# Open dna file
dna <- readChar("~/Rosalind_Python/rosalind_revc.txt", nchars = file.info("~/Rosalind_Python/rosalind_revc.txt")$size)
dna

# Remove \r\n at the end of dna sequence
dna_v2 <- gsub("\r\n", "", dna)
dna_v2

# Turn input into XStringSet objects
dna_v3 <- DNAStringSet(dna_v2)

# Reverse completment and print as characters
as.character(reverseComplement(dna_v3))
