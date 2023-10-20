# Identity Service

## Introduction
Keycloak is an open-source Identity Provider (IdP) that enables the management and authentication of users in modern applications. This solution has been implemented to securely and effectively manage the users of the Wallet application.

## Solution Objective
In this context, Keycloak serves the role of centralizing and standardizing user authentication and authorization. It allows for detailed control over who has access to what within the application and simplifies the management of users and their permissions.

## Implementation
Keycloak's configuration has been customized to fit the specific needs of the Wallet application. This customization is carried out through a Realm, a configuration that defines how users are authenticated and authorized and what resources they have available.

## WalletIdP REALM Configuration
For our Wallet application, we've set up a custom REALM named "WalletIdP". Below are the specific configurations of our REALM:

### Client Configuration:
- **Client Name:** wallet-client   
- **Client Secret:** fV51P8jFBo8VnFKMMuP3imw3H3i5mNck

This client configuration is essential for the Wallet application to interact with Keycloak for authentication and authorization purposes.

## How-to: Use Keycloak Admin Console

1. Start by setting up your local environment.
2. Navigate to the docker/wallet directory.
3. Follow the instructions in the README file to set up your local environment.
4. Once your environment is up and running, visit the following URL: (http://localhost:8084/admin/WalletIdP/console/)
5. Log in using the following credentials:
    - **Username:** adminWallet
    - **Password:** adminPass 

> Note: If you prefer to log in with the Keycloak admin rather than the wallet admin, visit the following URL: [http://localhost:8084/admin/master/console/](http://localhost:8084/admin/master/console/). However, keep in mind that this 'admin' user is not part of the WalletIdP application but belongs to the Master application. To access with the Keycloak admin use this credentials:
   - **Username:** adminWallet
   - **Password:** adminPass 

6. Once inside, you can act as an administrator and manage your Wallet Realm if you logged in as adminWallet. Alternatively, if you logged in as the Keycloak admin, you can manage all the Realms.
## How-to: Obtain User Token

To retrieve a user's token in Keycloak via REST API, regardless of their role, use the following endpoint and parameters. Here's a practical example using curl to obtain the token for userWallet:

```sh
curl --location 'http://localhost:8084/realms/WalletIdP/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'client_id=wallet-client' \
--data-urlencode 'username=userWallet' \
--data-urlencode 'password=userPass' \
--data-urlencode 'client_secret=fV51P8jFBo8VnFKMMuP3imw3H3i5mNck' \
--data-urlencode 'grant_type=password'
```
> Note: When communicating between Docker containers, instead of using `localhost`, you should use `wallet-identity-provider`, which is the name of the container. Adjust your requests accordingly if you're trying to communicate from a Docker environment.

## Version and Creation Date
Version: 1.0.0
Creation Date: October 19, 2023

