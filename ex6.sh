# from the given dataset, fulfill the activities and steps listed under the exercise 6 activity

##Usage: bash ex6.sh given_file($1)

cat $1 | sort -t , -k 4 -n -r > tempEarnerInfo.txt

echo "Top earner info" > earnerInfo.txt
cat tempEarnerInfo.txt | head -n 1 >> earnerInfo.txt

echo "Lowest earner info" >> earnerInfo.txt
cat tempEarnerInfo.txt | tail -n 2 | head -n 1 >> earnerInfo.txt

echo "Females in top 10 earners" >> earnerInfo.txt
cat tempEarnerInfo.txt | head -n 10 | grep -c "female" >> earnerInfo.txt

cat $1 | grep -e "12,.\." > highSchoolGrads.txt
cat $1 | grep -e "16,.\." > collegeGrads.txt

lowestHighSchoolEarner=$(cat highSchoolGrads.txt | cut -d , -f 4 | sort -n -r | tail -n 1)
lowestCollegeEarner=$(cat collegeGrads.txt | cut -d , -f 4 | sort -n -r | tail -n 1)

echo "College Graduation Minimum Wage Difference" >> earnerInfo.txt
echo $lowestCollegeEarner - $lowestHighSchoolEarner | bc >>earnerInfo.txt
