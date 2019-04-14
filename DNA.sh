#!/bin/bash
echo "Solutions to problem DNA in Rosalind"

# Solution 1
echo "Solution 1"
sed -e 's/\([A-Z]\)/\1\n/g' rosalind_dna.txt | sort | uniq -c

# Solution 2
echo "Solution 2"
sed -e 's/\(.\)/\1\n/g' rosalind_dna.txt > r
grep -c A r
grep -c C r
grep -c G r
grep -c T r

# Solution 3
echo "Solution 3"
(for i in A C G T; do grep -o $i r | wc -l; done) | tr "\n" " "
