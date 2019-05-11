# Rosalind ID: GRPH
# Title: Overlap Graphs

library(Biostrings)

# Open dna file
dna <- readDNAStringSet("~/Rosalind_Python/rosalind_grph.txt", format = "fasta")
dna

for (i in 1:length(dna)) {
  for (j in 1:length(dna)) {
    # Define the first string
    first_string <- dna[i]

    # Define the range of the last three letters of the first string
    end <- width(first_string)
    third_to_end <- end - 2

    # Define the second string
    second_string <- dna[j]

    # Set conditions
    if (i != j & DNAStringSet(first_string, start = third_to_end, end = end) == DNAStringSet(second_string, start = 1, end = 3)) {
      cat(append(names(dna[i]), names(dna[j])), "\n")
    }
  }
}
