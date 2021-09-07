# Docker databases
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/tomoyane/grant-n-z/blob/master/LICENSE.txt)

Vefirication database for use `RDBMS` and `NoSQL` and `Graph` and `Time Series Data`

* RDBMS
  * MySQL
  * PosgreSQL
* NoSQL
  * Cassandra
  * MongoDB
  * CouchDB
  * Redis
  * etcd
* Graph
  * Neo4j
* Time Series Data
  * InfluxDB

## How to use

### RDBMS
**MySQL**

```bash
# Build MySQL container
$ make build-mysql

# Up MySQL container
$ make up-mysql

# Restart MySQL container
$ make restart-mysql

# Down MySQL container
$ make down-mysql

# Login MySQL container
$ make login-mysql
```

**PostgreSQL**

```bash
# Build PostgreSQL container
$ make build-postgres

# Up PostgreSQL container
$ make up-postgres

# Restart PostgreSQL container
$ make restart-postgres

# Down PostgreSQL container
$ make down-postgres

# Login PostgreSQL container
$ make login-postgres
```

### NoSQL

**Cassandra**

Cassandra is 3node. It needs time what to join node.

|Node|
|---|
|3|

```bash
# Build Cassandra container
$ make build-cassandra

# Up Cassandra container
$ make up-cassandra

# Restart Cassandra container
$ make restart-cassandra

# Down Cassandra container
$ make down-cassandra

# Login Cassandra container
$ make login-cassandra
```

**MongoDB**

|Primary node|Secondary node|Secondary node(hidden)|
|---|---|---|
|1|1|1|

```bash
# Build MongoDB container
$ make build-mongodb

# Up MongoDB container
$ make up-mongodb

# Restart MongoDB container
$ make restart-mongodb

# Down MongoDB container
$ make down-mongodb

# Setup MongoDB cluster
$ make setup-mongodb-cluster

# Login MongoDB container
$ make login-mongodb
```

**CouchDB**

```bash
# Build CouchDB container
$ make build-couchdb

# Up CouchDB container
$ make up-couchdb

# Restart CouchDB container
$ make restart-couchdb

# Down CouchDB container
$ make down-couchdb

# Check CouchDB container process
$ make check-couchdb
```

**Redis**

|Master Node|Slave Node|
|---|---|
|3|0|

```bash
# Build Redis container
$ make build-redis

# Up Redis container
$ make up-redis

# Restart Redis container
$ make restart-redis

# Down Redis container
$ make down-redis

# Setup Redis container
$ make setup-redis-cluster

# Login Redis container 
$ make login-redis
```

**etcd**

```bash
# Build etcd container
$ make build-etcd

# Up etcd container
$ make up-etcd

# Restart etcd container
$ make restart-etcd

# Down etcd container
$ make down-etcd
```

### Graph

**Neo4j**

```bash
# Build Neo4j container
$ make build-neo4j

# Up Neo4j container
$ make up-neo4j

# Restart Neo4j container
$ make restart-neo4j

# Down Neo4j container
$ make down-neo4j

# Check Neo4j container process
$ make check-neo4j
```

### Time Series Data

**InfluxDB**

```bash
# Build InfluxDB container
$ make build-influxdb

# Up InfluxDB container
$ make up-influxdb

# Restart InfluxDB container
$ make restart-influxdb

# Down InfluxDB container
$ make down-influxdb

# Login InfluxDB container 
$ make login-influxdb
```
