# Rosalind ID: SUBS
# Title: Finding a Motif in DNA

library(Biostrings)

# Open data file
strings <- readChar("~/Rosalind_Python/rosalind_subs.txt", nchars = file.info("~/Rosalind_Python/rosalind_subs.txt")$size)
strings

# Split into two 
string_list <- strsplit(strings, "\r\n")

string_list

# Define DNA and motif
dna <- string_list[[1]][1]
motif <- string_list[[1]][2]

# Extract the start locations of the matched motifs
index <- start(matchPattern(motif, dna))

index

# Save the indexes into txt
write.table(index, "Solution_SUBS.txt", row.names = FALSE, col.names = FALSE, sep = "")
