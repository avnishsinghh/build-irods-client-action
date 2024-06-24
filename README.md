# build-irods-client
GitHub Action providing a Docker container in which to build older iRODS clients

GitHub Actions requires versions of Node.js whose binary releases no longer support older
versions of Linux, such as those we currently need to build iRODS clients. This means that
builds of clients for older iRODS clients will always fail unless they can be separated
from any other Actions in the workflow.

Actions offers two ways to specify a Docker image:

1. An image per job; all steps in the job sun in the same container.
2. A Docker-based Action per step.

Option 1. is no longer available, which is why this repository exists. An Action requires
its own git repository.
