# Configuración para Railway - Instrucciones de Despliegue

## Variables de Entorno Requeridas

Para eliminar los warnings durante el despliegue, necesitas configurar estas variables de entorno en Railway:

### Variables Básicas (REQUERIDAS)
```bash
APP_NAME="Logros LS"
APP_ENV=production
APP_DEBUG=false
APP_KEY=base64:tu_clave_generada_aqui
APP_URL=https://tu-app.railway.app
```

### Variables de Base de Datos (Railway las configurará automáticamente)
```bash
DB_CONNECTION=mysql
DB_HOST=auto_configurado_por_railway
DB_PORT=3306
DB_DATABASE=auto_configurado_por_railway
DB_USERNAME=auto_configurado_por_railway
DB_PASSWORD=auto_configurado_por_railway
```

### Variables de Configuración (OPCIONALES - para eliminar warnings)
```bash
APP_LOCALE=es
APP_FALLBACK_LOCALE=es
LOG_LEVEL=error
CACHE_STORE=database
SESSION_DRIVER=database
QUEUE_CONNECTION=database
FILESYSTEM_DISK=local
MAIL_MAILER=log
BROADCAST_CONNECTION=log

# Variables vacías para evitar warnings
DB_CACHE_CONNECTION=""
AWS_BUCKET=""
DB_CACHE_LOCK_CONNECTION=""
DB_CACHE_LOCK_TABLE=""
AWS_URL=""
MEMCACHED_PERSISTENT_ID=""
MEMCACHED_USERNAME=""
AWS_ENDPOINT=""
MEMCACHED_PASSWORD=""
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
LOG_SLACK_WEBHOOK_URL=""
DYNAMODB_ENDPOINT=""
MAIL_LOG_CHANNEL=""
DB_URL=""
PAPERTRAIL_URL=""
DB_QUEUE_CONNECTION=""
PAPERTRAIL_PORT=""
SESSION_DOMAIN=""
LOG_STDERR_FORMATTER=""
MAIL_SCHEME=""
SQS_SUFFIX=""
MAIL_URL=""
POSTMARK_TOKEN=""
SESSION_SECURE_COOKIE=""
```

## Pasos para Configurar en Railway

1. Ve a tu proyecto en Railway
2. Selecciona tu servicio
3. Ve a la pestaña "Variables"
4. Agrega las variables una por una o usa el import masivo
5. Guarda y redespliegua

## Generar APP_KEY

Para generar una clave de aplicación válida, ejecuta:
```bash
php artisan key:generate --show
```

Copia el resultado y úsalo como valor para APP_KEY en Railway.

## Verificación

Una vez configuradas las variables, el despliegue debería completarse sin warnings.
