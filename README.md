# Docker CSV Project — Мебельные данные

Проект генерирует CSV с данными о мебели и строит HTML-отчёт через два Docker-контейнера.

## Структура
```
HW3Docker/
├── data/             # сюда пишутся data.csv и report.html
├── local_data/       # для локальной отладки генератора
├── generator/
│   ├── Dockerfile
│   └── generate.py
├── reporter/
│   ├── Dockerfile
│   ├── package.json
│   └── report.js
├── run.sh
├── .gitignore
└── README.md
```
## Быстрый старт
```
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
```
## Все команды

| Команда | Что делает |
|---|---|
| ./run.sh build_generator | Собирает образ генератора |
| ./run.sh run_generator | Генерирует data/data.csv |
| ./run.sh create_local_data | Генерирует local_data/data.csv |
| ./run.sh build_reporter | Собирает образ аналитика |
| ./run.sh run_reporter | Генерирует data/report.html |
| ./run.sh structure | Выводит дерево файлов проекта |
| ./run.sh clear_data | Удаляет .csv и .html из data/ |
| ./run.sh clear_local_data | Удаляет .csv из local_data/ |
| ./run.sh inside_generator | Показывает /data внутри контейнера генератора |
| ./run.sh inside_reporter | Показывает /data внутри контейнера аналитика |
| ./run.sh report_server | Запускает nginx с report.html на порту 8080 |

## Как открыть отчёт в браузере через GitHub Codespaces

### Шаги для проверяющего:

1. Клонировать репозиторий в GitHub Codespaces
2. В терминале выполнить по порядку:
```
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
./run.sh report_server
```
3. В VS Code внизу открыть вкладку Ports
4. Порт 8080, нажать Open in Browser
5. В адресной строке браузера добавить в конец /report.html и нажать Enter

Остановить сервер: docker stop report_nginx

**Автор: Мелкумов Владимир Арутюнович ББИ2502**
