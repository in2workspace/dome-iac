# Reverse Proxy Configuration

This is a simple guide to configure a reverse proxy with TLS termination using Nginx.

## How to Run

1. Generate self-signed certificate.
2. Run the following command:
    ```bash
    docker-compose up -d
    ```


## Generate Self-Signed Certificate

This is a simple guide to generate a self-signed certificate for testing purposes. The certificate is valid for 365 days and the private key is 2048 bits.

1. Generate Private Key
    ```bash
    openssl genpkey -algorithm RSA -out server.key -pkeyopt rsa_keygen_bits:2048
    ```
2. Generate CSR
    ```bash
    openssl req -new -key server.key -out server.csr
    ```
   
   ```text
   Country Name (2 letter code) [AU]:ES
   State or Province Name (full name) [Some-State]:Barcelona
   Locality Name (eg, city) []:Barcelona
   Organization Name (eg, company) [Internet Widgits Pty Ltd]:MyCompany, Inc.
   Organizational Unit Name (eg, section) []:IT
   Common Name (e.g. server FQDN or YOUR name) []:mycompany.com
   Email Address []:mycompany@example.com
   ```
   
   > NOTE: Password is 123456 and is for testing purposes only.
   
3. Generate Self-Signed Certificate
    ```bash
    openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
    ```
