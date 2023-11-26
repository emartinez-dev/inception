DOCKER-COMPOSE = srcs/docker-compose.yml
DATA-DIR = /goinfre/franmart/data
#DATA-DIR = /home/franmart/data
MARIADB-DIR = $(DATA-DIR)/mariadb
NETWORK-NAME = inception

all: init-dirs build start

init-dirs:
	mkdir -p $(DATA-DIR) $(MARIADB-DIR)

start: init-dirs
	docker-compose -f $(DOCKER-COMPOSE) up

stop:
	docker-compose -f $(DOCKER-COMPOSE) down

logs:
	docker-compose -f $(DOCKER-COMPOSE) logs -f

build:
	docker-compose -f $(DOCKER-COMPOSE) build

shell:
	docker-compose -f $(DOCKER-COMPOSE) exec -it $(service) bash

clean: stop
	rm -rf $(DATA-DIR)
	docker network rm $(NETWORK-NAME)

.PHONY: all start stop logs clean build shell clean
