# Open the data file
with open("rosalind_revc.txt", "r") as dna_file:
	dna = dna_file.readline().rstrip("\n") # Remove the newline
   
revComplement = {"A":"T", "C":"G", "G":"C", "T":"A"}

# Set a new string
revc = "" 

for i in reversed(dna):
    revc = revc + revComplement[i]

print(revc)

