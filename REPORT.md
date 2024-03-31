## Homework

### Part I

1. Создайте пустой репозиторий на сервисе github.com (или gitlab.com, или bitbucket.com).
2. Выполните инструкцию по созданию первого коммита на странице репозитория, созданного на предыдещем шаге.
```sh
$ git remote add origin https://github.com/${GITHUB_USERNAME}/lab02.git
$ touch README.md
$ git add README.md
$ git commit -m"added README.md"
$ git push origin master
```
3. Создайте файл `hello_world.cpp` в локальной копии репозитория (который должен был появиться на шаге 2). Реализуйте программу **Hello world** на языке C++ используя плохой стиль кода. Например, после заголовочных файлов вставьте строку `using namespace std;`.
```sh
$ touch hellworld.cpp
```
4. Добавьте этот файл в локальную копию репозитория.
```sh
$ git add hellworld.cpp
```
5. Закоммитьте изменения с *осмысленным* сообщением.
```sh
$ git commit -m"added cpp file"
```
6. Изменитьте исходный код так, чтобы программа через стандартный поток ввода запрашивалось имя пользователя. А в стандартный поток вывода печаталось сообщение `Hello world from @name`, где `@name` имя пользователя.
```sh
$ edit hellworld.cpp
```
7. Закоммитьте новую версию программы. Почему не надо добавлять файл повторно `git add`?
```sh
$ git commit -m"modded cpp file"
```
8. Запуште изменения в удалёный репозиторий.
```sh
$ git push origin master
```
9. Проверьте, что история коммитов доступна в удалёный репозитории.

### Part II

**Note:** *Работать продолжайте с теми же репоззиториями, что и в первой части задания.*
1. В локальной копии репозитория создайте локальную ветку `patch1`.
```sh
$ git branch patch1
$ git checkout patch1
```
2. Внесите изменения в ветке `patch1` по исправлению кода и избавления от `using namespace std;`.
```sh
$ edit hellworld.cpp
```
3. **commit**, **push** локальную ветку в удалённый репозиторий.
```sh
$ git commit -m"removed using namespace std"
$ git push origin patch1
```
4. Проверьте, что ветка `patch1` доступна в удалёный репозитории.
5. Создайте pull-request `patch1 -> master`.
6. В локальной копии в ветке `patch1` добавьте в исходный код комментарии.
```sh
$ edit hellworld.cpp
```
7. **commit**, **push**.
```sh
$ git commit -m"added comment"

```
8. Проверьте, что новые изменения есть в созданном на **шаге 5** pull-request
9. В удалённый репозитории выполните  слияние PR `patch1 -> master` и удалите ветку `patch1` в удаленном репозитории.
10. Локально выполните **pull**.
```sh
$ git pull origin master
```
11. С помощью команды **git log** просмотрите историю в локальной версии ветки `master`.
```sh
$ git log --all --decorate --oneline --graph
```
12. Удалите локальную ветку `patch1`.
```sh
$ git git branch -d patch1
```

### Part III

**Note:** *Работать продолжайте с теми же репоззиториями, что и в первой части задания.*
1. Создайте новую локальную ветку `patch2`.
```sh
$ git branch patch2
$ git chekout patch2
```
2. Измените *code style* с помощью утилиты [**clang-format**](http://clang.llvm.org/docs/ClangFormat.html). Например, используя опцию `-style=Mozilla`.
```sh
$ clang-format -i -style=Mozilla hellworld.cpp
```
3. **commit**, **push**, создайте pull-request `patch2 -> master`.
```sh
$ git commit -m"code style retry"
$ git push origin patch2
```
4. В ветке **master** в удаленном репозитории измените комментарии, например, расставьте знаки препинания, переведите комментарии на другой язык.
5. Убедитесь, что в pull-request появились *конфликтны*.
6. Для этого локально выполните **pull** + **rebase** (точную последовательность команд, следует узнать самостоятельно). **Исправьте конфликты**.
```sh
$ git rebase master
$ git pull origin master
$ edit hellworld.cpp
```
7. Сделайте *force push* в ветку `patch2`
```sh
$ git push --force origin master
```
8. Убедитель, что в pull-request пропали конфликтны. 
9. Вмержите pull-request `patch2 -> master`.
