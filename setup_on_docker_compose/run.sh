docker-compose down -t 3 2> /dev/null; docker rmi compose_prometheus 2> /dev/null; docker-compose up -d