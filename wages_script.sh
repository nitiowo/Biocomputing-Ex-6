#usage: bash gender_years_experience.sh

cat wages.csv| tail -n +2 | sort -t, -k1,1 -k2,2n | cut -d , -f1,2 | sed 's/,/ /g' >> gender_experience_yrs.txt

echo Highest Earner:
cat wages.csv | sort -t, -k4,4n | cut -d , -f 1,2,4 | tail -1


echo $'\n'Lowest Earner: 
cat wages.csv | sort -t, -k4,4n | cut -d , -f 1,2,4 | head -2 | tail -1


echo $'\n'Highest 10 paid females:
cat wages.csv | sort -t, -k4,4n | cut -d , -f 1,4 | grep 'female' | tail -10 

echo $'\n'Difference in Minimum wage for 12 vs 16 Years of Schooling:
val1=$(cat wages.csv | sort -t, -k4,4n | cut -d , -f 3,4 | grep 16, | cut -d , -f 2 | head -1)
val2=$(cat wages.csv | sort -t, -k4,4n | cut -d , -f 3,4 | grep 12, | cut -d , -f 2 | head -1)
echo "$val1 - $val2" | bc  


