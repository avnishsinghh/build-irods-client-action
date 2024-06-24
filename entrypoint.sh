#!/bin/bash -l

set -x

echo "Running $1"

pwd
ls -l

exec "$1"
