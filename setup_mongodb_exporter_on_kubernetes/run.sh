kubectl apply -f k8s_deployment.yaml
kubectl apply -f k8s_service.yaml
helm install mongodb-exporter prometheus-community/prometheus-mongodb-exporter -f helm_values.yaml