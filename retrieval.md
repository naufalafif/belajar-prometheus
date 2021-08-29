### Retrieval
retrieval adalah komponen yang bertugas mengumpulkan data metric dari berbagai sumber. sumber data bisa dari server prometheus sendiri, exporter, push gateway, service discovery ataupun aplikasi apapun yang telah mengexpose data metric pada endpoint /metric.


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
target kedua adalah job / exporters. job & exporter adalah 2 hal berbeda, job adalah group dari kumpulan target/instance & exporter adalah aplikasi untuk membaca metric dari third party (os, database, etc) dan mengubah metric ke format yang di support oleh prometheus.

``` yaml
scrape_configs:
  - job_name: "app1"
    static_configs:
      - targets: ["localhost:9191"]
  - job_name: "node_exporter"
    static_configs:
      - targets: ["localhost:9292"]
```

pada config diatas terdapat 2 job yaitu app1 & node_exporter. node_exporter adalah salah satu contoh exporter & untuk sebuah expoter dapat terbaca oleh prometheus, maka exporter tersebut harus terdaftar sebagai job.

##### 3. Push Gateway
push gateway adalah tool yang disediakan oleh prometheus untuk mengexpose metric dari aplikasi yang bersifat ephemeral atau berjalan sementara seperti batch job dll. pushgateway diperlukan karena prometheus merupakan pull based tool, dimana metric akan dikumpulkan dari target dalam interval tertentu.

untuk mengumpulkan metric dari batch job, batch job diharuskan mengirimkan data metric ke push gateway & push gateway yang akan meng-expose data metric tersebut untuk selanjutnya di scrape oleh prometheus.

##### 4. Service Discovery
service discovery adalah fitur yang disediakan oleh prometheus untuk menghandle keadaan dimana instance/target tidak memiliki address yang fix/tetap seperti kubernetes. Untuk memonitor kubernetes, menggunakan config biasa adalah yang tidak tepat dikarenakan instance dapat sewaktu2 dihapus & terbentuk instance baru, instance2 baru tersebut akan menghasilkan address2 baru & config yang sebelumnya didefine tidak akan berkerja. pada keadaan tersebut service discovery diperlukan.