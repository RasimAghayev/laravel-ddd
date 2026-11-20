# syntax=docker/dockerfile:1

# Stage 1: base — pinned PHP + system deps + extensions
FROM php:8.6-fpm AS base

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpng-dev \
    libpq-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    curl \
    unzip \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_pgsql pdo_mysql mysqli mbstring exif pcntl bcmath gd zip \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Stage 2: deps — Composer install with BuildKit cache mount
FROM base AS deps

WORKDIR /var/www/html/be

COPY src/be/composer.json src/be/composer.json* ./
RUN --mount=type=cache,target=/root/.composer/cache \
    composer install --no-ansi --no-interaction --no-progress --prefer-dist --no-dev || true

# Stage 3: build — copy application code
FROM base AS build

WORKDIR /var/www/html/be

COPY src/be/ /var/www/html/be/
COPY --from=deps /var/www/html/be/vendor /var/www/html/be/vendor

RUN chown -R www-data:www-data /var/www/html/be/storage /var/www/html/be/bootstrap/cache \
    && chmod -R 777 /var/www/html/be/storage /var/www/html/be/bootstrap/cache

# Stage 4: test — runs the test suite; build fails if tests fail
FROM build AS test

USER www-data

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD php -r "php_sapi_name() === 'cli' && exit(0);" || exit 1

CMD ["php", "artisan", "test"]

# Stage 5: runtime — slim production runtime, no compilers, no dev tools
FROM php:8.6-fpm AS runtime

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    libzip-dev \
    zip \
    curl \
    && docker-php-ext-install pdo pdo_pgsql pdo_mysql mbstring bcmath zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/be

COPY --from=build --chown=www-data:www-data /var/www/html/be /var/www/html/be

RUN chown -R www-data:www-data /var/www/html/be/storage /var/www/html/be/bootstrap/cache \
    && chmod -R 777 /var/www/html/be/storage /var/www/html/be/bootstrap/cache

USER www-data

EXPOSE 9000

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD pgrep -x php-fpm > /dev/null || exit 1

CMD ["php-fpm"]
