# Vault

## Introduction
HashiCorp Vault is a robust tool for managing sensitive data such as tokens, passwords, certificates, and encryption keys. This README guides you through implementing Vault in a local development environment for the Wallet Crypto application, focusing on storing private keys.

## Objective
The goal is to integrate Vault to securely handle private keys, facilitating secure access and management during local development.

## How-To retrieve and Use Vault Token for Wallet-Crypto

1. Accessing the Vault Container
Open your terminal and access the Vault
```sh
docker exec -it vault
```
2. Retrieving the Vault Token
Once inside the Vault container:
- Navigate to the Vault directory:
```sh
docker exec -it vault
```
- Display the Vault's root token:
```sh
cat root_token.txt
```
- Copy the displayed token.

3. Configuring the Token in Docker Compose
- Open your docker-compose.yaml file on docker/wallet/local.
- Locate the service configuration for wallet-crypto.
- And paste the token on the VAULT_TOKEN enviroment variable and save your changes.

## Conclusion
You have successfully retrieved the Vault token and configured it for the Wallet-Crypto service in your local Docker environment. This token is crucial for enabling secure interactions with the Vault for key management during development.

Version and Creation Date
Version: 1.0.0
Creation Date: November 13, 2023