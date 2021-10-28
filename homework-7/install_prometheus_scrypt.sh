apt update
cp prometheus-2.30.3.linux-amd64.tar.gz /home/YOUR_USER_NAME/tmp
cp prometheus.service /etc/systemd/system/
cd /home/$USER/tmp
tar xvzf prometheus-2.30.3.linux-amd64.tar.gz
cd prometheus-2.30.0.linux-amd64
mkdir /etc/prometheus
mkdir /var/lib/prometheus
mv prometheus promtool /usr/local/bin/
mv consoles/ console_libraries/ /etc/prometheus/
mv prometheus.yml /etc/prometheus/prometheus.yml
groupadd --system prometheus
useradd -s /sbin/nologin --system -g prometheus prometheus
chown -R prometheus:prometheus /etc/prometheus/  /var/lib/prometheus/
chmod -R 775 /etc/prometheus/ /var/lib/prometheus/
systemctl start prometheus
systemctl enable prometheus
