#Usage: bash script.sh

cat wages.csv | sort -t , -k 4 -n | cut -d, -f 1,2,4 | tail -n 1
cat wages.csv | sort -t , -k 4 -n | cut -d, -f 1,2,4 | head -n 2 | tail -n 1
cat wages.csv | sort -t , -k 4 -n | cut -d, -f 1,2,4 | tail -n 10 | grep -E "female" -wc
