#!/bin/bash -l

set -x

echo $PWD
ls -l

exec "$1"
