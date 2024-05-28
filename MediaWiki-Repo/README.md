# Project Overview
In this project, we have two main folders:

### MediaWiki: This folder contains all the code cloned from MediaWiki.
### MediaWiki-IAC: This folder is dedicated to Continuous Integration and Continuous Deployment (CI/CD) pipeline automation.

### MediaWiki-IAC Folder
Inside the MediaWiki-IAC folder, we've set up automation for CI/CD pipelines. Whenever there are code changes in either the MediaWiki or MediaWiki-IAC folders, the automation triggers. To implement this, we need to add a branch policy.

# CI/CD Pipeline Structure
## API (mediawiki-api.yaml)
## Build Phase:
This phase involves building the MediaWiki code:

1.	Building all PHP files.
2.	Updating Composer.
3.	Archiving files in zip format from the source directory.
4.	Copying files into artifacts.
5.	Publishing artifacts into the drop.
6.	Deploy Phase:
7.	Downloading artifacts.
8.	Deploying artifacts into the Azure web application.



## UI or Apps (mediawiki-app.yaml)
##Build & Deploy Phases:
1.	Building the Dockerfile to obtain the image.
2.	Saving the image into a tar file.
3.	Publishing the tar into artifacts.
4.	Publishing Build Artifacts into the drop.
5.	Downloading artifacts from the source directory to the current directory.
6.	Logging into Docker Archive.
7.	Tagging the image and pushing it to the repository.
8.	Using ARM templates to create and update the Spring Cloud.

Deployment Strategy
Based on deployment needs, we have two deployment strategies:

# Blue-Green Deployment:
9&10. Deploy code into Azure Spring Apps.

9. Blue Green Deployment
Normal [default] deployment is for staging deployments.
10. Staging Deployments:

Deploying code (image) into Azure Spring Apps.

Depending on deployment requirements, we adjust the CI/CD pipeline accordingly. We can raise a PR to trigger either the deployment to Azure Spring Apps or comment out specific tasks in the pipeline.