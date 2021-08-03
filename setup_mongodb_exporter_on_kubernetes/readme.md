# Setup Mongo Exporter on Kubernetes

instalasi/setup mongo exporter di kubernetes dapat dilakukan menggunakan helm chart dari 
prometheus-community

#### Setup
setup yang dilakukan dari contoh ini adalah :
1) membuat deployment mongodb. 
`kubectl apply -f k8s_deployment.yaml`
2) mengexpose deployment mongodb sebagai service
`kubectl apply -f k8s_service.yaml`
3) menginstall exporter menggunakan helm
`helm install mongodb-exporter prometheus-community/prometheus-mongodb-exporter -f helm_values.yaml`
ketika melakukan instalasi exporter, pastikan telah menyesuaikan label pada helm_values.yaml. label harus sama dengan label yang digunakan oleh deployment & servicemonitor prometeheus
```yaml
serviceMonitor:
  additionalLabels: {
    release: prom <----- label yang dimaksud
  }
```
#### Cara Menjalankan
1) deploy mongo
`kubectl apply -f k8s_deployment.yaml`
2) expose mongo deployment
`kubectl apply -f k8s_service.yaml`
3) install mongo exporter menggunakan helm
`helm install mongodb-exporter prometheus-community/prometheus-mongodb-exporter -f helm_values.yaml`

atau cukup jalankan file `run.sh`
#### Note !
untuk menjalankan run.sh pastikan telah
1) menginstall helm
