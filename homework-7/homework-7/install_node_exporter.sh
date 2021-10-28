mkdir /home/$USER/temp
tar xzf node_exporter-1.2.2.linux-amd64.tar.gz -C /home/$USER/temp
sudo mv -v /home/$USER/temp/node_exporter-1.2.2.linux-amd64/node_exporter /usr/local/bin/
sudo chown root:root /usr/local/bin/node_exporter
sudo cp node-exporter.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start node-exporter.service
sudo systemctl enable node-exporter.service
