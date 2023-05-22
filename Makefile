all:	up

up:
	docker-compose -f ./srcs/docker-compose.yml up --build

stop:
	docker-compose -f ./srcs/docker-compose.yml down

prune:
	docker system prune -a
