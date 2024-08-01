#!/bin/bash

set -ex

# Running the test program requires and iRODS server to be running. For now, we
# just test that the program builds.
make test_client
