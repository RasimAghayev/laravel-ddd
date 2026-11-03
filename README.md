# Laravel DDD ()

![Views](https://hits.sh/github.com/RasimAghayev/laravel-ddd.svg?label=views&color=0e75b6)


# Create Laravel project
```shell
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
```

# Build Container

```shell
docker-compose up -d --build nginx
```


# Sushi kim API

### 0. Install composer
```bash
docker-compose run --rm composer install
```

### 1.Configure .env

### 2. Create storage link
```bash
docker compose run --rm artisan  storage:link
```
### 3 Migrate our migration
```bash
docker compose run --rm artisan  migrate
```
### 4. Seed Role and Permission and default user (login: admin, email: admin@test.ru, password: password)
```bash
docker compose run --rm artisan  db:seed
```
### 5. Generate swagger docs swagger url (/api/documentation)
```bash
docker compose run --rm artisan  l5-swagger:generate
```
### 6. Generate jwt secret
```bash
docker compose run --rm artisan  jwt:secret
```

### 7. Clear all cookie data
```bash
docker compose run --rm artisan optimize:clear
```

### 8. AppName
```bash
docker compose run --rm artisan app:name DDD
```
