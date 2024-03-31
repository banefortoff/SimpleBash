#!/bin/bash

touch original.txt
touch s21_cat.txt
touch result.txt

#  Без флагов
cat 1.txt >> original.txt
./s21_cat 1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

#  Флаг -b
cat -b 1.txt >> original.txt
./s21_cat -b 1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

#  Флаг -e
cat -e 1.txt >> original.txt
./s21_cat -e 1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

#  Флаг -n
cat -n 1.txt >> original.txt
./s21_cat -n 1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

#  Флаг -s
cat -s 1.txt >> original.txt
./s21_cat -s 1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

#  Флаг -t
cat -t 1.txt >> original.txt
./s21_cat -t 1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

#  Все флаги
cat -benst 1.txt >> original.txt
./s21_cat -benst 1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

#  Все флаги с двумя файлами
cat -benst 1.txt 2.txt >> original.txt
./s21_cat -benst 1.txt 2.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt
