#usage: bash homework6.sh

##Question 1
cat wages.csv | cut -d , -f 1,2 | tail -n +2 | sort -t , -u -k 1,1 -k 2,2n | tr ',' ' ' > genderyrexp.txt


##Question 2
echo "Lowest earner:"
cat wages.csv | cut -d , -f 1,2,4 | tail -n +2 | sort -t , -k 3,3n | head -n 1
echo "Highest earner:"
cat wages.csv | cut -d , -f 1,2,4 | tail -n +2 | sort -t , -k 3,3n | tail -n 1
echo "Number of females in top ten earners:"
cat wages.csv | cut -d , -f 1,2,4 | tail -n +2 | sort -t , -k 3,3n | tail -n 10 | grep -c "female"

##Question 3

#get minimum wage for 12 years of school
minwage_12=$(cat wages.csv | cut -d , -f 3,4 | tail -n +2 | grep "12," | sort -t , -k 2,2n | cut -d , -f 2 | head -n 1)
#get minimum wage for 16 years of school
minwage_16=$(cat wages.csv | cut -d , -f 3,4 | tail -n +2 | grep "16," | sort -t , -k 2,2n | cut -d , -f 2 | head -n 1)

#find difference between minimums
mindifference=$(echo "$minwage_16 - $minwage12" | bc)

#NOTE: The bc command does not work on my system, but I tried my code on my friend's laptop and it worked on her system (I have a Windows, she has a Mac).
#When I tested my code on my friend's laptop, the difference I got was about 4.0816.
echo "The difference between the minimum wage made by a worker who had 16 years of school versus 12 years of school is " $mindifference



