# Usage: homework_6.sh

# Question 1

cut -d',' -f1,2 wages.csv | sed '1d' | sort -t',' -u -k1,1 -k2,2n | tr ',' ' ' > gender_yearsExperience.txt 


## Question 2

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

## Question 3

# Looks at college effect in the csv file slay

# Finds the lowest wage earned by a high school graduate of 12 years education +
# stores it as lowest_wage_12
lowest_wage_12=$(tail -n +2 wages.csv | grep ',12,' | cut -d',' -f4 | sort -t, -n -k1,1 | head -n 1)

# Finds the lowest wage earned by a high school graduate of 16 years education +
# stores it as lowest_wage_16, I put commas in the grep to prevent it from finding
# the number 16 in the wages part
lowest_wage_16=$(tail -n +2 wages.csv | grep ',16,' | cut -d',' -f4 | sort -t, -n -k1,1 | head -n 1)

# Looks at the difference in lowest wages
difference=$(echo "$lowest_wage_16 - $lowest_wage_12" | bc)

echo "The difference between the lowest wage of a 16 years of school
worker and a 12 years of schoool worker is: "$difference

