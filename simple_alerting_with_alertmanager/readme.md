# Simple Alerting with Alert Manager

simple alerting with alert manager menggunakan docker-compose

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
service prometheus membuild image baru untuk memasukan config prometheus.yml & rules rules.yml

3) setup node exporter
```yaml
  node_exporter:
    image: prom/node-exporter
    networks: 
      - promnet
```

4) setup Alert Manager
```yaml
  alert_manager:
    build:
      context: .
      dockerfile: alert_manager.Dockerfile
    image: compose_alertmanager
    ports:
      - '9093:9093'
    networks:
      - promnet
```
service alert_manager membuild image baru untuk memasukan config alertmanager.yml

#### Cara Menjalankan
sebelum dijalankan, pastikan mengubah config smtp pada alertmanager.yaml
```yaml
receivers:
  - name: admin
    email_configs:
      - to: 'example@example.com'
        from: 'example@example.com'
        smarthost: smtp.gmail.com:587 <-- SMTP Host
        auth_username: **************** <-- SMTP Username
        auth_password: **************** <-- SMTP Password
```

jalankan menggunakan docker-compose `docker-compose up`
atau cukup jalankan file `run.sh`

untuk melihat alert yang sudah terpasang, buka http://localhost:9090/classic/alerts

untuk mentrigger alert, matikan container node_exporter. contoh `docker container stop $ID_CONTAINER`
