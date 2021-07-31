kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
helm install mongodb-exporter prometheus-community/prometheus-mongodb-exporter -f helm_values.yaml