#!/bin/bash

touch original.txt
touch s21_grep.txt
touch result.txt

#  Флаг -e
echo ------------------- flag -e: -------------------- >> result.txt

grep -e Test 1.txt 2.txt >> original.txt
./s21_grep -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -i -e  Test 1.txt 2.txt >> original.txt
./s21_grep -i -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -v -e Test 1.txt 2.txt >> original.txt
./s21_grep -v -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -c -e Test 1.txt 2.txt >> original.txt
./s21_grep -c -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -l -e Test 1.txt 2.txt >> original.txt
./s21_grep -l -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -n -e Test 1.txt 2.txt >> original.txt
./s21_grep -n -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -h -e Test 1.txt 2.txt >> original.txt
./s21_grep -h -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -s -e Test 1.txt 2.txt >> original.txt
./s21_grep -s -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -e Test 1.txt 2.txt >> original.txt
./s21_grep -o -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -e Test 1.txt 2.txt >> original.txt
./s21_grep -o -e Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt


# Флаг -e с одним файлом
grep -e  Test 1.txt >> original.txt
./s21_grep -e Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -i -e  Test 1.txt >> original.txt
./s21_grep -i -e Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -v -e Test 1.txt >> original.txt
./s21_grep -v -e Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -c -e Test 1.txt>> original.txt
./s21_grep -c -e Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -l -e Test 1.txt >> original.txt
./s21_grep -l -e Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -n -e Test 1.txt >> original.txt
./s21_grep -n -e Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -h -e Test 1.txt >> original.txt
./s21_grep -h -e Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -s -e Test 1.txt >> original.txt
./s21_grep -s -e Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -e Test 1.txt  >> original.txt
./s21_grep -o -e Test 1.txt  >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt


#  Флаг -i
echo ------------------- flag -i: -------------------- >> result.txt

grep -i Test 1.txt 2.txt >> original.txt
./s21_grep -i Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -iv Test 1.txt 2.txt >> original.txt
./s21_grep -iv Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ic Test 1.txt 2.txt >> original.txt
./s21_grep -ic Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -il Test 1.txt 2.txt >> original.txt
./s21_grep -il Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -in Test 1.txt 2.txt >> original.txt
./s21_grep -in Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ih Test 1.txt 2.txt >> original.txt
./s21_grep -ih Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -is Test 1.txt 2.txt >> original.txt
./s21_grep -is Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -i Test 1.txt 2.txt >> original.txt
./s21_grep -o -i Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -i -f 3.txt 2.txt 1.txt >> original.txt
./s21_grep -i -f 3.txt 2.txt 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

# Флаг -i с одним файлом
grep -i Test 1.txt >> original.txt
./s21_grep -i Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -iv Test 1.txt >> original.txt
./s21_grep -iv Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ic Test 1.txt >> original.txt
./s21_grep -ic Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -il Test 1.txt >> original.txt
./s21_grep -il Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -in Test 1.txt >> original.txt
./s21_grep -in Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ih Test 1.txt >> original.txt
./s21_grep -ih Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -is Test 1.txt >> original.txt
./s21_grep -is Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -i Test 1.txt  >> original.txt
./s21_grep -o -i Test 1.txt  >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -i -f 1.txt 2.txt >> original.txt
./s21_grep -i -f 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

#  Флаг -v
echo ------------------- flag -v: -------------------- >> result.txt

grep -v Test 1.txt 2.txt >> original.txt
./s21_grep -v Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vc Test 1.txt 2.txt >> original.txt
./s21_grep -vc Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vl Test 1.txt 2.txt >> original.txt
./s21_grep -vl Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vn Test 1.txt 2.txt >> original.txt
./s21_grep -vn Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vh Test 1.txt 2.txt >> original.txt
./s21_grep -vh Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vs Test 1.txt 2.txt >> original.txt
./s21_grep -vs Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -v Test 1.txt 2.txt >> original.txt
./s21_grep -o -v Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -v -f 3.txt 2.txt 1.txt >> original.txt
./s21_grep -v -f 3.txt 2.txt 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

# Флаг -v с одним файлом
grep -v Test 1.txt >> original.txt
./s21_grep -v Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vc Test 1.txt >> original.txt
./s21_grep -vc Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vl Test 1.txt >> original.txt
./s21_grep -vl Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vn Test 1.txt >> original.txt
./s21_grep -vn Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vh Test 1.txt >> original.txt
./s21_grep -vh Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -vs Test 1.txt >> original.txt
./s21_grep -vs Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -v Test 1.txt  >> original.txt
./s21_grep -o -v Test 1.txt  >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -v -f 3.txt 2.txt >> original.txt
./s21_grep -v -f 3.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

#  Флаг -c
echo ------------------- flag -c: -------------------- >> result.txt

