# ES会报错，所以将映射目录赋权 
# sudo chmod -R 777 ./data/elasticsearch/

start-env:
	docker-compose -f docker-compose-env.yml up -d 
stop-env:
	docker-compose -f docker-compose-env.yml stop
start-server:
	docker-compose -f docker-compose.yml up -d 
stop-server:
	docker-compose -f docker-compose.yml stop 
