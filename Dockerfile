#
# Elasticsearch Dockerfile
# git@github.com:monsieurchico/docker-elasticsearch.git
#
FROM dockerfile/java:oracle-java8
MAINTAINER Romain Derocle "rderocle@gmail.com"

# prevent debian errors
ENV DEBIAN_FRONTEND noninteractive
ENV ES_VERSION 1.4.4

# update os and install nginx
RUN \
    cd / && \
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
    tar xvzf elasticsearch-$ES_VERSION.tar.gz && \
    rm -f elasticsearch-$ES_VERSION.tar.gz && \
    mv /elasticsearch-$ES_VERSION /elasticsearch

# install plugins
RUN  \
    /elasticsearch/bin/plugin install royrusso/elasticsearch-HQ

# expose ports
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

# add resources
COPY ./resources/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# define mountable volumes
VOLUME ["/shared", "/shared/work", "/shared/log", "/shared/plugins", "/shared/data"]

# add launch script
COPY ./resources/startup.sh /startup.sh

# define entrypoint
ENTRYPOINT ["/bin/bash", "/startup.sh"]

# define workdir
WORKDIR /shared