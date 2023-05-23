all:	up

up:
	docker compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker-compose -f ./srcs/docker-compose.yml down

prune: stop
	docker system prune -af

re: prune ls up

ls:
	docker images
	docker ps -a

cmd:
	@echo "docker run [-it]<image_name> [bash]	: run image with bash"
	@echo "docker rmi -f <image_id_or_name>	: delete image"
	@echo "docker stop <container id>		: stop container"
	@echo "docker rm <container id>		: delete container"
