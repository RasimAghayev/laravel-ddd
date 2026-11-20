# syntax=docker/dockerfile:1

# Stage 1: base — nginx + config
FROM nginx:stable-alpine AS base

COPY server/nginx/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html

# Stage 2: runtime — slim nginx runtime
FROM nginx:stable-alpine AS runtime

COPY --from=base /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html

EXPOSE 80 443

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:80/health/live || exit 1

CMD ["nginx", "-g", "daemon off;"]
