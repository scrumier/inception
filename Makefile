all:
	sudo mkdir -p /var/lib/mysql
	sudo chmod 777 /var/lib/mysql
	sudo mkdir -p /var/www/html
	sudo chmod 777 /var/www/html
	sudo mkdir -p srcs/database
	sudo chmod 777 srcs/database
	sudo mkdir -p /home/scrumier/data/mariadb
	@docker network create inception || true
	@docker compose -f srcs/docker-compose.yml up -d --build

down:
	@docker compose -f srcs/docker-compose.yml down

re: fclean all

clean:
	if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa); fi
	if [ -n "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa); fi
	if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
	if [ -n "$$(docker network ls -q | grep -v bridge host none)" ]; then \
		docker network rm $$(docker network ls -q | grep -v bridge host none); \
	fi
	if [ -n "$$(docker images -q)" ]; then docker rmi $$(docker images -q); fi

fclean: clean
	if [ -n "$$(docker volume ls -q | grep mysql)" ]; then docker volume rm $$(docker volume ls -q | grep mysql); fi
	if [ -n "$$(docker volume ls -q | grep wordpress)" ]; then docker volume rm $$(docker volume ls -q | grep wordpress); fi
	sudo rm -rf /var/lib/mysql
	sudo rm -rf /var/www/html
	sudo rm -rf srcs/database
	sudo rm -rf srcs/web
	sudo rm -rf /home/scrumier/data/mariadb/*
	docker system prune -a -f

.PHONY: all re down clean
