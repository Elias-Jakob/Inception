NAME = Inception
SRC = srcs/docker-compose.yml
CMD = docker compose
# TODO: Replace path with /home/ejakob/data as required by the subject
HOST_DIR = /home/ejakob/data

include ./srcs/.env

all: build up

build:
	@mkdir -p ${DATA_DIR}/wordpress ${DATA_DIR}/mariadb
	$(CMD) -f $(SRC) build

up:
	$(CMD) -f $(SRC) up

start:
	$(CMD) -f $(SRC) start

down:
	$(CMD) -f $(SRC) down

stop:
	$(CMD) -f $(SRC) stop

clean:
	$(CMD) -f $(SRC) down --volumes --remove-orphans

fclean:
	sudo rm -rf ${DATA_DIR}
	$(CMD) -f $(SRC) down --rmi all --volumes --remove-orphans

re: fclean all

.PHONY: all build up start down stop clean fclean re
