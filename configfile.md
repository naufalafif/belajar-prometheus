### Config File

dokumentasi : https://prometheus.io/docs/prometheus/latest/configuration/configuration/

config file adalah file konfigurasi dari prometeheus yang berisi bbrp konfigurasi yaitu global config, rules, alert & scrape. konfigurasi ditulis dalam formal yaml.


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
global adalah konfigurasi yang berlaku ke semua instance/target prometheus. global config dapat di override pada instance tertentu jika dibutuhkan.
* scrape_interval : interval waktu prometheus mengumpulkan data. misal terdapat 1 api yang dimonitor oleh prometheus dengan interval 15 detik, maka api tersebut akan mendapatkan request dari prometheus setiap 15 detik
* evaluation_interval : interval waktu prometheus meng-evaluasi rules. misal terdapat 1 rule yang melakukan pengecekan status node, apakah running atau tidak. apabila evaluation rule di set 15 detik, maka pengecekan status node tersebut akan dilakukan menggunakan interval tersebut.

##### Alerting
alerting adalah section untuk mengkonfigurasi alertmanager. 

##### Rule Files
rule files adalah section untuk menentukan lokasi rules prometheus yang akan diload.

##### Scrape Config
Scrape Config adalah section dimana target didefinisikan. target didefinisikan dalam bentuk job atau groups of target.



