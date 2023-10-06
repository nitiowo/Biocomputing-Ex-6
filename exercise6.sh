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


### Task 2: return following info to stdout with labels of what they are
#a) gender, yearsExperience, and wage for highest earner

cat wages.csv |cut -d , -f 1,2,4 | sed 's/,/ /g'| sort -k 3n | tail -n 1 

#b) gender, yearsExperience, and wage for lowest earner

cat wages.csv |cut -d , -f 1,2,4 | sed 's/,/ /g'| sort -k 3n | head -n 2

#c) number of females in top 10 earners in data set

cat wages.csv |cut -d , -f 1,2,4 | sed 's/,/ /g'| sort -k 3n | tail -n 10 | grep -E "female" | wc -l

### Task 3: return to stdout the effect of graduating college (12 vs 16 years of school) on min wage for earners in the dataset
##... This means to find the lowest min wage earner for 12 years of school and 16 and subtract those earnings 

#first need to find each of these 2 values, assign them to variables to store them and then do subtraction with the 2 variables to find the answer

low12wage=$(cat wages.csv | cut -d , -f 3,4 | grep -E "^12" | sed 's/,/ /g' | sort -k 2n | head -n 1 | cut -d " " -f 2)

low16wage=$(cat wages.csv | cut -d , -f 3,4 | grep -E "^16" | sed 's/,/ /g' | sort -k 2n | head -n 1 | cut -d " " -f 2)

echo "$low16wage - $low12wage" | bc
