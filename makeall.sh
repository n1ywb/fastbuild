#!/usr/bin/env bash

pushd fast; make; popd
pushd crunch; make; popd
pushd iecwind; make; popd
