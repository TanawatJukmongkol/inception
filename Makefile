include srcs/.env
export

# DOCKER_FLAGS	= -d
DOCKER_FLAGS = --no-deps \
		  --force-recreate \
		  --remove-orphans

all: $(DATA_VOL)/wordpress $(DATA_VOL)/mariadb up

$(DATA_VOL)/wordpress:
	@ mkdir -p $(DATA_VOL)/wordpress

$(DATA_VOL)/mariadb:
	@ mkdir -p $(DATA_VOL)/mariadb

up:
	@ docker compose -f ./srcs/docker-compose.yml up $(DOCKER_FLAGS) --build

down :
	@ docker compose -f ./srcs/docker-compose.yml down

mariadb:
	@ docker run --name mariadb_shell --rm -it --env-file srcs/.env --network inception --entrypoint shell.sh srcs-mariadb

rm-volumes:
	@ if [ -z "$(shell docker volume ls -q)" ]; then \
		echo "No volumes found."; \
	else \
		docker volume rm $(shell docker volume ls -q); \
	fi

rm-images:
	@ if [ -z "$(shell docker images -qa)" ]; then \
		echo "No images found."; \
	else \
		docker rmi -f $(shell docker images -qa); \
	fi

clean-network:
	docker network prune -f

clean: down rm-volumes rm-images clean-network

fclean: clean
	rm -rf $(DATA_VOL)

re: fclean all

.PHONY: all up down mariadb clean re rm-volumes rm-images clean-network