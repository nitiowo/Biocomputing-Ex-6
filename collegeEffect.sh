## Usage: bash collegeEffect.sh 
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

