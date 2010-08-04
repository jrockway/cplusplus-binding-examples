#ifndef TEST_H
#define TEST_H

typedef struct Test Test;

Test *new_int_test(int);
Test *new_str_test(char *);
char *get_test_text(Test *);
void print_test_text(Test *);
void free_test(Test *);

#endif
