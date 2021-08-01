GRAFANA_VERSION=8.0.6
# download grafana
wget https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz
# extract tar file
tar -zxvf grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz
# copy file to usr local
sudo mv grafana-${GRAFANA_VERSION} /usr/local/bin/grafana
# create service file
cat >> grafana.service <<EOF
[Unit]
Description=Grafana Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/grafana/bin/grafana-server -config "/usr/local/bin/grafana/conf/defaults.ini" -homepath "/usr/local/bin/grafana"

[Install]
WantedBy=multi-user.target
EOF
# copy service file to systemd
sudo cp grafana.service /etc/systemd/system
# restarting daemon
sudo systemctl daemon-reload
# start service
sudo service grafana start