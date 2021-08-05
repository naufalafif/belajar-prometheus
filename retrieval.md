### Retrieval
retrieval adalah komponen yang bertugas mengumpulkan data metric dari berbagai sumber. sumber data bisa dari server prometheus sendiri, exporter, push gateway, service discovery ataupun aplikasi apapun yang telah mengexpose data metric pada url /metric.


<img src='retrieval.jpg'>

#### Jenis Target

terdapat 4 jenis target yang dapat di-scrape oleh prometeheus yaitu

##### 1. Prometheus Server
target pertama adalah prometheus server atau dirinya sendiri. by default ketika dijalankan prometeheus kan langsung melakukan monitoring terhadap dirinya sendiri dengan meng expose metrics endpoint. hal ini bisa dilihat dari default config
``` yaml
scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]
```

##### 2. Job / Exporters
target kedua adalah job / exporters. job adalah group dari kumpulan target/instance.