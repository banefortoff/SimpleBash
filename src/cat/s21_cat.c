#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

#include "struct.h"

void parser(int argc, char *argv[], opt *options);
int check_flags(opt *options);
void simple_output(FILE *fp);
void reader(char *argv[], opt *options, int countTXT);
int fileExists(const char *fp);

int main(int argc, char *argv[]) {
  int countTXT = 0;
  opt opt = {0};

  parser(argc, argv, &opt);

  countTXT = argc - optind;

  reader(argv, &opt, countTXT);

  return 0;
}

void parser(int argc, char *argv[], opt *options) {
  int opt;
  int option_index;

  static struct option long_options[] = {
      {"number-nonblank", 0, 0, 'b'},
      {"number", 0, 0, 'n'},
      {"squeeze-blank", 0, 0, 's'},
      {0, 0, 0, 0},
  };

  while ((opt = getopt_long(argc, argv, "+benstTE", long_options,
                            &option_index)) != -1) {
    switch (opt) {
      case 'b':
        options->b = 1;
        break;
      case 'e':
        options->e = 1;
        options->v = 1;
        break;
      case 'n':
        options->n = 1;
        break;
      case 's':
        options->s = 1;
        break;
      case 't':
        options->t = 1;
        options->v = 1;
        break;
      case 'T':
        options->t = 1;
        break;
      case 'E':
        options->e = 1;
        break;
      default:
        fprintf(stderr, "usage: cat [-benstuv] [file ...]");
        exit(1);
    }
  }
}

void reader(char *argv[], opt *options, int countTXT) {
  for (int i = 0; i < countTXT; i++) {
    int count = 1;
    char prev = -1;
    char ch;
    int flag = 0, flagS = 0;

    if (check_flags(options) == 1) {
      if (fileExists(argv[optind])) {
        FILE *fp = fopen(argv[optind], "r");
        simple_output(fp);
        fclose(fp);
      } else {
        printf("cat: %s: No such file on directory", argv[optind]);
      }
    } else {
      if (fileExists(argv[optind])) {
        FILE *fp = fopen(argv[optind], "r");
        while ((ch = fgetc(fp)) != EOF) {
          if (options->s && ch == '\n') {
            flagS++;
          } else {
            flagS = 0;
          }

          if (flagS < 3) {
            if ((options->n) && (prev == '\n' || prev == -1) &&
                (options->b == 0)) {
              printf("%6d\t", count);
              count++;
            }

            if ((options->b) && (prev == '\n' || prev == -1) && (ch != '\n')) {
              printf("%6d\t", count);
              count++;
            }

            if (options->v) {
              if ((ch > -1 && ch < 32 && ch != 9 && ch != 10) || ch == 127) {
                printf("^%c", ch + 64);
                flag = 1;
              }
            }

            if ((options->e) && (ch == '\n')) {
              printf("$");
              printf("\n");
              flag = 1;
            }

            if ((options->t) && (ch == '\t')) {
              printf("^I");
              flag = 1;
            }

            if (flag == 0) {
              printf("%c", ch);
            }

            flag = 0;
          }
          prev = ch;
        }
        fclose(fp);
      } else {
        printf("cat: %s: No such file on directory", argv[optind]);
      }
    }

    optind++;
  }
}

void simple_output(FILE *fp) {
  char a;
  while (fscanf(fp, "%c", &a) != EOF) {
    printf("%c", a);
  }
}

int check_flags(opt *options) {
  int flag = 0;
  if ((options->b == 0) && (options->e == 0) && (options->n == 0) &&
      (options->s == 0) && (options->t == 0)) {
    flag = 1;
  }
  return flag;
}

int fileExists(const char *fp) {
  FILE *file;
  int flag = 0;
  if ((file = fopen(fp, "r"))) {
    fclose(file);
    flag = 1;
  }
  return flag;
}
