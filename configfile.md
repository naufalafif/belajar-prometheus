### Config File
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
* scrape_interval : interval waktu prometheus mengumpulkan data. misal terdapat 1 api yang dimonitor oleh prometheus dengan interval 15 detik, maka api tersebut akan mendapatkan request dari prometheus setiap 15 detik
* evaluation_interval : interval waktu prometheus meng-evaluasi rules. misal terdapat 1 rule yang melakukan pengecekan status node, apakah running atau tidak. apabila evaluation rule di set 15 detik, maka pengecekan status node tersebut akan dilakukan menggunakan interval tersebut.