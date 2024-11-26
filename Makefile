COMPOSE_FILE = srcs/docker-compose.yml

all:
	mkdir -p /home/scrumier/data/mariadb
	mkdir -p /home/scrumier/data/wordpress
	docker compose -f $(COMPOSE_FILE) up --build

clean:
	@echo "Stopping all running containers..."
	docker compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	@echo "Removing all unused Docker resources..."
	docker system prune --all --volumes --force
	rm -rf /home/scrumier/data/mariadb/*
	rm -rf /home/scrumier/data/wordpress/*
	@echo "Clean-up complete!"

stop:
	docker compose -f $(COMPOSE_FILE) down

re: clean all