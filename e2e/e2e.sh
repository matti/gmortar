#!/usr/bin/env sh

cd e2e/simple
  ../../exe/gmortar build asdf
cd ../..

exe/gmortar build asdf e2e/simple
exe/gmortar build asdf e2e/custom_dockerfile --dockerfile Dockerfile.custom
exe/gmortar build asdf e2e/nested_dockerfile --dockerfile layer/Dockerfile
