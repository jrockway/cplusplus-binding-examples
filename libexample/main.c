#include "test.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv){
  Test *a = new_int_test(42);
  print_test_text(a);
  free_test(a);
}
