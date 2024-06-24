# build-irods-client-action Docker Action

A GitHub Action providing a Docker container in which to build older iRODS clients.

GitHub Actions requires versions of Node.js whose binary releases no longer support older
versions of Linux, such as those we currently need to build iRODS clients. This means that
builds of clients for older iRODS clients will always fail unless they can be separated
from any other Actions in the workflow.

Actions offers two ways to specify a Docker image:

1. An image per job; all steps in the job run in the same container.
2. A Docker-based Action per step.

Option 1. is no longer available. This repository provides option 2.

See `Dockerfile` for which iRODS build environment container is used, where that
value is hard-coded.

## Inputs

## `build-script`

**Required** The relative path in the work directory of a build script to run in
the container. Defaults to `".github/workflows/build.sh"`

## Outputs

## None

## Example usage

```yaml
- name: "Build Package"
  uses: wtsi-npg/build-irods-client-action@v1
  with:
    build-script:
      .github/workflows/build.sh
```