grep -c Test 1.txt 2.txt >> original.txt
./s21_grep -c Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -cl Test 1.txt 2.txt >> original.txt
./s21_grep -cl Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -cn Test 1.txt 2.txt >> original.txt
./s21_grep -cn Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ch Test 1.txt 2.txt >> original.txt
./s21_grep -ch Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -cs Test 1.txt 2.txt >> original.txt
./s21_grep -cs Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -c Test 1.txt 2.txt >> original.txt
./s21_grep -o -c Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -c -f 3.txt 2.txt 1.txt >> original.txt
./s21_grep -c -f 3.txt 2.txt 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

# Флаг -c с одним файлом
grep -c Test 1.txt >> original.txt
./s21_grep -c Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -cl Test 1.txt >> original.txt
./s21_grep -cl Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -cn Test 1.txt >> original.txt
./s21_grep -cn Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ch Test 1.txt >> original.txt
./s21_grep -ch Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -cs Test 1.txt >> original.txt
./s21_grep -cs Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -c Test 1.txt  >> original.txt
./s21_grep -o -c Test 1.txt  >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -c -f 3.txt 2.txt >> original.txt
./s21_grep -c -f 3.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

#  Флаг -l
echo ------------------- flag -l: -------------------- >> result.txt

grep -l Test 1.txt 2.txt >> original.txt
./s21_grep -l Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ln Test 1.txt 2.txt >> original.txt
./s21_grep -ln Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -lh Test 1.txt 2.txt >> original.txt
./s21_grep -lh Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ls Test 1.txt 2.txt >> original.txt
./s21_grep -ls Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -l Test 1.txt 2.txt >> original.txt
./s21_grep -o -l Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -l -f 3.txt 2.txt 1.txt >> original.txt
./s21_grep -l -f 3.txt 2.txt 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

# Флаг -l с одним файлом
grep -l Test 1.txt >> original.txt
./s21_grep -l Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ln Test 1.txt >> original.txt
./s21_grep -ln Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -lh Test 1.txt >> original.txt
./s21_grep -lh Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ls Test 1.txt >> original.txt
./s21_grep -ls Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -l Test 1.txt  >> original.txt
./s21_grep -o -l Test 1.txt  >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -l -f 3.txt 2.txt >> original.txt
./s21_grep -l -f 3.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

#  Флаг -n
echo ------------------- flag -n: -------------------- >> result.txt

grep -n Test 1.txt 2.txt >> original.txt
./s21_grep -n Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -nh Test 1.txt 2.txt >> original.txt
./s21_grep -nh Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ns Test 1.txt 2.txt >> original.txt
./s21_grep -ns Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -n Test 1.txt 2.txt >> original.txt
./s21_grep -o -n Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -n -f 3.txt 2.txt 1.txt >> original.txt
./s21_grep -n -f 3.txt 2.txt 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

# Флаг -n с одним файлом
grep -n Test 1.txt >> original.txt
./s21_grep -n Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -nh Test 1.txt >> original.txt
./s21_grep -nh Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -ns Test 1.txt >> original.txt
./s21_grep -ns Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -n Test 1.txt  >> original.txt
./s21_grep -o -n Test 1.txt  >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -n -f 3.txt 2.txt >> original.txt
./s21_grep -n -f 3.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

#  Флаг -h
echo ------------------- flag -h: -------------------- >> result.txt

grep -h Test 1.txt 2.txt >> original.txt
./s21_grep -h Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -hs Test 1.txt 2.txt >> original.txt
./s21_grep -hs Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -h Test 1.txt 2.txt >> original.txt
./s21_grep -o -h Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -h -f 3.txt 2.txt 1.txt >> original.txt
./s21_grep -h -f 3.txt 2.txt 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

# Флаг -h с одним файлом
grep -h Test 1.txt >> original.txt
./s21_grep -h Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -hs Test 1.txt >> original.txt
./s21_grep -hs Test 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -h Test 1.txt  >> original.txt
./s21_grep -o -h Test 1.txt  >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -h -f 3.txt 2.txt >> original.txt
./s21_grep -h -f 3.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

#  Флаг -s
echo ------------------- flag -s: -------------------- >> result.txt

grep -s Test 1.txt 2.txt >> original.txt
./s21_grep -s Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -s Test 1.txt 2.txt >> original.txt
./s21_grep -o -s Test 1.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -s -f 3.txt 2.txt 1.txt >> original.txt
./s21_grep -s -f 3.txt 2.txt 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

# Флаг -s с одним файлом
grep -s Test 1.txt  >> original.txt
./s21_grep -s Test 1.txt  >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -o -s Test 1.txt  >> original.txt
./s21_grep -o -s Test 1.txt  >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

grep -s -f 3.txt 2.txt >> original.txt
./s21_grep -s -f 3.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

#  Флаг -of
echo ------------------- flag -of: ------------------- >> result.txt

grep -o -f 3.txt 2.txt 1.txt >> original.txt
./s21_grep -o -f 3.txt 2.txt 1.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt

# Флаг -s с одним файлом
grep -o -f 3.txt 2.txt >> original.txt
./s21_grep -o -f 3.txt 2.txt >> s21_grep.txt
diff -s original.txt s21_grep.txt >> result.txt