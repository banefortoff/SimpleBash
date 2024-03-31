#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "struct.h"

void parser(int argc, char *argv[], opt *options);
void reader(char *argv[], opt *options, int countTXT);
void funO(char *tmp_line, char *word, opt *options);
void PrintCountTxt(char *argv[], opt *options, int countTXT);
void PrintCountStr(opt *options, int countSTR);

int main(int argc, char *argv[]) {
  int countTXT = 0;
  opt opt = {0};

  parser(argc, argv, &opt);
  countTXT = argc - optind - 1;
  reader(argv, &opt, countTXT);

  return 0;
}

void parser(int argc, char *argv[], opt *options) {
  int opt;
  while ((opt = getopt(argc, argv, "+eivclnhsfo")) != -1) {
    switch (opt) {
      case 'e':
        options->e = 1;
        break;
      case 'i':
        options->i = 1;
        break;
      case 'v':
        options->v = 1;
        break;
      case 'c':
        options->c = 1;
        break;
      case 'l':
        options->l = 1;
        break;
      case 'n':
        options->n = 1;
        break;
      case 'h':
        options->h = 1;
        break;
      case 's':
        options->s = 1;
        break;
      case 'f':
        options->f = 1;
        break;
      case 'o':
        options->o = 1;
        break;
      default:
        fprintf(stderr,
                "usage: grep [-eivclnhso] [-e pattern] [-f file] [file ...]");
        exit(1);
    }
  }
}

void reader(char *argv[], opt *options, int countTXT) {
  char *word = "\0";
  word = argv[optind];
  optind++;
  regex_t regex = {0};
  char *tmp_line = NULL;
  size_t len = 0;
  int suc;
  int compare = 0;
  int regflag = 0;
  int flagC = 1, flagS = 1, flagO = 1, flagVF = 1;
  int countWF = 0;
  char wordArr[100][1024] = {0};

  if (options->f == 1) {
    int fileWord = optind - 1;
    FILE *fp = fopen(argv[fileWord], "r");
    int i = 0;
    while (!feof(fp)) {
      int fix = 0;
      fgets(wordArr[i], sizeof(wordArr[i]), fp);
      fix = strlen(wordArr[i]);
      if (wordArr[i][fix - 1] == '\n') {
        if (fix > 1) {
          wordArr[i][fix - 1] = '\0';
        }
      }
      i++;
    }
    countWF = i;
    fclose(fp);
  }

  if (!options->f) {
    countWF = 1;
  }

  if (options->i == 1) {
    regflag = REG_ICASE;
  } else {
    regflag = 0;
  }

  if (options->v == 1) {
    compare = REG_NOMATCH;
  }

  if (options->v == 1 && options->f) {
    flagVF = 0;
  }

  if (options->c == 1) {
    flagC = 0;
  }

  if (options->s == 1) {
    flagS = 0;
  }

  if (options->o == 1 && !options->c && !options->v && !options->l) {
    flagO = 0;
  }

  for (int i = 0; i < countTXT; i++) {
    int flagL = 1;
    int countC = 0;

    FILE *fp = fopen(argv[optind], "r");

    if (fp) {
      int countSTR = 0;
      while (!feof(fp) && flagL != 0) {
        int flagBreakF = 1;
        int countVF = 0;

        tmp_line = NULL;
        getline(&tmp_line, &len, fp);

        for (int j = 0; j < countWF; j++) {
          if (options->f == 1 && options->o == 1) {
            word = wordArr[j];
          }

          if (flagBreakF == 0 && flagVF == 1) {
            break;
          }

          if (options->f == 1) {
            regcomp(&regex, wordArr[j], regflag);
          } else {
            regcomp(&regex, word, regflag);
          }

          countSTR++;
          if (options->f == 1) {
            if (j > 0) {
              countSTR--;
            }
          }

          suc = regexec(&regex, tmp_line, 0, NULL, 0);
          if (options->v == 1 && tmp_line[0] == '\0') {
            suc = 0;
          }

          if (suc == compare) {
            countC++;
          }

          if (suc == compare && options->v == 1 && options->f == 1) {
            countVF++;
          }

          if (flagO == 0 && suc == compare) {
            PrintCountTxt(argv, options, countTXT);
            PrintCountStr(options, countSTR);
            funO(tmp_line, word, options);
          }

          if (options->l == 1 && suc == compare) {
            if (flagC == 1) {
              printf("%s\n", argv[optind]);
            }
            flagL = 0;
          }

          if (suc == compare && flagL != 0 && flagC != 0 && flagO != 0 &&
              (flagVF == 1 || (j == countWF - 1 && countVF == countWF))) {
            PrintCountTxt(argv, options, countTXT);
            PrintCountStr(options, countSTR);
            printf("%s", tmp_line);

            if (options->f == 1 && !options->v) {
              flagBreakF = 0;
            }

            if (tmp_line[strlen(tmp_line) - 1] != '\n') printf("\n");
          }
          regfree(&regex);
        }
        free(tmp_line);
      }
    } else {
      if (flagS != 0) {
        printf("%s: No such file on directory", argv[optind]);
      }
    }

    if (flagC == 0) {
      PrintCountTxt(argv, options, countTXT);
      printf("%d\n", countC);
      if (flagL == 0) {
        printf("%s\n", argv[optind]);
      }
    }
    fclose(fp);
    optind++;
  }
}

void funO(char *tmp_line, char *word, opt *options) {
  int lenWord = strlen(word);
  char wordArr[1024] = {0};
  int lenStr = strlen(tmp_line);
  char strArr[8192] = {0};
  int count = 0;

  for (int i = 0; i < lenWord; i++) {
    wordArr[i] = word[i];
  }
  for (int i = 0; i < lenStr; i++) {
    strArr[i] = tmp_line[i];
  }

  int j = 0;
  for (int i = 0; i < lenStr; i++) {
    if ((wordArr[j] == strArr[i]) ||
        (options->i == 1 && wordArr[j] + 32 == strArr[i]) ||
        (options->i == 1 && wordArr[j] - 32 == strArr[i])) {
      count++;
      j++;
    }
    if (count != lenWord && j > lenWord) {
      count = 0;
      j = 0;
    }

    if (count == lenWord && options->i == 1) {
      for (int s = lenWord - 1; s >= 0; s--) {
        printf("%c", strArr[i - s]);
      }
      count = 0;
      j = 0;
      printf("\n");
    } else if (count == lenWord && !options->i) {
      printf("%s\n", word);
      count = 0;
      j = 0;
    }
  }
}

void PrintCountTxt(char *argv[], opt *options, int countTXT) {
  if (countTXT > 1 && !options->h) {
    printf("%s:", argv[optind]);
  }
}

void PrintCountStr(opt *options, int countSTR) {
  if (options->n == 1) {
    printf("%d:", countSTR);
  }
}
