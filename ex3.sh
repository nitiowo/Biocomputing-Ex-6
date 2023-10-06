#Usage:

cat wages.csv | sort -t, -n -k 3 | cut -d , -f 3,4 | grep -E "1[2-6]," > hsgrads.txt
hspay=$(cat hsgrads.txt | cut -d, -f 2 | sort -n | head -n 1)

cat wages.csv | sort -t, -n -k 3 | cut -d , -f 3,4 | grep -E "16," > collegegrads.txt
collegepay=$(cat collegegrads.txt | cut -d, -f 2 | sort -n | head -n 1)

echo "$collegepay - $hspay" | bc
