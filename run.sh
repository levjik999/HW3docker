#!/bin/bash
DATA_DIR="$(pwd)/data"
LOCAL_DATA_DIR="$(pwd)/local_data"
case "$1" in

  build_generator)
    docker build -t generator ./generator
    ;;

  run_generator)
    docker run --rm -v "$DATA_DIR":/data generator
    ;;

  create_local_data)
    docker run --rm -v "$LOCAL_DATA_DIR":/data generator
    ;;

  build_reporter)
    docker build -t reporter ./reporter
    ;;

  run_reporter)
    docker run --rm -v "$DATA_DIR":/data reporter
    ;;

  structure)
    find . -not -path './.git/*' | sort | sed 's|[^/]*/|  |g'
    ;;

  clear_data)
    rm -f data/*.csv data/*.html
    echo "data/ очищена"
    ;;
    
  clear_local_data)
    rm -f local_data/*.csv
    echo "local_data/ очищена"
    ;;
  
  inside_generator)
    docker run --rm -v "$DATA_DIR":/data generator sh -c "ls -lh /data"
    ;;

  inside_reporter)
    docker run --rm -v "$DATA_DIR":/data reporter sh -c "ls -lh /data"
    ;;

  report_server)
    docker run --rm -d \
      --name report_nginx \
      -v "$DATA_DIR":/usr/share/nginx/html:ro \
      -p 8080:80 \
      nginx:alpine
    echo "Сервер запущен на порту 8080"
    ;;

  *)
    echo "Использование: ./run.sh {build_generator|run_generator|create_local_data|build_reporter|run_reporter|structure|clear_data|clear_local_data|inside_generator|inside_reporter|report_server}"
    ;;

esac