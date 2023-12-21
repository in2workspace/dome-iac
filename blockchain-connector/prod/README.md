# README

## Introduction

This guide provides a demonstration of federating data between two distinct marketplace platforms using a blockchain node. It highlights the capability of blockchain technology in maintaining data integrity and consistency across different marketplaces.

## Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- An active internet connection is required for testing and operation.

## Build

Go to the root directory of the project and run the following command:
```bash
cd blockchain-connector/prod
```

Execute the following command to deploy the docker compose of marketplace1:
```bash
docker-compose -f docker-compose-prod-mkt1.yml up -d
```

Then deploy the docker compose of marketplace2:
```bash
docker-compose -f docker-compose-prod-mkt2.yml up -d
```

## Version and Modification Date
Version: 2.0.0
Modification Date: December 21, 2023