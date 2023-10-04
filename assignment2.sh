

# part 1

cat wages.csv| cut -d "," -f 1,2 | sort -u | sed -E "s/\,/ /" > part1.txt


echo "part 2: "

echo "highest wage:"
cat wages.csv| cut -d "," -f 1,2,4| sort -t, -k 3 -n | tail -n 1

echo "lowest wage:"
cat wages.csv| cut -d "," -f 1,2,4| sort -t, -k 3 -n | head -n 2| tail -n 1

echo "number of females in top ten earners:"
 cat wages.csv| cut -d "," -f 1,2,4| sort -t, -k 3 -n |tail -n 10| grep -c "female"

echo "part 3:"

echo "12 years of school minimum wage:"
lowestWage12=$ cat wages.csv|cut -d, -f 3,4|grep -E "12,"| sort -t, -k2 -n| cut -d, -f2| head -n1


echo "16 years of school minimum wage: "

lowestWage16=$ cat wages.csv|cut -d, -f 3,4|grep -E "16,"| sort -t, -k2 -n| cut -d, -f2| head -n1 


echo "The difference in minumum wage of doing 16 years vs. 12 years of school is:"
echo "lowestWage16 - lowestWage12 | bc" #this would be the method used if bc worked on my computer
