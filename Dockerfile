# Usa la imagen oficial más reciente de n8n como base
FROM n8nio/n8n:latest

# Cambia temporalmente al usuario root para ejecutar comandos con permisos elevados
USER root

# Crea el directorio /data (si no existe) y asigna la propiedad al usuario 'node'
RUN mkdir -p /data && chown -R node:node /data

# Vuelve al usuario 'node', recomendado para ejecutar la aplicación de forma segura
USER node

# Declara /data como un volumen persistente
VOLUME /data

# Render necesita que n8n escuche en el puerto de la variable $PORT
ENV N8N_PORT=${PORT:-5678}
ENV N8N_HOST=0.0.0.0

# Expón un puerto por defecto, aunque Render usará su propio
EXPOSE 5678
