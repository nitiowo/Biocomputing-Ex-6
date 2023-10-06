# Usage: bash wagesShell.sh 
# Gives info as requested in question 2 of exercise 6 kms

# Gets info for the highest earner 
# Excludes the first row of headers, sorts the data by wage where -k4,4nr is sorting 
# the 4th column in reverse, excludes the 3rd column and prints that first row of the 
#highest wage
echo "Highest Earner Info in order of gender, years of experience, and wage:"
tail -n +2 wages.csv | sort -t, -k4,4nr | head -n 1 | cut -d',' -f1,2,4 

# Gets info for the lowest earner
# Excludes the first row of headers, sorts the data by wage where -k4,4n is sorting    
# the 4th column normally, excludes the 3rd column and prints that first row of the
# highest wage
echo "Lowest Earner Info in order of gender, years of experience, and wage:"
tail -n +2 wages.csv | sort -t, -k4,4n | head -n 1 | cut -d',' -f1,2,4

# Counts number of females in top 10 earners
# Excludes first row of headers, sorts data by wage with highest wage up top, head 
# isolates the first 10 rows, grep -c will count for the number of matches for 
# specificly 'female'
echo "Number of females in the top ten earners in this data set:" 
tail -n +2 wages.csv | sort -t, -k4,4nr | head -n 10 | grep -c 'female'
