CC = gcc -std=c11
CFLAGS = -Wall -Werror -Wextra
TARGET_GREP = s21_grep
OS = $(shell uname)

all: clean s21_grep

$(TARGET_GREP): s21_grep.o
	$(CC) s21_grep.o -D_GNU_SOURCE $(CFLAGS) -o $@
	rm -rf s21_cat.o

s21_grep.o: s21_grep.c
	$(CC) -c s21_grep.c -D_GNU_SOURCE $(CFLAGS) -o $@

test: clean s21_grep
	chmod 755 test.sh
	./test.sh

clean:
	rm -rf *.o *.out 
	rm -rf s21_grep
	rm -rf original.txt
	rm -rf s21_grep.txt
	rm -rf result.txt

rebuild: clean all

linter:
	cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	python3 ../../materials/linters/cpplint.py --extensions=c *.c
	python3 ../../materials/linters/cpplint.py --extensions=c *.h
	rm -rf CPPLINT.cfg

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c

memcheck: clean s21_grep mem

mem:
ifeq ($(OS), Linux)
	valgrind --leak-check=full --show-leak-kinds=all ./s21_grep -eivnhso 1 *.txt
else
	leaks --atExit -- ./s21_grep -eivnhso 1 3.txt
endif