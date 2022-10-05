!#bin/bash
docker-compose down
docker image rm -f $(docker images | awk '{print $3}')
docker container rm $(docker container ls -a | awk '{print $1}')
docker network rm $(docker network ls | awk '{print $1}')
docker volume rm inception_db_data inception_wp_data