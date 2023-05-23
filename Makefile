all:	up

up:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker-compose -f ./srcs/docker-compose.yml down

prune: stop
	docker system prune -af

re: prune ls up

ls:
	docker images
	docker ps -a
