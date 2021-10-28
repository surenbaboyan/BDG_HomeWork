sudo apt update
mkdir /home/$USER/tmp
cp prometheus-2.30.3.linux-amd64.tar.gz /home/$USER/tmp
sudo cp prometheus.service /etc/systemd/system/
tar /home/$USER/tmp xvf prometheus-2.30.3.linux-amd64.tar.gz
mkdir /etc/prometheus
mkdir /var/lib/prometheus
mv /home/$USER/tmp/prometheus-2.30.3.linux-amd64/prometheus /home/$USER/tmp/prometheus-2.30.3.linux-amd64/promtool /usr/local/bin/
mv /home/$USER/tmp/prometheus-2.30.3.linux-amd64/consoles/ /home/$USER/tmp/prometheus-2.30.3.linux-amd64/console_libraries/ /etc/prometheus/
mv /home/$USER/tmp/prometheus-2.30.3.linux-amd64/prometheus.yml /etc/prometheus/prometheus.yml
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/  /var/lib/prometheus/
sudo chmod -R 775 /etc/prometheus/ /var/lib/prometheus/
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
