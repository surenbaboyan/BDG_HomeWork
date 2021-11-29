FROM ubuntu
RUN apt-get update && apt-get install -y wget
WORKDIR /tmp
ARG PROMETHEUS_VERSION
ARG PROMETHEUS_ARCH
RUN wget https://github.com/prometheus/prometheus/releases/download//v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}.tar.gz
RUN tar xzf prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}.tar.gz -C .

FROM ubuntu AS MyNginx
RUN apt-get update && apt-get install -y nginx
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/nginx", "-g", "daemon off;" ]

FROM MyNginx
ARG PROMETHEUS_VERSION
ARG PROMETHEUS_ARCH
LABEL Owner = "Suren Baboyan"
LABEL Version = "Prometheus V:"${PROMETHEUS_VERSION}

COPY --from=0  /tmp/prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}/prometheus /bin/prometheus
COPY --from=0  /tmp/prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}/promtool /bin/promtool
COPY --from=0  /tmp/prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}/consoles /etc/prometheus/consoles
COPY --from=0  /tmp/prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}/console_libraries /etc/prometheus/console_libraries
COPY --from=0  /tmp/prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}/prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 9090
ENTRYPOINT [ "/bin/prometheus" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml" ]

