# Belajar Prometheus

Prometheus adalah alat monitoring open source yang bekerja dengan cara mengumpulkan data metric dari node/db/app/dll dalam interval tertentu. prometheus dapat menampilakan data dalam bentuk grafik, mentrigger alert, & menyediakan query language untuk pengambilan data.


### Architecture
<img src='architecture.svg'>
### Komponen
#### Utama
Prometheus memiliki 3 komponen utama yaitu :
1) Retrieval
retrieval adalah komponen yang bertugas mengumpulkan data metric dari berbagai sumber. sumber data bisa dari server prometheus sendiri, exporter, push gateway, service discovery ataupun aplikasi apapun yang telah mengexpose data metric pada url /metric

3) Storage
storage adalah penyimpanan data dari prometheus

5) PromQL
promQL adalah query language dari prometheus yang digunakan untuk menampilkan data sesuai kebutuhan.

#### Config File
```yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

alerting:
  alertmanagers:
    - static_configs:
        - targets:
          # - alertmanager:9093

rule_files:
  # - "first_rules.yml"
  # - "second_rules.yml"

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]
```

pada config file diatas terdapat 4 jenis konfigurasi
##### Global
* scrape_interval : interval waktu prometheus mengumpulkan data. misal terdapat 1 api yang dimonitor oleh prometheus dengan interval 15 detik, maka api tersebut akan mendapatkan request dari prometheus setiap 15 detik
* evaluation_interval : interval waktu prometheus meng-evaluasi rules. misal terdapat 1 rule yang melakukan pengecekan status node, apakah running atau tidak. apabila evaluation rule di set 15 detik, maka pengecekan status node tersebut akan dilakukan menggunakan interval tersebut.

##### Alerting
* alertmanagers : konfigurasi alertmanager

##### Rules
on progress
##### Scrape Config
on progress
#### Contoh Setup/Instalasi
1) Setup On VM [open](setup_on_vm)
2) Setup On Docker Compose [open](setup_on_docker_compose)
3) Setup On Kubernetes [open](setup_on_kubernetes)
4) Setup MongoDB Expoter On Kubernetes [open](setup_mongodb_exporter_on_kubernetes)
