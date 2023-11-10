#!/bin/sh

# Configuración del entorno
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='my-custom-root-token'

# Verificar si Vault está inicializado y desencriptado
if vault status | grep -q 'Initialized     true'; then
    echo "Vault ya está inicializado."
else
    # Inicializar Vault si es necesario. Guarda las claves en un lugar seguro.
    vault operator init > /vault/file/keys.txt
fi

# Extraer las claves del archivo keys.txt
# Asegúrate de que este método de extracción coincide con el formato del archivo keys.txt
KEY1=$(sed -n '1p' /vault/file/keys.txt | cut -d' ' -f4)
KEY2=$(sed -n '2p' /vault/file/keys.txt | cut -d' ' -f4)
KEY3=$(sed -n '3p' /vault/file/keys.txt | cut -d' ' -f4)

# Desencriptar utilizando las claves
vault operator unseal $KEY1
vault operator unseal $KEY2
vault operator unseal $KEY3

echo "Vault ha sido desencriptado."