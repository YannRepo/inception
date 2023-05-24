all:	up

up:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

rmmdb:
	docker ps -aqf "name=mariadb" | xargs -r docker stop
	docker ps -aqf "name=mariadb" | xargs -r docker rm
	if ["$(docker images | grep mariadb)" -eq 0]; then echo "image inexistante"; else docker rmi mariadb:mariadb; fi

rmwp:
	docker ps -aqf "name=wordpress" | xargs -r docker stop
	docker ps -aqf "name=wordpress" | xargs -r docker rm
	if ["$(docker images | grep worpress)" -eq 0]; then echo "image inexistante"; else docker rmi wordpress:wordpress; fi

wp: rmwp
	sudo rm -rf /home/ybellot/data/wordpress/
	sudo mkdir /home/ybellot/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker-compose -f ./srcs/docker-compose.yml down

prune: stop
	docker system prune -af
	docker volume rm srcs_sql-data -f
	docker volume rm srcs_wp-data -f
	sudo rm -rf /home/ybellot/data/mysql/
	sudo rm -rf /home/ybellot/data/wordpress/
	sudo mkdir /home/ybellot/data/mysql
	sudo mkdir /home/ybellot/data/wordpress

re: prune ls up

ls:
	docker images
	docker ps -a

cmd:
	@echo "docker run [-it]<image_name> [bash]	: run image with bash"
	@echo "docker exec -it <containter_name> bash"	: lance bash dans un container qui run
	@echo "docker logs <container id> 		: affiche logs"
	@echo "docker-compose logs [<service_name>] 	: affiche logs"
	@echo "docker rmi -f <image_id_or_name>	: delete image"
	@echo "docker stop <container id>		: stop container"
	@echo "docker rm <container id>		: delete container"
