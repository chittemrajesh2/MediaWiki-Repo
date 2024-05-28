# CI/CD Pipeline for MediaWiki Deployment "mediawiki-app.yaml"

This README file provides a detailed explanation of each step in the provided Azure DevOps YAML pipeline configuration for deploying MediaWiki using Docker and Azure services.

## Pipeline Overview

The pipeline is triggered by changes to the `main` branch and uses an Ubuntu-based agent. The pipeline consists of a single stage, `BuildAndPush`, which includes the following steps:

1. Build a Docker image for MediaWiki.
2. Save the Docker image as a tar file and publish it as an artifact.
3. Download the build artifacts.
4. Log in to Azure Container Registry (ACR).
5. Retag and push the Docker image to ACR.
6. Deploy the application to Azure Spring Cloud using an ARM template.
7. Optionally, create a green deployment for blue-green deployment strategy.


# CI/CD Pipeline for MediaWiki Deployment  "mediawiki-api.yaml"

## Pipeline Overview

## The pipeline consists of two stages:

1. **Build**: This stage is responsible for setting up the PHP environment, running composer, executing tests, and archiving the MediaWiki files.
2. **Deploy**: This stage handles the deployment of the archived MediaWiki files to an Azure Web App.

# CI/CD Pipeline for MediaWiki Deployment mediawiki-script.yaml"

## Pipeline Overview

The pipeline consists of a single stage:

1. **Build**: This stage runs a bash script to set up MediaWiki on a target environment.

