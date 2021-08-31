docker-compose down -t 3 2> /dev/null; \
docker rmi --force compose_prometheus  2> /dev/null; \
docker rmi --force compose_alertmanager  2> /dev/null; \
docker-compose up -d