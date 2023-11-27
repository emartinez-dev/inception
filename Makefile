DOCKER-COMPOSE = srcs/docker-compose.yml
#DATA-DIR = /goinfre/franmart/data
DATA-DIR = /home/franmart/data
MARIADB-DIR = $(DATA-DIR)/mariadb
WORDPRESS-DIR = $(DATA-DIR)/wordpress
NETWORK-NAME = inception

all: init-dirs build start

init-dirs:
	mkdir -p $(DATA-DIR) $(MARIADB-DIR) $(WORDPRESS-DIR)

start: init-dirs
	docker-compose -f $(DOCKER-COMPOSE) up

stop:
	docker-compose -f $(DOCKER-COMPOSE) down

logs:
	docker-compose -f $(DOCKER-COMPOSE) logs -f

build:
	docker-compose -f $(DOCKER-COMPOSE) build

shell:
	docker exec -it $(service) bash

clean: stop
	rm -rf $(DATA-DIR)
	docker-compose -f $(DOCKER-COMPOSE) rm -fvs
	docker system prune -a

.PHONY: all start stop logs clean build shell clean
