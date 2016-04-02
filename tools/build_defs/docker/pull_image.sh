#!/bin/bash -e

RUNFILES=${RUNFILES:-$0.runfiles}
source "${RUNFILES}/external/docker/docker_env.sh"

IMAGE=$1
SAVED_IMAGE=$2

docker pull ${IMAGE}
docker save -o ${SAVED_IMAGE} ${IMAGE}
