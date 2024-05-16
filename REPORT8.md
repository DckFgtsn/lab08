## Homework
1. Создать файл Dockerfile с такимсодержимым:
```sh
FROM ubuntu:22.04

RUN apt update
RUN apt install -yy gcc g++ cmake git

COPY . print/
WORKDIR print

RUN git submodule update --init --recursive
RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install

ENV LOG_PATH /home/logs/log.txt

VOLUME /home/logs

WORKDIR _install/bin

ENTRYPOINT ./example2
```
2. Создаём папку logs и в ней создаём пустой log.txt
3. Делаем исполняемый файл, у меня файл examples/example2.cpp с таким содержанием:
```sh
#include <print.hpp>

#include <fstream>

int main(int argc, char** argv)
{
  std::ofstream file("/home/logs/log.txt");
  print(std::string("hello"), file);
}
```
4. Убеждаемся в том, что все CMakeLists.txt прописаны правильно, и всё корректно собирается
5. Запускаем Docker:
```sh
docker build -t logger .
```
6. Запускаем программу в Докере:
```sh
docker run -it -v "$(pwd)/logs/:/home/logs/" logger
```
7. Убеждаемся в работоспособности, проверив файл logs/log.txt, в нём должно появиться слово hello.
8. В yml файле перед компиляцией и сборкой проекта написать:
```sh
    - name: Docker
      run: |
        docker build -t logger .
```
