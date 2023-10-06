##part 1
cat wages.csv | cut -d ',' -f 1,2 | tail -n +2 | sort -t, -u -k 1,1 -k 2,2n | tr ',' ' ' > unique_gender_and_yearsexperience.csv

##part2
echo "Highest Earner:"
he=$(cat wages.csv | sort -t ',' -k4,4rn | head -1)
echo "$he"

echo "Lowest Earner:"
le=$(cat wages.csv | sort -t ',' -k4,4rn | tail -2 | head -1)
echo "$le"

echo "Women in the top 10:"
nw=$(cat wages.csv| sort -t ',' -k4,4rn | head -10 | grep -c "female")
echo "$nw"

##part3
sixteen_Years=$(cat wages.csv | sed -n '/^[^,]*,[^,]*,16/p' | sort -t ',' -k4nr| tail -1 | cut -d ',' -f4)
twelve_Years=$(cat wages.csv | sed -n '/^[^,]*,[^,]*,12/p' | sort -t ',' -k4nr| tail -1 | cut -d ',' -f4)
echo "$sixteen_Years - $twelve_Years" | bc
