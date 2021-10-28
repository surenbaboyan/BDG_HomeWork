sudo apt update
mkdir /home/$USER/temp
cp prometheus-2.30.3.linux-amd64.tar.gz /home/$USER/temp
sudo cp prometheus.service /etc/systemd/system/
tar xvf /home/$USER/temp/prometheus-2.30.3.linux-amd64.tar.gz
mkdir /etc/prometheus
mkdir /var/lib/prometheus
mv /home/$USER/temp/prometheus-2.30.3.linux-amd64/prometheus /home/$USER/temp/prometheus-2.30.3.linux-amd64/promtool /usr/local/bin/
mv /home/$USER/temp/prometheus-2.30.3.linux-amd64/consoles/ /home/$USER/temp/prometheus-2.30.3.linux-amd64/console_libraries/ /etc/prometheus/
mv /home/$USER/temp/prometheus-2.30.3.linux-amd64/prometheus.yml /etc/prometheus/prometheus.yml
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/  /var/lib/prometheus/
sudo chmod -R 775 /etc/prometheus/ /var/lib/prometheus/
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
