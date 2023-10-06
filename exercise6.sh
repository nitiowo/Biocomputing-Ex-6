## shell script to use the file wages.csv to do the following tasks

## Task 1: write file containing unique gender-yearsExpereince combinations from file
# first column = gender, second column = yearsExperience with space as delimitor
# sort rows by gender first and then yearsExperience but keep pairs together

#English process: read wages.csv into standard out = cat 
# cut the first two columns and put into new file
# find all commas and replace with a space as delimitor = sed 's/,/ /g'  
# sort rows as specified in instructions = sort -k 1,1 -k 2,2 
 
cat wages.csv | cut -d , -f 1,2 > genderyearmatches.csv
cat genderyearmatches.csv | sed 's/,/ /g' > genderyearmatches.txt
sort -k1,1 -k2,2n genderyearmatches.txt > finalgenderyearmatches.txt


### Task 2: return following info to stdout 
