OS := $(shell uname)

DOCKER_COMPOSE := docker-compose

service_name := web

.PHONY: build
build:
ifeq ($(OS), Linux)
    echo "Building Docker images for Linux..."
	$(DOCKER_COMPOSE) build
endif
ifeq ($(OS), Darwin)
	echo "Building Docker images for macOS..."
	$(DOCKER_COMPOSE) build
endif

.PHONY: run
run:
ifeq ($(OS), Linux)
	echo "Running Docker containers for Linux..."
	$(DOCKER_COMPOSE) up
endif
ifeq ($(OS), Darwin)
	echo "Running Docker containers for macOS..."
	$(DOCKER_COMPOSE) up
endif

.PHONY: stop
stop:
    $(DOCKER_COMPOSE) down


.PHONY: Clean
Clean: stop
    $(DOCKER_COMPOSE) rm -f
	docker system prune -f
