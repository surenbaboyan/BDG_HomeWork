FROM ubuntu
RUN apt-get update && apt-get install -y wget
WORKDIR /tmp
ARG NODE_EXPORTER_VERSION
ARG NODE_EXPORTER_ARCH
RUN wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.${NODE_EXPORTER_ARCH}.tar.gz
RUN tar xzf node_exporter-${NODE_EXPORTER_VERSION}.${NODE_EXPORTER_ARCH}.tar.gz -C .

FROM ubuntu
ARG NODE_EXPORTER_VERSION
ARG NODE_EXPORTER_ARCH
LABEL Owner = "Suren Baboyan"
LABEL Version = "Node Exporter V:"${NODE_EXPORTER_VERSION}
RUN apt-get update
COPY --from=0 /tmp/node_exporter-${NODE_EXPORTER_VERSION}.${NODE_EXPORTER_ARCH}/node_exporter /bin/node_exporter
EXPOSE 9100
ENTRYPOINT  [ "/bin/node_exporter" ]