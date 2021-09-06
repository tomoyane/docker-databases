# MongoDB
build-mongodb:
	@echo "Build MongoDB"
	@docker-compose -f MongoDB/docker-compose.yml build --no-cache

up-mongodb:
	@echo "Up MongoDB cluster"
	@docker-compose -f MongoDB/docker-compose.yml up -d
	@docker ps -a

down-mongodb:
	@echo "Down MongoDB cluster"
	@docker-compose -f MongoDB/docker-compose.yml down

restart-mongodb:
	@echo "Restart MongoDB cluster"
	make -s down-mongodb
	make -s up-mongodb

setup-mongodb-cluster:
	@echo "Setup MongoDB cluster"
	@docker exec -it mongodb01 bash -c 'mongo --eval "rs.initiate( {_id : \"rs0\", members: [{ _id: 0, host: \"mongo_db_01:27017\" },{ _id: 1, host: \"mongo_db_02:27018\" },{ _id: 2, host: \"mongo_db_03:27019\", "priority" : 0, "hidden" : true }]});"'

login-mongodb:
	@echo "Login MongoDB cluster"
	@docker exec -it mongodb01 bash -c 'mongo "mongodb://mongo_db_01:27017,mongo_db_02:27018/?replicaSet=rs0"'


# Redis
build-redis:
	@echo "Build Redis"
	@docker-compose -f Redis/docker-compose.yml build --no-cache

up-redis:
	@echo "Up Redis cluster"
	@docker-compose -f Redis/docker-compose.yml up -d
	@docker ps -a

down-redis:
	@echo "Down Redis cluster"
	@docker-compose -f Redis/docker-compose.yml down

restart-redis:
	@echo "Restart Redis cluster"
	make -s down-redis
	make -s up-redis

setup-redis-cluster:
	@echo "Setup Redis cluster"
	./Redis/setup-redis-cluster.sh

login-redis:
	@echo "Login Redis"
	@docker exec -it redis01 bash -c 'redis-cli -c -p 7001'


# MySQL
build-mysql:
	@echo "Build MySQL"
	@docker-compose -f MySQL/docker-compose.yml build --no-cache

up-mysql:
	@echo "Up MySQL"
	@docker-compose -f MySQL/docker-compose.yml up -d
	@docker ps -a

down-mysql:
	@echo "Down MySQL"
	@docker-compose -f MySQL/docker-compose.yml down

restart-mysql:
	@echo "Restart MySQL"
	make -s down-mysql
	make -s up-mysql

login-mysql:
	@echo "Setup MySQL"
	@docker exec -it mysql01 bash -c 'mysql -u user --password=password'


# PostgreSQL
build-postgres:
	@echo "Build PostgreSQL"
	@docker-compose -f PostgreSQL/docker-compose.yml build --no-cache

up-postgres:
	@echo "Up PostgreSQL"
	@docker-compose -f PostgreSQL/docker-compose.yml up -d
	@docker ps -a

down-postgres:
	@echo "Down PostgreSQL"
	@docker-compose -f PostgreSQL/docker-compose.yml down

restart-postgres:
	@echo "Restart PostgreSQL"
	make -s down-postgres
	make -s up-postgres

login-postgres:
	@echo "Setup PostgreSQL"
	@docker exec -it postgresql01 bash -c 'psql -U user'


# Cassandra
build-cassandra:
	@echo "Build Cassandra"
	@docker-compose -f Cassandra/docker-compose.yml build --no-cache

up-cassandra:
	@echo "Up Cassandra"
	@docker-compose -f Cassandra/docker-compose.yml up -d
	@docker ps -a
	sh ./Cassandra/check_cluster_status.sh

down-cassandra:
	@echo "Down Cassandra"
	@docker-compose -f Cassandra/docker-compose.yml down

restart-cassandra:
	@echo "Restart Cassandra"
	make -s down-cassandra
	make -s up-cassandra

login-cassandra:
	@echo "Setup Cassandra"
	@docker exec -it cassandra01 bash -c 'cqlsh $HOSTNAME'


# CouchDB
build-couchdb:
	@echo "Build CouchDB"
	@docker-compose -f CouchDB/docker-compose.yml build --no-cache

up-couchdb:
	@echo "Up CouchDB"
	@docker-compose -f CouchDB/docker-compose.yml up -d
	@docker ps -a

down-couchdb:
	@echo "Down CouchDB"
	@docker-compose -f CouchDB/docker-compose.yml down

restart-couchdb:
	@echo "Restart CouchDB"
	make -s down-couchdb
	make -s up-couchdb

check-couchdb:
	@echo "Setup CouchDB"
	curl http://127.0.0.1:5984/


# InfluxDB
build-influxdb:
	@echo "Build InfluxDB"
	@docker-compose -f InfluxDB/docker-compose.yml build --no-cache

up-influxdb:
	@echo "Up InfluxDB"
	@docker-compose -f InfluxDB/docker-compose.yml up -d
	@docker ps -a

down-influxdb:
	@echo "Down InfluxDB"
	@docker-compose -f InfluxDB/docker-compose.yml down

restart-influxdb:
	@echo "Restart InfluxDB"
	make -s down-influxdb
	make -s up-influxdb

login-influxdb:
	@echo "Setup InfluxDB"
	@docker exec -it influxdb01 bash -c 'influx'


# Neo4j
build-neo4j:
	@echo "Build Neo4j"
	@docker-compose -f Neo4j/docker-compose.yml build --no-cache

up-neo4j:
	@echo "Up Neo4j"
	@docker-compose -f Neo4j/docker-compose.yml up -d
	@docker ps -a
	@docker exec -it neo4j01 bash -c 'neo4j start'

down-neo4j:
	@echo "Down Neo4j"
	@docker-compose -f Neo4j/docker-compose.yml down

restart-neo4j:
	@echo "Restart Neo4j"
	make -s down-neo4j
	make -s up-neo4j

check-neo4j:
	@echo "Check Neo4j"
	sh ./Neo4j/check_neo4j.sh


# etcd
build-etcd:
	@echo "Build etcd"
	@docker-compose -f etcd/docker-compose.yml build --no-cache

up-etcd:
	@echo "Up etcd"
	@docker-compose -f etcd/docker-compose.yml up -d
	@docker ps -a

down-etcd:
	@echo "Down etcd"
	@docker-compose -f etcd/docker-compose.yml down

restart-etcd:
	@echo "Restart etcd"
	make -s down-etcd
	make -s up-etcd

