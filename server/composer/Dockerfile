# syntax=docker/dockerfile:1

# Stage 1: base — composer image
FROM composer:2 AS base

# Stage 2: deps — composer install with BuildKit cache mount
FROM base AS deps

WORKDIR /var/www/html/be

COPY src/be/composer.json src/be/composer.json* ./
RUN --mount=type=cache,target=/root/.composer/cache \
    composer install --no-ansi --no-interaction --no-progress --prefer-dist --no-dev || true

# Stage 3: runtime — composer runtime for running composer commands
FROM base AS runtime

WORKDIR /var/www/html/be

COPY --from=deps /var/www/html/be/vendor /var/www/html/be/vendor
