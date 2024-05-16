#include <print.hpp>

#include <fstream>

int main(int argc, char** argv)
{
  //std::string file_name = argv[1];//ожидается путь до log.txt
  std::ofstream file("/home/logs/log.txt");
  print(std::string("hello"), file);
}
