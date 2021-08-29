# Setup Prometheus on Docker Compose

instalasi/setup prometheus menggunakan docker-compose

#### Setup
setup yang dilakukan dari contoh ini adalah :
1) membuat docker network
```yaml
networks:
  promnet:
```
2) setup prometheus
```yaml
  prometheus:
    build:
      context: .
      dockerfile: prometheus.Dockerfile
    image: compose_prometheus
    networks:
      - promnet
    ports: 
      - 9090:9090
```
service prometheus membuild image baru untuk memasukan config prometheus.yml

3) setup node exporter
```yaml
  node_exporter:
    image: prom/node-exporter
    networks: 
      - promnet
```

4) setup grafana
```yaml
  grafana:
    image: grafana/grafana
    ports:
      - '4000:3000'
    networks:
      - promnet
```

#### Cara Menjalankan
1) jalankan menggunakan docker-compose
`docker-compose up`

atau cukup jalankan file `run.sh`