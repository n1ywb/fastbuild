#!/usr/bin/env bash
rm -rf build
mkdir build
pushd build
ln -s ../externals/nrel-fast/Compiling/makefile .
ln -s ../externals/nrel-fast/Source/* .
ln -s ../externals/nrel-aerodyn/Source/* .
ln -s ../externals/nrel-inflowwind/Source/* .
ln -s ../externals/nrel-nwtc/source/* .
popd

