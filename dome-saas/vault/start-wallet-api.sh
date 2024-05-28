#!/bin/sh

echo "Esperando al archivo token..."

# Esperar a que el archivo de token esté disponible
while [ ! -f /vault/root_token.txt ]
do
  echo "Token aún no disponible, esperando..."
  sleep 1  # Espera 1 segundo antes de verificar de nuevo
done

echo "Token encontrado, leyendo token..."

# Leer el token y exportarlo como una variable de entorno
HASHICORP_VAULT_TOKEN=$(cat /vault/root_token.txt)
export HASHICORP_VAULT_TOKEN

echo "Token establecido: $HASHICORP_VAULT_TOKEN"

exec java -jar /app/wallet-api.jar

