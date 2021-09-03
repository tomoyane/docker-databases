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
