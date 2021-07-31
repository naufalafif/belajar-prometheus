NODE_EXPORTER_VERSION=1.2.0
# download node exporter
wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
# extract tar file
tar -xvf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
# copy file to usr local
sudo mv node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64/node_exporter /usr/local/bin/node_exporter
# create service file
sudo cat >> node_exporter.service <<EOF
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF
# copy service file to systemd
sudo cp node_exporter.service /etc/systemd/system
# restarting daemon
sudo systemctl daemon-reload
# start service
sudo service node_exporter start