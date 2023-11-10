#!/bin/sh
pushd ~/setup-nixos
sudo nixos-rebuild switch --flake .#vm
popd
