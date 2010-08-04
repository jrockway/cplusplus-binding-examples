#include "test.hpp"

extern "C" {
#include <stdlib.h>
#include <string.h>
#include "test.h"

  Test *new_int_test(int i) {
    return new Test(i);
  }

  Test *new_str_test(char *str){
    return new Test(str);
  }

  char *get_test_text(Test *t){
    return const_cast<char *> (t->get_text().c_str());
  }

  void print_test_text(Test *t){
    t->print();
  }

  void free_test(Test *t){
    delete t;
  }
}
