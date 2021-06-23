#!/bin/bash

version=migrate-v3

set -e -o pipefail

TMP="$(mktemp -d)"
trap "rm -rf $TMP" EXIT

rm -rf ood
mkdir -p ood/src

(
  cd "$TMP"
  git clone https://github.com/tmattio/ood.git
  cd ood
  git checkout $version
)

SRC=$TMP/ood

cp -v "$SRC"/LICENSE.md ood
cp -v "$SRC"/src/ood/*.{ml,mli} ood/src
cp -Rv "$SRC"/data/media/ ../public/
