docker-gearman
==============

Gearman on Docker. Provides a Dockerfile for build, as well as a docker-compose file for dev work.


### Testing

```
docker-compose build
docker-compose up
```

### Running

```
docker run gearman
```

### Optional ENV params:

### MySQL Persistence

* MYSQL_HOST
* MYSQL_USER
* MYSQL_PASSWORD
* MYSQL_DB

### Memcache Persistence

* MEMCACHE_HOST
