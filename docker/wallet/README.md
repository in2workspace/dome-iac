# README

This directory contains the files necessary to build the wallet docker image.

## Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)


## Repository Cloning and Image Building
Before running the application, you need to clone the required repositories and build the Docker images.

* Clone the in2-wallet-wca repository:
    ```bash
    git clone https://github.com/in2workspace/in2-wallet-wca.git
    ```
* Change to the dev branch and build the Docker image:
    ```bash
    cd in2-wallet-wca
    git checkout develop
    docker build -t wallet-wca .
    ```
* Clone the in2-wallet-wda repository:
    ```bash
    git clone https://github.com/in2workspace/in2-wallet-wda.git
    ```
* Change to the dev branch and build the Docker image:
    ```bash
    cd in2-wallet-wda
    git checkout develop
    docker build -t wallet-wda .
    ```

## Build

Go to the root directory of the project and run the following command:
```bash
cd docker/wallet
```

Execute the following command to deploy the docker compose:
```bash
docker-compose up -d
```

## Wallet Application
The wallet application is available at http://localhost:4200

## Version and Modification Date
Version: 1.1.0
Modification Date: October 23, 2023