# README

This directory contains the files necessary to build the wallet docker image.

## Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Important Instructions Before Building

Before proceeding with building and deploying the Docker containers for the wallet application, it is essential to follow the steps outlined in the READMEs of the following components:

1) [Identity provider](https://github.com/in2workspace/in2-dome-iac/tree/main/wallet/prod/identity-provider/README.md)

2) [Vault](https://github.com/in2workspace/in2-dome-iac/tree/main/wallet/prod/vault/README.md)

Once you have completed the above steps, you can proceed with building and deploying the wallet application.

## Build

Go to the root directory of the project and run the following command:
```bash
cd wallet/prod
```

Execute the following command to deploy the docker compose:
```bash
docker-compose -f docker-compose-prod.yml up -d
```

## Wallet Application
The wallet application is available at http://localhost:4200

## Version and Modification Date
Version: 2.0.0
Modification Date: December 21, 2023