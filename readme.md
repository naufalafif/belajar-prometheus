# Belajar Prometheus

Prometheus adalah alat monitoring open source yang bekerja dengan cara mengumpulkan data metric dari node/db/app/dll dalam interval tertentu. prometheus dapat menampilakan data dalam bentuk grafik, mentrigger alert, & menyediakan query language untuk pengambilan data.

### Komponen Utama
Prometheus memiliki 3 komponen utama yaitu :
1) Retrieval
retrieval adalah komponen yang bertugas mengumpulkan data metric dari berbagai sumber. sumber data bisa dari server prometheus sendiri, exporter, push gateway, service discovery ataupun aplikasi apapun yang telah mengexpose data metric pada url /metric

3) Storage
storage adalah penyimpanan data dari prometheus

5) PromQL
promQL adalah query language dari prometheus yang digunakan untuk menampilkan data sesuai kebutuhan.

#### Architecture
<img src='architecture.svg'>

#### Contoh
1) Setup On VM [open](setup_on_vm)
2) Setup On Docker Compose [open](setup_on_docker_compose)
3) Setup On Kubernetes [open](setup_on_kubernetes)
4) Setup MongoDB Expoter On Kubernetes [open](setup_mongodb_exporter_on_kubernetes)
