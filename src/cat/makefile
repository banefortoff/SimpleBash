GCC = gcc -std=c11 -Wall -Wextra -Werror
OS = $(shell uname)

all: clean s21_cat

s21_cat:
	$(GCC) -c s21_cat.c
	$(GCC) s21_cat.o -o s21_cat
	rm -rf s21_cat.o

test: clean s21_cat
	chmod 755 test.sh
	./test.sh

clean:
	rm -rf *.o *.out 
	rm -rf s21_cat 
	rm -rf original.txt
	rm -rf s21_cat.txt
	rm -rf result.txt

rebuild: clean all

linter:
	cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	python3 ../../materials/linters/cpplint.py --extensions=c *.c
	python3 ../../materials/linters/cpplint.py --extensions=c *.h
	rm -rf CPPLINT.cfg

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c

memcheck: clean s21_cat mem

mem:
ifeq ($(OS), Linux)
	valgrind --leak-check=full --show-leak-kinds=all ./s21_cat -benst 1 *.txt
else
	leaks --atExit -- ./s21_cat -benst 1 1.txt
endif