#!/bin/bash

cd $(dirname $0)
WORKDIR="$(realpath .)/.mlop"
SUFFIX="-internal"

sync() {
    SERVICE=$1
    rm -rf ${WORKDIR}/${SERVICE}
    git submodule update --remote ${SERVICE}
    git clone --depth 1 git@github.com:mlop-ai/${SERVICE}${SUFFIX}.git ${WORKDIR}/${SERVICE}
    rm -rf ${WORKDIR}/${SERVICE}/.git
    # rsync -av --exclude='.git' ${WORKDIR}/${SERVICE}/ ${SERVICE}
    cp -a ${WORKDIR}/${SERVICE}/* ${SERVICE}
    cd ${SERVICE}
    git add -A
    git commit -m "update"
    git push origin HEAD:main
    cd ..
}

mkdir -p $WORKDIR
sync web
sync ingest
