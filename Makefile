all: build

build:
	@docker-compose --env-file srcs/.env --file srcs/docker-compose.yml build

up:
	@mkdir -p /home/oabdelha/data/db_data
	@mkdir -p /home/oabdelha/data/wp_data
	@docker-compose --env-file srcs/.env --file srcs/docker-compose.yml up

stop:
	@docker-compose --env-file srcs/.env --file srcs/docker-compose.yml down

clean: stop
	@docker system prune -f -a
	@docker rmi -f $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@sudo rm -rf /home/oabdelha/data/
	
re: clean all