#ifndef TEST_HPP
#define TEST_HPP

#include <string>

class Test {
public:
  Test(int i);
  Test(char *str);

  std::string get_text();
  void print();

private:
  std::string text;
};

#endif
