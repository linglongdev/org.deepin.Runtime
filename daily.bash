#!/bin/bash
set -x
set -e
t=$(date +%s)
sed -i "s#version: 23.2.0.*#version: 23.2.0.$t#" linglong.yaml
sed -i "s#version: 23.2.0.*#version: 23.2.0.$t#" arm64/linglong.yaml
rm -rf vscode-linglong || true
git clone https://github.com/myml/vscode-linglong.git --depth 1
cd vscode-linglong && go run ./src/tools ../linglong.yaml && go run ./src/tools ../arm64/linglong.yaml
