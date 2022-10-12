all: clean build

build:
	@docker-compose --env-file srcs/.env --file srcs/docker-compose.yml up --build

stop:
	@docker-compose --env-file srcs/.env --file srcs/docker-compose.yml down

clean: stop
	@docker system prune -f -a