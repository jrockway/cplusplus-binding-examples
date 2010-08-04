#include "test.hpp"
#include <string>
#include <iostream>

int main(int argc, char **argv){
  Test *a;

  a = new Test((char *)"this is a test");
  a->print();
  std::cout << "me printing the first thing: " << a->get_text() << "\n";
  delete a;

  a = new Test(42);
  a->print();
  std::cout << "me printing the second thing: " << a->get_text() << "\n";
  delete a;
}
