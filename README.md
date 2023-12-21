# README - Overview of DOME Components

## Introduction 

This documentation provides an overview of the two key components in the DOME ecosystem: the Blockchain Connector and the Wallet application. Each component plays a crucial role in our system, addressing different aspects of blockchain-based data federation and credential management.

## Components

### Blockchain Connector

The Blockchain Connector is the component responsible for all interactions with the Blockchain as the decentralization mechanism in DOME. It connects to EBSI-compatible Blockchains (as of now, they need to support the Ethereum API) and requires the ability to sign transactions with the identity of the participant. 

When receiving a notification about entity changes from the NGSI-LD Context Broker, the Blockchain Connector has to create the corresponding Hashlink and publish it to the Blockchain. Additionally the Blockchain Connector does listen to events on the Blockchain and evaluates the incoming ones. The participant using the access node can be notified of events of interest. The Hashlink from the event has to be resolved and will be used to create the entity in the local Context Broker.

For implementation details and setup, please refer to the [Blockchain Connector README.](https://github.com/in2workspace/in2-dome-iac/tree/main/blockchain-connector/prod/README.md)

### Wallet

The Wallet is a sophisticated tool designed to facilitate the issuance and exchange of verifiable credentials, using these for authentication purposes. Developed with a microservices architecture, it segregates responsibilities across various components to ensure efficient management. The application empowers users to manage the flows of verifiable credentials and securely stores user data via an Identity Provider. Additionally, it employs Vault for the safekeeping of private keys, which are crucial for signing verifiable presentations.

For implementation details and setup, please refer to the [Wallet README.](https://github.com/in2workspace/in2-dome-iac/tree/main/wallet/prod/README.md)

## Version and Modification Date
Version: 2.0.0
Modification Date: December 21, 2023