FROM prom/prometheus
COPY ./prometheus.yml /etc/prometheus/prometheus.yml
COPY ./rules.yml /etc/rules.yml