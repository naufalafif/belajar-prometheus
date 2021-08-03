# Setup Prometheus on VM
instalasi/setup prometheus di virtual machine

#### Setup
setup yang dilakukan dari contoh ini adalah :
1) provision vm / membuat vm menggunakan vagrant. configurari terdapat pada file `Vagrantfile`
2) expose ip dari vm
3) copy script instalasi ke vm `setup_*.sh`
4) jalankan script instalasi prometheus
5) jalankan script instalasi exporter
6) jalankan script instalasi grafana

pada masing2 script instalasi dilakukan 3 hal. download app, extract & pindahkan ke dir /usr/local/bin lalu buat service pada systemd

#### Cara Menjalankan
1) jalankan menggunakan vagrant
`vagrant up`
#### Note !
untuk menjalankan run.sh pastikan telah
1) menginstall vagrant
