.PHONY: build test verify up down run shell migrate seed lint format clean security help logs

COMPOSE_PROJECT_NAME ?= laravel-ddd
DOCKER_COMPOSE ?= docker compose -p $(COMPOSE_PROJECT_NAME) -f server/docker-compose.yml

help:
	@echo "Laravel DDD - Available targets:"
	@echo "  make build     - Build all Docker images"
	@echo "  make test      - Run test suite in Docker"
	@echo "  make verify    - Build + test (quality gate)"
	@echo "  make up        - Start containers (depends on verify)"
	@echo "  make down      - Stop and remove containers"
	@echo "  make run       - Run the application"
	@echo "  make shell     - Open shell in PHP container"
	@echo "  make migrate   - Run database migrations"
	@echo "  make seed      - Run database seeders"
	@echo "  make lint      - Run PHP-CS-Fixer"
	@echo "  make format    - Auto-format code with Pint"
	@echo "  make security  - Run dependency vulnerability audit"
	@echo "  make logs      - Follow container logs"
	@echo "  make clean     - Remove containers and volumes (WARNING: deletes DB data)"

build:
	$(DOCKER_COMPOSE) build

test:
	$(DOCKER_COMPOSE) run --rm phpunit

verify: build test

up: verify
	$(DOCKER_COMPOSE) up -d nginx php pgsql redis

down:
	$(DOCKER_COMPOSE) down

run:
	$(DOCKER_COMPOSE) up -d

shell:
	$(DOCKER_COMPOSE) run --rm php sh

migrate:
	$(DOCKER_COMPOSE) run --rm artisan migrate

seed:
	$(DOCKER_COMPOSE) run --rm artisan db:seed

lint:
	$(DOCKER_COMPOSE) run --rm composer run-script lint 2>/dev/null || \
		$(DOCKER_COMPOSE) run --rm php vendor/bin/php-cs-fixer fix --dry-run --diff 2>/dev/null || \
		echo "No linter configured"

format:
	$(DOCKER_COMPOSE) run --rm php vendor/bin/pint 2>/dev/null || \
		echo "Pint not installed"

security:
	$(DOCKER_COMPOSE) run --rm composer audit 2>/dev/null || \
		echo "Composer audit not available"

logs:
	$(DOCKER_COMPOSE) logs -f

clean:
	@echo "WARNING: This will delete all container volumes including database data."
	@read -p "Are you sure? (y/N) " confirm && [ "$$confirm" = "y" ] || exit 1
	$(DOCKER_COMPOSE) down -v
