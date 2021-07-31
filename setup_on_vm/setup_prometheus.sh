PROMETHEUS_VERSION=2.28.1
# download prometheus
wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
# extract tar file
tar -xvf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
# copy file to usr local
sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64 /usr/local/bin/prometheus
# create service file
cat >> prometheus.service <<EOF
[Unit]
Description=Prometheus Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/prometheus/prometheus --config.file=/home/vagrant/prometheus.yml

[Install]
WantedBy=multi-user.target
EOF
# copy service file to systemd
sudo cp prometheus.service /etc/systemd/system
# restarting daemon
sudo systemctl daemon-reload
# start service
sudo service prometheus start