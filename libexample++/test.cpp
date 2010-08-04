#include "test.hpp"
#include <string>
#include <sstream>
#include <iostream>

Test::Test(char *str){
  text = std::string(str);
}

Test::Test(int i){
  std::stringstream buf;
  buf << i;
  text = buf.str();
}

std::string Test::get_text() {
  return text;
}

void Test::print() {
  std::cout << text << "\n";
}
