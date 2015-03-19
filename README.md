# Elasticsearch image

## Requirements

You must have [Docker](https://www.docker.com/) >= 1.5.

## What's inside

* [latest elasticsearch](https://www.elastic.co/products/elasticsearch)
* [HQ plugin](https://github.com/royrusso/elasticsearch-HQ)

### Ports

You can bind ports :

* 9200
* 9300

### Volumes

You can mount directories :

* /shared : parent dir of all shared directories
* /shared/data
* /shared/log
* /shared/plugins
* /shared/work

## Usage

```bash
# pull (auto) and run
# mount volumes
docker run \
  -d \
  --name elasticsearch \
  -p 9200:9200 \
  -p 9300:9300 \
  -v /opt/docker/elasticsearch:/shared \
  monsieurchico/elasticsearch
```
