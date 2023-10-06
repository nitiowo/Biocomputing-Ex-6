#!/bin/bash
# Usage: ./threetasks.sh

# Task 1: Create a file with unique gender-yearsExperience combinations
sed '1d' wages.csv | cut -d , -f1,2 | sort -t, -k1,1 -k2n | sed 's/,/ /g' > gender-yearsExperience.txt

# Task 2: Find highest earner, lowest earner, and count of females in the top ten earners
highest_earner=$(sed '1d' wages.csv | sort -t, -k4nr,4 | head -n 1 | cut -d ',' -f1,2,4)
lowest_earner=$(tail -n +2 wages.csv | sort -t, -k4n,4 | head -n 1 | cut -d ',' -f1,2,4)
top_earners=$(tail -n +2 wages.csv | sort -t, -k4nr,4 | head -n 10 | grep ",female," | wc -l)

# Task 3: Calculate the effect of graduating college on minimum wage
college_wage=$(tail -n +2 wages.csv | grep ",16," | sort -t, -k4n,4 | head -n 1 | cut -d ',' -f4)
high_school_wage=$(tail -n +2 wages.csv | grep ",12," | sort -t, -k4n,4 | head -n 1 | cut -d ',' -f4)
wage_difference=$(echo "$college_wage - $high_school_wage" | bc)

# Print the results
echo "Task 1: Unique gender-yearsExperience combinations saved to gender-yearsExperience.txt"
echo "Task 2: Highest Earner: $highest_earner"
echo "        Lowest Earner: $lowest_earner"
echo "        Number of Females in Top Ten Earners: $top_earners"
echo "Task 3: Effect of Graduating College on Minimum Wage: $wage_difference"

