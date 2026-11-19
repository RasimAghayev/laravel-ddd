# Operations

## Monitoring

* Health endpoint: `GET /api/v1/health`
* Container logs: `make logs`
* Application logs: `storage/logs/laravel.log`

## Logging

Laravel default logging (single/daily channels). Logs must not contain secrets or PII.

## Backup

Database backup: `pg_dump` from the pgsql container. No automated backup configured yet.

## Scaling

The application is stateless. Scale horizontally by running multiple PHP-FPM containers behind a load balancer. Shared database and Redis.

## Maintenance

* Run `composer install` to update dependencies
* Run `php artisan migrate` for schema changes
* Run `php artisan optimize:clear` to clear caches
* Run `php artisan config:cache` for production config caching

## Incident Response

1. Check health endpoint
2. Review container logs
3. Check database connectivity
4. Check Redis connectivity
5. Escalate to security@rasimaghayev.com for security incidents
