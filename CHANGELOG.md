# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2023-12-21
### Added

- Introduction of two operational profiles: Test and Production.
- Test profile uses Docker images tagged with 'snapshot' for non-production testing.
- Production profile uses Docker images without 'snapshot' tag for production use.
- Updated READMEs for Blockchain Connector and Wallet application with detailed implementation guidelines and setup instructions.
- New demonstration guide for federating data between two marketplace platforms using a blockchain node.
- Docker Compose configurations for deploying Marketplace1 and Marketplace2 in production environment.

### Changed

- Updated the Wallet Docker build process to include prerequisite steps involving Identity Provider and Vault READMEs.
- Modified the version and modification date in all README documents to reflect the latest updates.

## [1.1.0] - 2023-12-05
### Added

- New client auth-client for login purposes

### Changed

- Clientid, and name of wallet-client to user-registry-client

## [1.0.0] - 2023-11-21
### Added


[release]: 
- [v1.0.0]()
- [v1.1.0]()
- [v2.0.0]()
