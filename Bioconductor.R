# Codes to play with: Bioconductor for Genomic Data Science ---------------

# Print version information about R, the OS and attached or loaded packages
sessionInfo()

# Check if your installation is fully up-to-date
biocValid()

# R base types ------------------------------------------------------------

# Vectors
x <- 1:8
letters[1:8]

names(x) <- letters[1:8] # Assign names to each integer
x

class(x)
str(x)

anyDuplicated(names(x)) # Chcek if there is any duplicate

# Define integer
x <- 7L
class(x)

y <- 7
class(y)

# List
list_1 <- list(a = rnorm(3), b = letters[1:8])
list_1
list_1[2] # Output is a list
list_1[[2]] # Output is a vector
list_1$b # Output is a vector

# Apply the same function to each list: lapply
list_2 <- list(rnorm(5), 5:10)
lapply(list_2, max)

# Simplified lapply taht returns one single list for all results
sapply(list_2, max)
sapply(list_1, class)

# Biostrings --------------------------------------------------------------

# Load library of full genome sequences for Mus musculus (Mouse) as provided by UCSC (mm10, Dec. 2011)
library(BSgenome.Mmusculus.UCSC.mm10)

# Chromosome names, seqlengths etc.
seqinfo(BSgenome.Mmusculus.UCSC.mm10)

# Inspect mouse genome
genome <- BSgenome.Mmusculus.UCSC.mm10

seqlengths(genome)

genome$chr11

class(genome)

# Check out package Biostrings
library(Biostrings)

dna <- DNAStringSet(c("AACAT", "GGCGCCT"))

# Reverse complement DNA strings
reverseComplement(dna)

# Count GC occurance
letterFrequency(genome$chr11, "GC", as.prob = TRUE) # Took a while to run!!

# IRanges -----------------------------------------------------------------

library(IRanges)

# Find arguments of IRanges
args(IRanges)

# Define start position, end position, gene width and gene names
ir1 <- IRanges(start = c(10, 30, 50), width = c(2, 3, 4), names = c("chr1", "chr2", "chr3"))
ir1

ir2 <- IRanges(start = c(100, 200, 300), end = c(124, 230, 310), names = c("Ins1", "Gcg", "Amy"))
ir2

# Check the start position
start(ir2)

# Re-set the gene width
width(ir2) <- 33
ir2

# Subset IRanges
ir2["Gcg"]
ir2[2] # Output same as above

# rbind two IRanges
c(ir1, ir2)

# Plot IRanges

plotRanges <- function(x, xlim = x, main = deparse(substitute(x)),
                       col = "black", sep = 0.5, ...) {
  height <- 1
  if (is(xlim, "Ranges")) {
    xlim <- c(min(start(xlim)), max(end(xlim)))
  }
  bins <- disjointBins(IRanges(start(x), end(x) + 1))
  plot.new()
  plot.window(xlim, c(0, max(bins) * (height + sep)))
  ybottom <- bins * (sep + height) - height
  rect(start(x) - 0.5, ybottom, end(x) + 0.5, ybottom + height, col = col, ...)
  title(main)
  axis(1)
}

# Define plot grid and margins
par(mfrow = c(3, 1), mar = c(1, 1, 2, 2))

# Define IRanges
ir <- IRanges(start = c(1, 3, 7, 9), end = c(4, 4, 8, 9), names = c("chr1", "chr2", "chr3", "chr4"))
ir

plotRanges(ir)

# Normal IRanges, a minimal representation of the IRanges
reduce(ir)

plotRanges(reduce(ir))

# Union function
ir1
ir2
plotRanges(ir1)
plotRanges(ir2)
plotRanges(union(ir1, ir2))

union(ir1, ir2) == reduce(c(ir1, ir2))

# Find overlap
start(ir2) <- c(20, 32, 51)
ir2

findOverlaps(ir1, ir2)
countOverlaps(ir1, ir2)
subsetByOverlaps(ir1, ir2)
nearest(ir1, ir2)

# GonomicRanges -----------------------------------------------------------

library(GenomicRanges)

# GRanges
args(GRanges)

gr <- GRanges(
  seqnames = c("chr1", "chr2", "chr10"),
  ranges = IRanges(start = c(10, 20, 30), end = c(17, 22, 45)),
  strand = c("+", "-", "+")
)

gr

# Reorder existin seqlevels
seqlevels(gr)
sort(gr)

seqlevels(gr) <- c("chr1", "chr10", "chr2")
seqlevels(gr)
sort(gr)

# Add species info
genome(gr) <- "mm10"
seqinfo(gr)

# Calculate flanking sequence in strand direction
flank(gr, 5)

# Function promoters
args(promoters)
promoters(gr, upstream = 2000, downstream = 200)

# Function gaps
args(gaps)
gr
gaps(gr)

# DataFrame (more versatile than data.frame)
genes <- IRanges(start = 1:3, width = 2)
df_genes <- DataFrame(genes = genes, index = rnorm(3))
df_genes

df_genes[1, 2]
df_genes[1, 1]

df_genes$index

# Add DataFrame to GRanges
values(gr) <- DataFrame(index = rnorm(3))
gr

values(gr)

gr$index

gr$index2 <- gr$index * 100
gr

# Convert data.frame to GRanges
df <- data.frame(chr = c("chr1", "chr10", "chr2"), start = 1:3, end = 12:14, strand = "+", index = rnorm(3))
df

makeGRangesFromDataFrame(df, keep.extra.columns = TRUE)

# Delete rows from GRanges
seqlevels(gr, pruning.mode = "coarse") <- "chr10"
gr

# Keep rows from GRanges
keepSeqlevels(gr, "chr1", pruning.mode = "coarse")

# Rename chromosomes with NCBI styles
newStyle <- mapSeqlevels(seqlevels(gr), "Ensembl")
newStyle

gr <- renameSeqlevels(gr, newStyle)
gr

# AnnotationHub
library(AnnotationHub)

# Create an AnnotationHub project
ah <- AnnotationHub()

# Search the hub for Genome Reference Consortium Mouse Build 38 (GRCm38)
mcols(query(ah, c("GRCm38", "dna", "assembly", "2018")))[, c("title", "rdatadateadded", "sourceurl"), drop = FALSE]

# Display information in Viewer panel
ah_mouse <- query(ah, c("GRCm38", "dna", "assembly", "2018"))

display(ah_mouse)

# Download a file
AH65840 <- ah[["AH65840"]]
AH65840                