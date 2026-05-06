# Практика: Git Hooks

В этой папке выполнены три задания из PDF: настроены `pre-commit`, `commit-msg` и `pre-push` hooks для автоматизации проверки коммитов и кода.

## Структура

```text
git-hooks-practice/
├── .githooks/
│   ├── pre-commit
│   ├── commit-msg
│   └── pre-push
├── .git/hooks/
│   ├── pre-commit
│   ├── commit-msg
│   └── pre-push
├── scripts/
│   ├── build.sh
│   └── test.sh
├── src/
│   └── CalculatorApp/
│       ├── CalculatorApp.csproj
│       └── Calculator.cs
├── tests/
│   └── CalculatorApp.Tests/
│       ├── CalculatorApp.Tests.csproj
│       └── Program.cs
└── Makefile
```

Основная рабочая версия hooks лежит в `.githooks`. В `.git/hooks` добавлены wrapper-файлы для классического расположения hooks. В `.git/config` уже указан параметр:

```bash
git config core.hooksPath .githooks
```

Если Git будет инициализирован заново, достаточно выполнить эту команду ещё раз.

Для установки hooks в обычном репозитории:

```bash
./scripts/install-hooks.sh
```

## Что реализовано

| Задание | Реализация |
| --- | --- |
| `pre-commit` | Проверяет, что есть staged-изменения, запрещает коммит файлов `*.log` и `*.tmp`, выводит понятное сообщение об ошибке. |
| `commit-msg` | Запрещает пустое сообщение коммита и проверяет формат `[TYPE] message`, например `[FIX] null pointer crash`. |
| `pre-push` | Перед push запускает сборку C#/.NET проекта через `dotnet build` и быстрые unit-проверки через `dotnet run`. Если вместо .NET доступен `make`, используется `Makefile`. |

## Проверка

Примеры команд для проверки в среде, где установлен Git:

```bash
git add src/CalculatorApp/Calculator.cs
git commit -m "[FEAT] add calculator module"
```

Коммит с неправильным сообщением должен быть отклонён:

```bash
git commit -m "add calculator module"
```

Коммит с временным файлом должен быть отклонён:

```bash
echo "debug" > debug.log
git add debug.log
git commit -m "[CHORE] add debug file"
```

Перед отправкой изменений `pre-push` выполнит:

```bash
./scripts/build.sh
./scripts/test.sh
```

## Важное замечание

В PDF в первом задании указана проверка пустого сообщения рядом с `pre-commit`. Технически Git запускает `pre-commit` до создания файла сообщения коммита, поэтому пустое сообщение корректно проверяется в hook `commit-msg`. Это сделано в решении.
